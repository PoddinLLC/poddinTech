import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../theme/palette.dart';

/// Small uppercase label above a heading. Styled by `.eyebrow` in `web/site.css`.
class Eyebrow extends StatelessComponent {
  const Eyebrow(this.text, {this.variant = '', super.key});

  final String text;

  /// Optional modifier class, e.g. `eyebrow--muted` or `eyebrow--light`.
  final String variant;

  @override
  Component build(BuildContext context) {
    return div(classes: 'eyebrow $variant'.trim(), [.text(text)]);
  }
}

/// A semantic heading whose size comes from a `.h-*` class so it can
/// change at the phone breakpoint.
class Title extends StatelessComponent {
  const Title(this.text, {this.level = 2, this.size = 'h-section', this.light = false, super.key});

  final String text;
  final int level;

  /// One of `h-display`, `h-hero`, `h-section`, `h-cta`, `h-feature`, `h-title`.
  final String size;

  /// White text for use on the rose band.
  final bool light;

  @override
  Component build(BuildContext context) {
    return Heading(
      text,
      level: level,
      classes: size,
      style: light ? const TextStyle(color: Palette.white) : null,
    );
  }
}

/// Body paragraph. [variant] is `lead`, `copy` or `small`.
class Copy extends StatelessComponent {
  const Copy(this.text, {this.variant = 'copy', this.maxWidth, this.light = false, super.key});

  final String text;
  final String variant;
  final double? maxWidth;
  final bool light;

  @override
  Component build(BuildContext context) {
    return NakiText(
      text,
      classes: variant,
      style: TextStyle(color: light ? Colors.white : null, extra: {'max-width': ?maxWidth?.toPx}),
    );
  }
}

/// Eyebrow, title and optional supporting copy, used at the top of most sections.
class SectionIntro extends StatelessComponent {
  const SectionIntro({
    required this.eyebrow,
    required this.title,
    this.body,
    this.size = 'h-section',
    this.maxWidth = 620,
    this.light = false,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String? body;
  final String size;
  final double maxWidth;
  final bool light;

  @override
  Component build(BuildContext context) {
    return div(styles: Styles(display: .flex, maxWidth: maxWidth.px, flexDirection: .column, gap: .all(14.px)), [
      Eyebrow(eyebrow, variant: light ? 'eyebrow--light' : ''),
      Title(title, size: size, light: light),
      if (body != null) Copy(body!, light: light),
    ]);
  }
}
