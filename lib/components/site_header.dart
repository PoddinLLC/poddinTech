import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../content/company.dart';
import '../theme/palette.dart';
import 'links.dart';

class _NavItem {
  const _NavItem(this.label, this.to, {this.isRoute = false});

  final String label;
  final String to;

  /// Route links navigate client-side. Others are `/#section` anchors on the homepage.
  final bool isRoute;
}

const _navItems = [
  _NavItem('About', '/about', isRoute: true),
  _NavItem('Products', '/#products'),
  _NavItem('Services', '/#services'),
  _NavItem('Leadership', '/#leadership'),
  _NavItem('Press', '/#press'),
];

/// Logo and wordmark that return to the homepage.
class Brand extends StatelessComponent {
  const Brand({this.size = 34, this.fontSize = 21, this.showName = true, super.key});

  final double size;
  final double fontSize;
  final bool showName;

  @override
  Component build(BuildContext context) {
    return Link(
      to: '/',
      classes: 'brand',
      attributes: const {'aria-label': 'Poddin home'},
      children: [
        Image(
          'images/logo.png',
          size: SizeConstraints(width: Dim.px(size), height: Dim.px(size)),
          fit: ObjectFit.contain,
        ),
        if (showName)
          span(styles: Styles(fontSize: fontSize.px, fontWeight: .w600, letterSpacing: (-0.01).em), [
            .text(Company.shortName),
          ]),
      ],
    );
  }
}

/// Site header. On phones the links move into a drawer opened from a menu button.
class SiteHeader extends StatefulComponent {
  const SiteHeader({super.key});

  @override
  State<SiteHeader> createState() => _SiteHeaderState();
}

class _SiteHeaderState extends State<SiteHeader> {
  final drawer = OverlayController();

  @override
  void dispose() {
    drawer.dispose();
    super.dispose();
  }

  bool _isActive(_NavItem item, String location) => item.isRoute && location.startsWith(item.to);

  Component _desktopNavItems(String location) {
    return nav(
      classes: 'site-nav',
      attributes: const {'aria-label': 'Primary'},
      [
        for (final item in _navItems)
          if (item.isRoute)
            Link(
              to: item.to,
              classes: 'nav-link${_isActive(item, location) ? ' active' : ''}',
              child: .text(item.label),
            )
          else
            a(href: item.to, classes: 'nav-link', [.text(item.label)]),
      ],
    );
  }

  List<Component> _desktopActions(String location) {
    return [
      const Brand(showName: false),
      _desktopNavItems(location),
    ];
  }

  Component _menuButton() {
    return Button.icon(
      LucideIcons.icon_menu,
      size: 22,
      foregroundColor: Palette.ink,
      backgroundColor: Palette.white,
      border: BorderData(color: Palette.line, width: const Dim.px(1)),
      width: const Dim.px(42),
      height: const Dim.px(42),
      attributes: const {'aria-label': 'Open menu'},
      onTap: drawer.open,
    );
  }

  Component _drawer(String location) {
    return Drawer(
      controller: drawer,
      position: DrawerPosition.right,
      semanticLabel: 'Site menu',
      width: const Dim.px(300),
      backgroundColor: Palette.ground,
      child: nav(
        classes: 'drawer-nav',
        attributes: const {'aria-label': 'Site menu'},
        [
          for (final item in _navItems)
            if (item.isRoute)
              Link(
                to: item.to,
                classes: 'drawer-link${_isActive(item, location) ? ' active' : ''}',
                child: .text(item.label),
              )
            else
              a(href: item.to, classes: 'drawer-link', [.text(item.label)]),
          const LinkButton(label: 'Contact us', to: '/#contact'),
        ],
      ),
    );
  }

  @override
  Component build(BuildContext context) {
    final location = RouteState.of(context).location;
    final width = MediaQueryProvider.width(context) ?? 0;

    return header(classes: 'site-header', [
      div(classes: 'container header-row', [
        if (width < 800) ...[const Brand(showName: false), _menuButton()],
        if (width >= 800) ..._desktopActions(location),
        if (width >= 1024 && location.contains('/about')) LinkButton(label: 'Contact us', to: '/#contact', small: true),
        _drawer(location),
      ]),
    ]);
  }
}
