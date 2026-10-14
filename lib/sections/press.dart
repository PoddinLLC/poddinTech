import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../components/page_shell.dart';
import '../components/typography.dart';
import '../content/company.dart';

class _PressCard extends StatelessComponent {
  const _PressCard(this.item);

  final PressItem item;

  @override
  Component build(BuildContext context) {
    final tile = Color(item.tileColor);

    return a(
      href: item.url,
      target: Target.blank,
      classes: 'press-card',
      attributes: const {'rel': 'noopener noreferrer'},
      [
        Container(
          height: const Dim.px(104),
          decoration: BoxDecoration(
            gradient: Gradient()
              ..applyLinear(
                colors: [Color(item.gradientFrom), Color(item.gradientTo)],
                direction: LinearGradientDirection.toBottomRight,
              ),
            padding: const EdgeInsets.symmetric(horizontal: Dim.px(22)),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              classes: 'press-tile',
              width: const Dim.px(56),
              height: const Dim.px(56),
              decoration: BoxDecoration(backgroundColor: tile, borderRadius: BorderRadiusData.all(const Dim.px(14))),
              child: Align(
                alignment: Alignment.center,
                child: Image(
                  item.logo,
                  fit: item.logoFill ? ObjectFit.cover : ObjectFit.contain,
                  size: SizeConstraints(
                    width: item.logoFill ? const Dim.percent(100) : Dim.px(item.logoSize),
                    height: item.logoFill ? const Dim.percent(100) : Dim.px(item.logoSize),
                  ),
                ),
              ),
            ),
          ),
        ),

        div(classes: 'press-body', [
          span(classes: 'press-outlet', [.text(item.outlet)]),
          span(classes: 'press-read', [.text('Read article →')]),
        ]),
      ],
    );
  }
}

class PressSection extends StatelessComponent {
  const PressSection({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      id: 'press',
      variant: 'band--subtle',
      top: 88,
      bottom: 88,
      children: [
        const SectionIntro(eyebrow: 'Press', title: 'Poddin in the media.'),
        const SizedBox.height(Dim.px(48)),
        div(classes: 'grid', styles: Styles(raw: {'--min': '200px', '--gap': '16px'}), [
          for (final item in pressItems) _PressCard(item),
        ]),
      ],
    );
  }
}
