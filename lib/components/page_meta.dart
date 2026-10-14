import 'dart:async';

import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart' hide Document;

import '../content/company.dart';

/// Sets the document title and social meta tags for the page that is showing, and positions the viewport when a
/// page appears: at the URL's `#anchor` if it has one, otherwise at the top (the router keeps the previous scroll
/// position, and the browser cannot scroll to an anchor that has not rendered yet).
///
/// This updates the live document instead of rendering `Document.head` (which `Scaffold(seo: ...)` also
/// does). In client mode, a `Document.head` fragment inside a route cannot be removed when the router swaps
/// pages, and Jaspr throws "Cannot remove fragment from a different parent" on the first link click.
/// The global defaults still come from `NakiApp.router(seo: ...)`.
class PageMeta extends StatefulComponent {
  const PageMeta(this.seo, {super.key});

  final PageSeo seo;

  @override
  State<PageMeta> createState() => _PageMetaState();
}

class _PageMetaState extends State<PageMeta> {
  Timer? _settleTimer;
  StreamSubscription<Object>? _hashListener;
  final _interactionListeners = <StreamSubscription<Object>>[];

  @override
  void dispose() {
    _hashListener?.cancel();
    _stopSettling();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _apply();
    _showPage();
    // Following an in-page link such as /#products changes only the hash. The browser then looks for the
    // anchor but the framework's own handling swallows the scroll, so scroll to it here.
    _hashListener = EventStreamProviders.hashChangeEvent.forTarget(window).listen((_) {
      if (window.location.hash.length > 1) _scrollToHash();
    });
  }

  @override
  void didUpdateComponent(PageMeta oldComponent) {
    super.didUpdateComponent(oldComponent);
    _apply();
    // Only a different page moves the scroll, so an ordinary rebuild of the same page never jumps.
    if (oldComponent.seo.title != component.seo.title) _showPage();
  }

  /// Positions the viewport for a page that just appeared: at its `#anchor` when the URL has one, else the top.
  void _showPage() {
    if (window.location.hash.length > 1) {
      _scrollToHash();
    } else {
      window.scrollTo(ScrollToOptions(top: 0, left: 0, behavior: 'instant'));
    }
  }

  /// The app renders in the browser, so the anchor's element does not exist when the browser first looks for it
  /// and it never scrolls. Scroll once the page has built, then keep the target pinned for a few seconds: lazy
  /// images and fonts settle after the first frame and move content above it. Pinning stops the moment the
  /// visitor scrolls, clicks, touches or presses a key.
  void _scrollToHash() {
    _stopSettling();

    final id = Uri.decodeComponent(window.location.hash.substring(1));
    var interacted = false;

    void pin() {
      final target = document.getElementById(id);
      if (target == null || target.getBoundingClientRect().top.abs() < 2) return;
      target.scrollIntoView(ScrollIntoViewOptions(behavior: 'instant', block: 'start'));
    }

    for (final provider in [
      EventStreamProviders.wheelEvent,
      EventStreamProviders.touchStartEvent,
      EventStreamProviders.keyDownEvent,
      EventStreamProviders.mouseDownEvent,
    ]) {
      _interactionListeners.add(provider.forTarget(window).listen((_) => interacted = true));
    }

    context.binding.addPostFrameCallback(pin);
    _settleTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (interacted || timer.tick > 30) {
        _stopSettling();
      } else {
        pin();
      }
    });
  }

  void _stopSettling() {
    _settleTimer?.cancel();
    _settleTimer = null;
    for (final listener in _interactionListeners) {
      listener.cancel();
    }
    _interactionListeners.clear();
  }

  void _apply() {
    final seo = component.seo;
    document.title = seo.title;
    _setMeta('name', 'description', seo.description);
    _setMeta('property', 'og:title', seo.title);
    _setMeta('property', 'og:description', seo.description);
    _setMeta('name', 'twitter:title', seo.title);
    _setMeta('name', 'twitter:description', seo.description);
  }

  /// Updates `<meta [attribute]="[key]">`, creating it when the page does not have one yet.
  void _setMeta(String attribute, String key, String content) {
    final head = document.head;
    if (head == null) return;

    var tag = head.querySelector('meta[$attribute="$key"]');
    if (tag == null) {
      tag = document.createElement('meta')..setAttribute(attribute, key);
      head.append(tag);
    }

    tag.setAttribute('content', content);
  }

  @override
  Component build(BuildContext context) => const .empty();
}
