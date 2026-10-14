import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

/// A navigation link styled as a button. Use Naki's `Button` for actions, `Link` for navigation.
enum LinkButtonStyle { primary, light }

class LinkButton extends StatelessComponent {
  const LinkButton({
    required this.label,
    required this.to,
    this.style = LinkButtonStyle.primary,
    this.small = false,
    this.external = false,
    super.key,
  });

  final String label;
  final String to;
  final LinkButtonStyle style;
  final bool small;
  final bool external;

  @override
  Component build(BuildContext context) {
    final variant = style == LinkButtonStyle.primary ? 'btn--primary' : 'btn--light';
    final classes = 'btn $variant${small ? ' btn--sm' : ''}';
    return _SiteLink(to: to, classes: classes, external: external, child: .text(label));
  }
}

/// An in-text link, e.g. "Explore PoddinPay →". Pass [external] for links that leave the site.
class TextLink extends StatelessComponent {
  const TextLink({required this.label, required this.to, this.external = false, this.arrow = true, super.key});

  final String label;
  final String to;
  final bool external;
  final bool arrow;

  @override
  Component build(BuildContext context) {
    return _SiteLink(to: to, classes: 'lnk', external: external, child: .text(arrow ? '$label →' : label));
  }
}

/// Router [Link] for in-app routes. Anchors (`/#contact`) and external URLs use a plain `<a>` so the
/// browser handles scrolling and navigation natively.
class _SiteLink extends StatelessComponent {
  const _SiteLink({required this.to, required this.classes, required this.child, this.external = false});

  final String to;
  final String classes;
  final bool external;
  final Component child;

  @override
  Component build(BuildContext context) {
    if (external) {
      return a(
        href: to,
        classes: classes,
        target: Target.blank,
        attributes: const {'rel': 'noopener noreferrer'},
        [child],
      );
    }
    if (to.contains('#')) return a(href: to, classes: classes, [child]);
    return Link(to: to, classes: classes, child: child);
  }
}
