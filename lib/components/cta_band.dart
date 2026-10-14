import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';

import 'links.dart';
import 'page_shell.dart';
import 'typography.dart';

/// Closing call to action on the rose band, shared by About and every service page.
class CtaBand extends StatelessComponent {
  const CtaBand({this.title = 'Tell us the challenge. We will build the right technology for it.', super.key});

  final String title;

  @override
  Component build(BuildContext context) {
    return Band(
      variant: 'band--rose',
      top: 88,
      bottom: 88,
      children: [
        div(classes: 'cta-row', [
          div(classes: 'cta-title', [Title(title, size: 'h-cta', light: true)]),
          const LinkButton(label: 'Get in touch', to: '/#contact', style: LinkButtonStyle.light),
        ]),
      ],
    );
  }
}
