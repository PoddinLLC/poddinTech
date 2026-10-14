import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../theme/palette.dart';

/// Where enquiries go.
const contactEmail = 'info@poddin.net';

/// Contact form. Fields are validated by Naki, then the enquiry opens in the visitor's email app
/// addressed to [contactEmail]. Swap [_send] for a request to a form backend when one exists.
class ContactForm extends StatefulComponent {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final formKey = GlobalNodeKey<HTMLFormElement>();

  String name = '';
  String email = '';
  String organisation = '';
  String message = '';
  bool sent = false;

  String? _emailValid(String value) {
    final v = value.trim();
    if (v.isEmpty) return 'This field is required.';
    if (!v.contains('@') || !v.contains('.')) return 'Enter a valid email address.';
    return null;
  }

  void _send() {
    final subject = Uri.encodeComponent('Enquiry from ${name.trim()}');
    final body = Uri.encodeComponent(
      'Name: ${name.trim()}\n'
      'Email: ${email.trim()}\n'
      '${organisation.trim().isEmpty ? '' : 'Organisation: ${organisation.trim()}\n'}'
      '\n${message.trim()}',
    );
    window.location.href = 'mailto:$contactEmail?subject=$subject&body=$body';
    setState(() => sent = true);
    Future.delayed(const Duration(seconds: 10), () {
      setState(() => sent = false);
    });
  }

  @override
  Component build(BuildContext context) {
    return Container(
      classes: 'contact-card',
      decoration: BoxDecoration(
        backgroundColor: Palette.white,
        borderRadius: BorderRadiusData.all(const Dim.px(16)),
        padding: const EdgeInsets.all(Dim.px(32)),
      ),
      child: FormBuilder(
        formKey: formKey,
        name: 'contact',
        spacing: 18,
        children: [
          TextField(
            id: 'contact-name',
            type: InputType.text,
            required: true,
            autofill: Autofill.name,
            decoration: const InputDecoration(labelText: 'Full name'),
            onTyping: (value) => name = value,
          ),
          TextField(
            id: 'contact-email',
            type: InputType.email,
            required: true,
            autofill: Autofill.email,
            decoration: const InputDecoration(labelText: 'Email address'),
            validator: _emailValid,
            autoValidate: true,
            onTyping: (value) => email = value,
          ),
          TextField(
            id: 'contact-organisation',
            type: InputType.text,
            autofill: Autofill.organization,
            decoration: const InputDecoration(labelText: 'Organisation (optional)'),
            onTyping: (value) => organisation = value,
          ),
          TextField(
            id: 'contact-message',
            type: InputType.text,
            required: true,
            isMultiline: true,
            visibleLines: 3,
            width: Dim.percent(100),
            decoration: const InputDecoration(labelText: 'How can we help?'),
            onTyping: (value) => message = value,
          ),
          Button(
            id: 'contact-send',
            validateForm: true,
            backgroundColor: Palette.crimson,
            hoverColor: Palette.crimsonHover,
            foregroundColor: Palette.white,
            height: const Dim.px(44),
            padding: const EdgeInsets.symmetric(horizontal: Dim.px(24)),
            onTap: _send,
            child: const NakiText('Send message', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          if (sent)
            const Banner(
              severity: BannerType.success,
              primary: NakiText('Your email app should now open with your message.'),
              secondary: NakiText('If it does not, write to $contactEmail and we will reply there.'),
            ),
        ],
      ),
    );
  }
}
