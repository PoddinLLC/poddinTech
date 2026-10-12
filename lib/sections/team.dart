import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../brand.dart';
import '../content.dart';
import '../components/section.dart';

class Team extends StatelessComponent {
  const Team({super.key});

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'team',
      background: Brand.blush.withOpacity(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 48,
        children: [
          const SectionHeading(
            eyebrow: 'The people behind Poddin',
            title: 'Leadership that connects technology, strategy, and community.',
          ),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [for (final p in team) _PersonCard(p)],
          ),
        ],
      ),
    );
  }
}

class _PersonCard extends StatelessComponent {
  const _PersonCard(this.person);

  final Person person;

  @override
  Component build(BuildContext context) {
    return Container(
      constraints: const SizeConstraints(width: Dim.percent(100), minWidth: Dim.px(260), maxWidth: Dim.px(364)),
      child: Card.outlined(
        padding: const EdgeInsets.all(Dim.rem(1.75)),
        decoration: BoxDecoration(borderRadius: BorderRadiusData.all(Dim.rem(1.25))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Container(
              constraints: const SizeConstraints(width: Dim.px(64), height: Dim.px(64)),
              decoration: BoxDecoration(
                gradient: Gradient()
                  ..applyLinear(colors: [Brand.coral, Brand.crimson], direction: LinearGradientDirection.toBottomRight),
                borderRadius: BorderRadiusData.all(Dim.percent(50)),
                alignment: Alignment.center,
              ),
              child: NakiText(
                person.initials,
                style: const TextStyle(color: Colors.white, fontSize: Dim.rem(1.3), fontWeight: FontWeight.w800),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Heading(
                  person.name,
                  level: 3,
                  style: TextStyle(color: context.textColor, fontSize: const Dim.rem(1.3), fontWeight: FontWeight.w800),
                ),
                NakiText(
                  person.role,
                  style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.w600),
                ),
                NakiText(
                  person.since,
                  style: TextStyle(color: context.subtitleColor, fontSize: const Dim.rem(0.85)),
                ),
              ],
            ),
            NakiText(
              person.bio,
              style: TextStyle(color: context.subtitleColor, lineHeight: const Dim.em(1.6)),
            ),
            NakiText(
              '★ ${person.highlight}',
              style: TextStyle(
                color: context.textColor,
                fontSize: const Dim.rem(0.9),
                fontWeight: FontWeight.w600,
                lineHeight: const Dim.em(1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
