import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../components/cards.dart';
import '../components/example_card.dart';
import '../components/links.dart';
import '../components/page_shell.dart';
import '../components/typography.dart';
import '../content/services.dart';

/// Title block of a service page: back link, headline and a "best for / what you get" summary.
class ServiceHero extends StatelessComponent {
  const ServiceHero(this.service, {super.key});

  final ServiceInfo service;

  @override
  Component build(BuildContext context) {
    return Band(
      top: 56,
      bottom: 80,
      children: [
        // A plain stretched flex container, not a start-aligned Column: a Column would shrink the grid to its
        // content width, so the number of columns would depend on how much text each service has.
        div(classes: 'hero-stack', [
          const TextLink(label: '← All services', to: '/#services', arrow: false),
          div(classes: 'grid grid--center', styles: Styles(raw: {'--min': '380px', '--gap': '64px'}), [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                Eyebrow(service.tag),
                Title(service.title, level: 1, size: 'h-page'),
                Copy(service.lead, variant: 'lead', maxWidth: 540),
                const LinkButton(label: 'Talk to our team', to: '/#contact'),
              ],
            ),
            Surface(
              radius: 16,
              clip: true,
              classes: 'facts-card',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FactRow(label: 'Best for', value: service.bestFor, first: true),
                  FactRow(label: 'What you get', value: service.whatYouGet),
                ],
              ),
            ),
          ]),
        ]),
      ],
    );
  }
}

class ServiceCapabilities extends StatelessComponent {
  const ServiceCapabilities(this.service, {super.key});

  final ServiceInfo service;

  @override
  Component build(BuildContext context) {
    return Band(
      variant: 'band--subtle',
      top: 88,
      bottom: 88,
      children: [
        SectionIntro(eyebrow: 'What we build', title: service.capabilitiesTitle),
        const SizedBox.height(Dim.px(48)),
        div(classes: 'grid', styles: Styles(raw: {'--min': '250px'}), [
          for (final capability in service.capabilities)
            FeatureCard(icon: capability.icon, title: capability.title, text: capability.text),
        ]),
      ],
    );
  }
}

class ServiceExamples extends StatelessComponent {
  const ServiceExamples(this.service, {super.key});

  final ServiceInfo service;

  @override
  Component build(BuildContext context) {
    final first = service.examples.first;

    return Band(
      id: 'work',
      children: [
        SectionIntro(eyebrow: service.examplesLabel, title: service.examplesTitle),
        const SizedBox.height(Dim.px(48)),
        if (first is SplitExample)
          SplitExampleCard(first)
        else
          div(classes: 'grid', styles: Styles(raw: {'--min': '${service.exampleColumnMin}px', '--gap': '24px'}), [
            for (final example in service.examples) ExampleCard(example, visualHeight: service.exampleVisualHeight),
          ]),
      ],
    );
  }
}

class ServiceProcess extends StatelessComponent {
  const ServiceProcess(this.service, {super.key});

  final ServiceInfo service;

  @override
  Component build(BuildContext context) {
    return Band(
      variant: 'band--subtle',
      top: 88,
      bottom: 88,
      children: [
        SectionIntro(eyebrow: 'How we work', title: service.processTitle),
        const SizedBox.height(Dim.px(48)),
        div(classes: 'grid', styles: Styles(raw: {'--min': '230px'}), [
          for (final (index, step) in service.steps.indexed)
            StepCard(number: '0${index + 1}', title: step.title, text: step.text),
        ]),
      ],
    );
  }
}
