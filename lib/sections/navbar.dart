import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../components/section.dart';

const _links = {'About': '#about', 'Products': '#products', 'Services': '#services', 'Team': '#team'};

class SiteNavbar extends StatelessComponent {
  const SiteNavbar({super.key});

  @override
  Component build(BuildContext context) {
    return AppBar(
      title: Row(
        spacing: 10,
        children: [
          const Image(
            'images/logo.png',
            alt: 'Poddin logo',
            size: SizeConstraints(width: Dim.px(36), height: Dim.px(36)),
          ),
          NakiText(
            'Poddin',
            style: TextStyle(color: context.textColor, fontSize: const Dim.rem(1.25), fontWeight: FontWeight.w800),
          ),
        ],
      ),
      actions: [
        BreakPointWrapper(
          minWidth: 769,
          child: Row(
            spacing: 4,
            children: [
              for (final entry in _links.entries)
                anchorLink(entry.value, Button.text(entry.key, foregroundColor: context.textColor)),
            ],
          ),
        ),
        anchorLink(
          '#contact',
          Button.filled(context.primaryColor, foregroundColor: Colors.white, child: const NakiText('Get in touch')),
        ),
      ],
    );
  }
}
