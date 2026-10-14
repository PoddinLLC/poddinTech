import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';

import '../components/contact_form.dart';
import '../components/page_shell.dart';
import '../components/typography.dart';

class ContactSection extends StatelessComponent {
  const ContactSection({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      id: 'contact',
      variant: 'band--rose',
      children: [
        div(classes: 'grid grid--center', styles: Styles(raw: {'--min': '360px', '--gap': '64px'}), [
          div(styles: Styles(display: .flex, flexDirection: .column, gap: .all(16.px)), [
            const Eyebrow('Contact', variant: 'eyebrow--light'),
            const Title('Tell us the challenge. We will build the right technology for it.', light: true),
            const Copy(
              'Speak with our team about partnerships, integrations or custom software.',
              variant: 'text',
              maxWidth: 480,
              light: true,
            ),
          ]),
          const ContactForm(),
        ]),
      ],
    );
  }
}
