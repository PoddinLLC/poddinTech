import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../components/links.dart';
import '../components/page_shell.dart';
import '../components/typography.dart';
import '../content/company.dart';
import '../theme/palette.dart';

class HomeHero extends StatelessComponent {
  const HomeHero({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      top: 88,
      bottom: 80,
      children: [
        div(classes: 'grid grid--center', styles: Styles(raw: {'--min': '380px', '--gap': '64px'}), [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 26,
            children: [
              const Eyebrow(Company.name),
              const Title(Company.tagline, level: 1, size: 'h-display'),
              const Copy(Company.intro, variant: 'lead', maxWidth: 520),
              div(classes: 'actions', [
                const LinkButton(label: 'Contact us', to: '/#contact'),
                const TextLink(label: 'Explore our products', to: '/#products'),
              ]),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              backgroundColor: Palette.subtle,
              borderRadius: BorderRadiusData.all(const Dim.px(20)),
              padding: const EdgeInsets.all(Dim.px(28)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Image(
                'images/hero-systems.svg',
                alt: 'Animated illustration of connected systems orbiting the Poddin mark',
                size: const SizeConstraints(width: Dim.percent(100), maxWidth: Dim.px(440)),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
