import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../components/cards.dart';
import '../components/page_shell.dart';
import '../components/typography.dart';
import '../content/company.dart';
import '../theme/palette.dart';
import 'leadership.dart';

/// Opening of the About page: the company in a sentence, with key facts alongside.
class AboutHero extends StatelessComponent {
  const AboutHero({super.key});

  @override
  Component build(BuildContext context) {
    final founder = leaders.first;

    return Band(
      variant: 'band--gradient',
      top: 88,
      bottom: 80,
      children: [
        div(classes: 'grid grid--center', styles: Styles(raw: {'--min': '380px', '--gap': '64px'}), [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: const [
              Eyebrow('About Poddin'),
              Title('Innovation begins with understanding people.', level: 1, size: 'h-hero'),
              Copy(
                'Poddin Technologies Limited is a technology company building intelligent, practical solutions for consumers and businesses of every size.',
                variant: 'lead',
                maxWidth: 540,
              ),
            ],
          ),
          Surface(
            radius: 16,
            padding: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FactRow(label: 'Incorporated', value: 'December 2021', first: true),
                FactRow(label: founder.role, value: founder.name),
                const FactRow(label: 'Products', value: Company.productsLine),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}

class WhoWeAre extends StatelessComponent {
  const WhoWeAre({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      variant: 'band--white band--flat-top',
      children: [
        div(classes: 'grid grid--start', styles: Styles(raw: {'--min': '340px', '--gap': '64px'}), [
          div(styles: Styles(display: .flex, flexDirection: .column, gap: .all(14.px)), [
            const Eyebrow('Who we are'),
            const Title('Software engineering, emerging technology and AI, applied to real needs.'),
          ]),
          div(styles: Styles(display: .flex, flexDirection: .column, gap: .all(20.px)), [
            const Copy(
              'Incorporated in December 2021, Poddin brings together modern software engineering, emerging technologies and artificial intelligence to simplify everyday experiences, improve business operations and create new opportunities for growth.',
            ),
            const Copy(
              'Our approach starts with the challenges individuals and organisations face, then applies the right technology to deliver solutions that are intuitive, reliable and built to evolve.',
            ),
          ]),
        ]),
      ],
    );
  }
}

class _Belief extends StatelessComponent {
  const _Belief(this.number, this.title, this.text);

  final String number;
  final String title;
  final String text;

  @override
  Component build(BuildContext context) {
    return Surface(
      radius: 16,
      padding: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          NakiText(
            number,
            style: const TextStyle(color: Palette.burgundy, fontWeight: FontWeight.w600),
          ),
          Title(title, level: 3, size: 'h-feature'),
          Copy(text, variant: 'text'),
        ],
      ),
    );
  }
}

class HowWeThink extends StatelessComponent {
  const HowWeThink({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      top: 104,
      bottom: 96,
      children: [
        const SectionIntro(eyebrow: 'How we think', title: 'Understand the people first, then choose the technology.'),
        const SizedBox.height(Dim.px(48)),
        div(classes: 'grid', styles: Styles(raw: {'--min': '280px'}), [
          const _Belief(
            '01',
            'Start with people',
            'We begin with the challenge an individual or organisation faces, then apply the right technology to it.',
          ),
          const _Belief(
            '02',
            'Create measurable value',
            'From helping consumers accomplish more with less effort to helping businesses operate more efficiently, we aim for meaningful, measurable value.',
          ),
          const _Belief(
            '03',
            'Build to evolve',
            'Our solutions are intuitive and reliable, and designed to grow and change as the people using them do.',
          ),
        ]),
      ],
    );
  }
}

class _AiPoint extends StatelessComponent {
  const _AiPoint({required this.icon, required this.title, required this.text});

  final IconData icon;
  final String title;
  final String text;

  @override
  Component build(BuildContext context) {
    return Surface(
      padding: 22,
      child: Row(
        spacing: 16,
        children: [
          Icon(icon, size: 26, color: Palette.burgundy),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NakiText(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                NakiText(
                  text,
                  style: const TextStyle(fontSize: Dim.px(15), color: Palette.body, softWrap: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AiApproach extends StatelessComponent {
  const AiApproach({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      variant: 'band--subtle',
      children: [
        div(classes: 'grid grid--center', styles: Styles(raw: {'--min': '340px', '--gap': '64px'}), [
          div(styles: Styles(display: .flex, flexDirection: .column, gap: .all(18.px)), [
            const Eyebrow('Our approach to AI'),
            const Title('Artificial intelligence is central to our vision.'),
            const Copy(
              'Combined with thoughtful product design and strong engineering, it allows us to build technology that responds to real needs and expands what our users can achieve.',
            ),
          ]),
          div(styles: Styles(display: .flex, flexDirection: .column, gap: .all(14.px)), [
            const _AiPoint(
              icon: LucideIcons.icon_refresh_cw,
              title: 'Reduce repetitive work',
              text: "Take routine tasks off people's plates.",
            ),
            const _AiPoint(
              icon: LucideIcons.icon_search,
              title: 'Make information more useful',
              text: 'Turn data and documents into answers.',
            ),
            const _AiPoint(
              icon: LucideIcons.icon_shield_check,
              title: 'Support better-informed decisions',
              text: 'Help people choose with confidence.',
            ),
          ]),
        ]),
      ],
    );
  }
}

class MissionBand extends StatelessComponent {
  const MissionBand({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      variant: 'band--rose',
      children: [
        div(styles: Styles(display: .flex, flexDirection: .column, gap: .all(20.px)), [
          const Eyebrow('Our mission', variant: 'eyebrow--light'),
          p(classes: 'mission', [
            .text(
              'To make technology a practical advantage for everyone we serve: empowering individuals, supporting growing businesses, and helping organisations navigate an increasingly digital world with confidence.',
            ),
          ]),
        ]),
      ],
    );
  }
}

class FounderSection extends StatelessComponent {
  const FounderSection({super.key});

  @override
  Component build(BuildContext context) {
    final founder = leaders.first;

    return Band(
      top: 104,
      bottom: 104,
      children: [
        div(classes: 'grid grid--center', styles: Styles(raw: {'--min': '320px', '--gap': '72px'}), [
          Portrait(
            leader: founder,
            founder: true,
            focusY: 36,
            alt: 'Portrait of ${founder.name}, ${founder.role}',
          ),
          div(styles: Styles(display: .flex, flexDirection: .column, gap: .all(18.px)), [
            const Eyebrow('Our founder'),
            Title(founder.name),
            const Copy(
              "Samuel founded Poddin to turn technology into a practical advantage for consumers and businesses. His vision guides the company's commitment to purposeful innovation: bringing advanced technology within reach and using it to solve problems that matter.",
            ),
            const Copy(
              'With more than a decade of combined experience and a background in strategic marketing, he brings a commercially grounded perspective to technology and product development. His professional interests span mobile application development, IT consulting, public speaking and executive coaching.',
            ),
            div(classes: 'founder-note', [
              .text(
                'Recipient of the Certificate of Congressional Recognition from the U.S. House of Representatives, December 2023',
              ),
            ]),
          ]),
        ]),
      ],
    );
  }
}

class LeadershipStrip extends StatelessComponent {
  const LeadershipStrip({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      top: 104,
      bottom: 104,
      children: [
        const SectionIntro(
          eyebrow: 'Leadership',
          title: 'Technology, strategy, communication and advocacy.',
        ),
        const SizedBox.height(Dim.px(40)),
        div(classes: 'grid', styles: Styles(raw: {'--min': '280px'}), [
          for (final leader in leaders)
            Surface(
              radius: 16,
              padding: 22,
              classes: 'strip-card',
              child: Row(
                spacing: 16,
                children: [
                  Portrait(leader: leader, round: true),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NakiText(leader.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                      NakiText(
                        leader.role,
                        style: const TextStyle(
                          color: Palette.burgundy,
                          fontSize: Dim.px(14),
                          fontWeight: FontWeight.w500,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ]),
      ],
    );
  }
}
