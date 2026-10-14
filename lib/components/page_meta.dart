import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart' hide Document;

import '../content/company.dart';

/// Sets the document title and social meta tags for the page that is showing, and returns the viewport to
/// the top when the router swaps to a different page (the router keeps the previous scroll position).
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
  @override
  void initState() {
    super.initState();
    _apply();
    _scrollToTop();
  }

  @override
  void didUpdateComponent(PageMeta oldComponent) {
    super.didUpdateComponent(oldComponent);
    _apply();
    // Only a different page resets the scroll, so an ordinary rebuild of the same page never jumps.
    if (oldComponent.seo.title != component.seo.title) _scrollToTop();
  }

  /// Jumps to the top without the smooth-scroll animation. A `#anchor` in the URL keeps its own target.
  void _scrollToTop() {
    if (window.location.hash.isNotEmpty) return;
    window.scrollTo(ScrollToOptions(top: 0, left: 0, behavior: 'instant'));
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
