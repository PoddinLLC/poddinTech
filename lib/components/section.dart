import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../brand.dart';

/// Full-bleed band with a centred, max-width content column and an anchor [id].
class Section extends StatelessComponent {
  const Section({required this.id, required this.child, this.background, this.gradient, super.key});

  final String id;
  final Component child;
  final Color? background;
  final Gradient? gradient;

  @override
  Component build(BuildContext context) {
    return section(id: id, [
      Container(
        constraints: const SizeConstraints(width: Dim.percent(100)),
        decoration: BoxDecoration(
          backgroundColor: background,
          gradient: gradient,
          padding: const EdgeInsets.symmetric(horizontal: Dim.rem(1.5), vertical: Dim.rem(5)),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const SizeConstraints(width: Dim.percent(100), maxWidth: Dim.px(1160)),
            child: child,
          ),
        ),
      ),
    ]);
  }
}

/// Eyebrow label + title + optional subtitle used at the top of each section.
class SectionHeading extends StatelessComponent {
  const SectionHeading({required this.eyebrow, required this.title, this.subtitle, this.onDark = false, super.key});

  final String eyebrow;
  final String title;
  final String? subtitle;
  final bool onDark;

  @override
  Component build(BuildContext context) {
    return Container(
      constraints: const SizeConstraints(maxWidth: Dim.px(680)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          NakiText(
            eyebrow.toUpperCase(),
            style: TextStyle(
              color: onDark ? Brand.roseOnDark : context.primaryColor,
              fontSize: const Dim.rem(0.8),
              fontWeight: FontWeight.bold,
              letterSpacing: const Dim.em(0.14),
            ),
          ),
          Heading(
            title,
            level: 2,
            style: TextStyle(
              color: onDark ? Colors.white : context.textColor,
              fontSize: const Dim.rem(2.5),
              lineHeight: const Dim.em(1.15),
              fontWeight: FontWeight.w800,
            ),
          ),
          if (subtitle != null)
            NakiText(
              subtitle!,
              style: TextStyle(
                color: onDark ? Brand.mist : context.subtitleColor,
                fontSize: const Dim.rem(1.1),
                lineHeight: const Dim.em(1.6),
              ),
            ),
        ],
      ),
    );
  }
}

/// Plain in-page anchor with the browser's link chrome removed, wrapping a Naki [Button].
Component anchorLink(String href, Component child) {
  return a(href: href, styles: const Styles(raw: {'text-decoration': 'none', 'color': 'inherit'}), [child]);
}
