import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';

import '../components/cards.dart';
import '../components/page_shell.dart';
import '../content/company.dart';

/// Milestones and community sponsorship, side by side. [padding]
/// is 44 on the homepage, 72 on About.
class MilestonesBand extends StatelessComponent {
  const MilestonesBand({this.padding = 44, super.key});

  final double padding;

  @override
  Component build(BuildContext context) {
    return Band(
      variant: 'band--white',
      top: padding,
      bottom: padding,
      children: [
        div(classes: 'grid', styles: Styles(raw: {'--min': '320px', '--gap': '48px'}), [
          div([
            div(classes: 'eyebrow eyebrow--muted list-label', [.text('Milestones')]),
            MilestoneList(items: [for (final m in milestones) (year: m.year, text: m.text)]),
          ]),
          div([
            div(classes: 'eyebrow eyebrow--muted list-label', [.text('Community sponsorship')]),
            const RuledTextList(items: sponsorships),
          ]),
        ]),
      ],
    );
  }
}
