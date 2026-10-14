import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/naki_ui.dart';

import '../content/company.dart';
import 'page_meta.dart';
import 'site_footer.dart';
import 'site_header.dart';

/// Header, page content and footer shared by every route.
///
/// This is deliberately a plain layout rather than Naki's `Scaffold`: `Scaffold` renders
/// a `Document.head` fragment per page, which breaks client-side route changes
/// (see [PageMeta]).
class PageShell extends StatelessComponent {
  const PageShell({required this.children, required this.seo, super.key});

  final List<Component> children;
  final PageSeo seo;

  @override
  Component build(BuildContext context) {
    return div(classes: 'page', [
      PageMeta(seo),
      MediaQueryProvider(builder: (_) => const SiteHeader()),
      main_(classes: 'page-main', children),
      const SiteFooter(),
    ]);
  }
}

/// A full-width band with an optional background and a centred 1200px content column.
class Band extends StatelessComponent {
  const Band({
    required this.children,
    this.id,
    this.variant = '',
    this.top = 96,
    this.bottom = 96,
    super.key,
  });

  final List<Component> children;
  final String? id;

  /// Modifier classes: `band--subtle`, `band--white`, `band--rose`, `band--ruled`.
  final String variant;

  /// Vertical padding in pixels. It shrinks by about 40% on phones (see `.band-inner`).
  final double top;
  final double bottom;

  @override
  Component build(BuildContext context) {
    return section(
      id: id,
      classes: 'band $variant'.trim(),
      [
        div(
          classes: 'container band-inner',
          styles: Styles(raw: {'--band-pt': '${top}px', '--band-pb': '${bottom}px'}),
          children,
        ),
      ],
    );
  }
}
