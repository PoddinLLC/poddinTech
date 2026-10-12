import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../brand.dart';
import '../content.dart';
import '../components/section.dart';

class ContactCta extends StatelessComponent {
  const ContactCta({super.key});

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'contact',
      child: Container(
        decoration: BoxDecoration(
          gradient: Gradient()
            ..applyLinear(colors: [Brand.crimson, Brand.burgundy], direction: LinearGradientDirection.toBottomRight),
          borderRadius: BorderRadiusData.all(Dim.rem(2)),
          padding: const EdgeInsets.symmetric(horizontal: Dim.rem(2), vertical: Dim.rem(4)),
        ),
        child: Column(
          spacing: 20,
          children: [
            Heading(
              'Have a challenge worth solving?',
              level: 2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: Dim.rem(2.4),
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              constraints: const SizeConstraints(maxWidth: Dim.px(560)),
              child: const NakiText(
                'Tell us what you’re building. We’ll help you find the right technology to make it practical.',
                style: TextStyle(
                  color: Brand.mist,
                  fontSize: Dim.rem(1.1),
                  lineHeight: Dim.em(1.6),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Button.filled(
              Colors.white,
              foregroundColor: Brand.crimson,
              padding: const EdgeInsets.symmetric(horizontal: Dim.rem(2), vertical: Dim.rem(0.95)),
              child: const NakiText('Contact Poddin'),
            ),
          ],
        ),
      ),
    );
  }
}

class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});

  @override
  Component build(BuildContext context) {
    return Container(
      constraints: const SizeConstraints(width: Dim.percent(100)),
      decoration: BoxDecoration(
        border: BorderData.only(top: BorderSideData(color: context.borderColor)),
        padding: const EdgeInsets.symmetric(horizontal: Dim.rem(1.5), vertical: Dim.rem(2.5)),
      ),
      child: Wrap(
        alignment: MainAxisAlignment.spaceBetween,
        spacing: 24,
        runSpacing: 16,
        children: [
          Row(
            spacing: 10,
            children: [
              const Image(
                'images/logo.png',
                alt: 'Poddin logo',
                size: SizeConstraints(width: Dim.px(28), height: Dim.px(28)),
              ),
              NakiText(
                'Poddin Technologies Limited',
                style: TextStyle(color: context.textColor, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          NakiText(
            '© ${DateTime.now().year} Poddin Technologies Limited. $tagline',
            style: TextStyle(color: context.subtitleColor, fontSize: const Dim.rem(0.9)),
          ),
        ],
      ),
    );
  }
}
