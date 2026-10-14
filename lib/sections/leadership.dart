import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../components/cards.dart';
import '../components/page_shell.dart';
import '../components/typography.dart';
import '../content/company.dart';

/// Square greyscale portrait. Greyscale keeps three differently lit photographs consistent.
class Portrait extends StatelessComponent {
  const Portrait({
    required this.leader,
    this.size,
    this.round = false,
    this.founder = false,
    this.focusY,
    this.alt,
    super.key,
  });

  final Leader leader;

  /// Fixed pixel size. When null the portrait fills its width as a square.
  final double? size;
  final bool round;

  /// Tall 4:5 crop with large corners, used for the founder section.
  final bool founder;

  /// Overrides [Leader.focusY] where a crop needs a different focus.
  final int? focusY;
  final String? alt;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'portrait${round ? ' portrait--round' : ''}${founder ? ' portrait--founder' : ''}',
      styles: Styles(width: size?.px, height: size?.px),
      [
        img(
          src: leader.image,
          alt: alt ?? 'Portrait of ${leader.name}',
          classes: 'portrait-img',
          styles: Styles(raw: {'object-position': '50% ${focusY ?? leader.focusY}%'}),
        ),
      ],
    );
  }
}

class _LeaderCard extends StatelessComponent {
  const _LeaderCard(this.leader);

  final Leader leader;

  @override
  Component build(BuildContext context) {
    return Surface(
      radius: 16,
      padding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 18,
        children: [
          Portrait(leader: leader),
          div(classes: 'leader-body', [
            div([
              div(classes: 'leader-name', [.text(leader.name)]),
              div(classes: 'leader-role', [.text(leader.role)]),
              div(classes: 'leader-since', [.text(leader.since)]),
            ]),
            p(classes: 'small', [.text(leader.bio)]),
            div(classes: 'leader-highlight', [.text(leader.highlight)]),
          ]),
        ],
      ),
    );
  }
}

class LeadershipSection extends StatelessComponent {
  const LeadershipSection({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      id: 'leadership',
      top: 104,
      bottom: 104,
      children: [
        const SectionIntro(eyebrow: 'Leadership', title: 'The people behind Poddin.'),
        const SizedBox.height(Dim.px(56)),
        div(classes: 'grid', styles: Styles(raw: {'--min': '300px', '--gap': '24px'}), [
          for (final leader in leaders) _LeaderCard(leader),
        ]),
      ],
    );
  }
}
