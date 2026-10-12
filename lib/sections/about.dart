import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../content.dart';
import '../components/section.dart';

class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'about',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 48,
        children: [
          Wrap(
            spacing: 56,
            runSpacing: 32,
            alignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const SizeConstraints(width: Dim.percent(100), maxWidth: Dim.px(520)),
                child: const SectionHeading(eyebrow: 'About Poddin', title: 'Technology that starts with people.'),
              ),
              Container(
                constraints: const SizeConstraints(width: Dim.percent(100), maxWidth: Dim.px(560)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    for (final p in aboutParagraphs)
                      NakiText(
                        p,
                        style: TextStyle(
                          color: context.subtitleColor,
                          fontSize: const Dim.rem(1.05),
                          lineHeight: const Dim.em(1.7),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [for (final (i, p) in pillars.indexed) _Pillar(i + 1, p)],
          ),
          Container(
            decoration: BoxDecoration(
              backgroundColor: context.primaryColor.withOpacity(0.08),
              borderRadius: BorderRadiusData.all(Dim.rem(1.25)),
              padding: const EdgeInsets.all(Dim.rem(2)),
              border: BorderData(color: context.primaryColor.withOpacity(0.25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                NakiText(
                  'OUR MISSION',
                  style: TextStyle(
                    color: context.primaryColor,
                    fontSize: const Dim.rem(0.8),
                    fontWeight: FontWeight.bold,
                    letterSpacing: const Dim.em(0.14),
                  ),
                ),
                NakiText(
                  mission,
                  style: TextStyle(
                    color: context.textColor,
                    fontSize: const Dim.rem(1.35),
                    lineHeight: const Dim.em(1.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Pillar extends StatelessComponent {
  const _Pillar(this.number, this.pillar);

  final int number;
  final Service pillar;

  @override
  Component build(BuildContext context) {
    return Container(
      constraints: const SizeConstraints(width: Dim.percent(100), minWidth: Dim.px(240), maxWidth: Dim.px(360)),
      child: Card.outlined(
        padding: const EdgeInsets.all(Dim.rem(1.5)),
        decoration: BoxDecoration(borderRadius: BorderRadiusData.all(Dim.rem(1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            NakiText(
              '0$number',
              style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.w800, fontSize: const Dim.rem(0.95)),
            ),
            Heading(
              pillar.title,
              level: 3,
              style: TextStyle(color: context.textColor, fontSize: const Dim.rem(1.25), fontWeight: FontWeight.w700),
            ),
            NakiText(
              pillar.description,
              style: TextStyle(color: context.subtitleColor, lineHeight: const Dim.em(1.55)),
            ),
          ],
        ),
      ),
    );
  }
}
