import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';

import '../components/page_shell.dart';
import '../components/typography.dart';
import '../content/services.dart';

class ServicesSection extends StatelessComponent {
  const ServicesSection({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      id: 'services',
      variant: 'band--subtle',
      children: [
        div(classes: 'grid grid--start', styles: Styles(raw: {'--min': '340px', '--gap': '64px'}), [
          div(styles: Styles(display: .flex, flexDirection: .column, gap: .all(16.px)), [
            const Eyebrow('Services'),
            const Title('Software built for organisations of every size.'),
            const Copy(
              'From new ventures to established organisations, we understand each challenge and build software that delivers practical value.',
              variant: 'text',
            ),
          ]),
          div(classes: 'service-list', [
            for (final service in services)
              a(
                href: '/services/${service.slug}',
                classes: 'service-row row-hover',
                [
                  span(classes: 'service-number', [.text(service.number)]),
                  div(classes: 'service-body', [
                    div(classes: 'service-title', [.text(service.listTitle)]),
                    div(classes: 'service-blurb', [.text(service.listBlurb)]),
                  ]),
                  span(classes: 'service-arrow', attributes: const {'aria-hidden': 'true'}, [.text('→')]),
                ],
              ),
          ]),
        ]),
      ],
    );
  }
}
