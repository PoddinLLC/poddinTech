import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../theme/palette.dart';

/// A white, hairline-bordered surface. The shared card treatment across the site.
class Surface extends StatelessComponent {
  const Surface({
    required this.child,
    this.radius = 14,
    this.padding = 26,
    this.dashed = false,
    this.clip = false,
    this.classes,
    super.key,
  });

  final Component child;
  final double radius;
  final double padding;

  /// A dashed border marks placeholder content such as an unreleased product.
  final bool dashed;
  final bool clip;
  final String? classes;

  @override
  Component build(BuildContext context) {
    return Container(
      classes: classes,
      decoration: BoxDecoration(
        backgroundColor: Palette.white,
        border: BorderData(
          color: dashed ? const Color('#B5ABA7') : Palette.line,
          width: const Dim.px(1),
          style: dashed ? BorderStyle.dashed : BorderStyle.solid,
        ),
        borderRadius: BorderRadiusData.all(Dim.px(radius)),
        padding: clip ? null : EdgeInsets.all(Dim.px(padding)),
      ),
      child: child,
    );
  }
}

/// Icon, title and short description on a [Surface].
class FeatureCard extends StatelessComponent {
  const FeatureCard({required this.icon, required this.title, required this.text, super.key});

  final IconData icon;
  final String title;
  final String text;

  @override
  Component build(BuildContext context) {
    return Surface(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Icon(icon, size: 26, color: Palette.burgundy),
          Heading(
            title,
            level: 3,
            classes: 'h-sans',
            style: const TextStyle(fontSize: Dim.px(18)),
          ),
          NakiText(
            text,
            style: const TextStyle(color: Palette.body, fontSize: Dim.px(15), softWrap: true),
          ),
        ],
      ),
    );
  }
}

/// Numbered step in a "how we work" row.
class StepCard extends StatelessComponent {
  const StepCard({required this.number, required this.title, required this.text, super.key});

  final String number;
  final String title;
  final String text;

  @override
  Component build(BuildContext context) {
    return Surface(
      padding: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          NakiText(
            number,
            style: const TextStyle(color: Palette.burgundy, fontWeight: FontWeight.w600),
          ),
          Heading(
            title,
            level: 3,
            classes: 'h-sans',
            style: const TextStyle(fontSize: Dim.px(18)),
          ),
          NakiText(
            text,
            style: const TextStyle(color: Palette.body, fontSize: Dim.px(15), softWrap: true),
          ),
        ],
      ),
    );
  }
}

/// A small caption row used in fact lists: muted eyebrow above a value.
class FactRow extends StatelessComponent {
  const FactRow({required this.label, required this.value, this.first = false, super.key});

  final String label;
  final String value;
  final bool first;

  @override
  Component build(BuildContext context) {
    return div(classes: 'fact-row${first ? ' fact-row--first' : ''}', [
      div(classes: 'eyebrow eyebrow--muted fact-label', [.text(label)]),
      div(classes: 'fact-value', [.text(value)]),
    ]);
  }
}

/// Year and event rows, divided by hairlines.
class MilestoneList extends StatelessComponent {
  const MilestoneList({required this.items, super.key});

  final List<({String year, String text})> items;

  @override
  Component build(BuildContext context) {
    return div(classes: 'ruled-list', [
      for (final item in items)
        div(classes: 'ruled-row', [
          span(classes: 'ruled-year', [.text(item.year)]),
          span([.text(item.text)]),
        ]),
    ]);
  }
}

class RuledTextList extends StatelessComponent {
  const RuledTextList({required this.items, super.key});

  final List<String> items;

  @override
  Component build(BuildContext context) {
    return div(classes: 'ruled-list', [
      for (final item in items) div(classes: 'ruled-row', [.text(item)]),
    ]);
  }
}
