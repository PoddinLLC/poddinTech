import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../content.dart';
import '../components/section.dart';

class Services extends StatelessComponent {
  const Services({super.key});

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'services',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 48,
        children: [
          const SectionHeading(
            eyebrow: 'Our services',
            title: 'Software for businesses of every size.',
            subtitle:
                'From new ventures to established organisations, we understand each challenge and build software that '
                'delivers practical value.',
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [for (final (i, s) in services.indexed) _ServiceCard(i + 1, s)],
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessComponent {
  const _ServiceCard(this.number, this.service);

  final int number;
  final Service service;

  @override
  Component build(BuildContext context) {
    return Container(
      constraints: const SizeConstraints(width: Dim.percent(100), minWidth: Dim.px(260), maxWidth: Dim.px(540)),
      child: Card.outlined(
        padding: const EdgeInsets.all(Dim.rem(1.75)),
        decoration: BoxDecoration(borderRadius: BorderRadiusData.all(Dim.rem(1.25))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 18,
          children: [
            Container(
              constraints: const SizeConstraints(width: Dim.px(44), height: Dim.px(44)),
              decoration: BoxDecoration(
                backgroundColor: context.primaryColor,
                borderRadius: BorderRadiusData.all(Dim.rem(0.75)),
                alignment: Alignment.center,
              ),
              child: NakiText(
                '$number',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Heading(
                    service.title,
                    level: 3,
                    style: TextStyle(
                      color: context.textColor,
                      fontSize: const Dim.rem(1.2),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  NakiText(
                    service.description,
                    style: TextStyle(color: context.subtitleColor, lineHeight: const Dim.em(1.6)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
