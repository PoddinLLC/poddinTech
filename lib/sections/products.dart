import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility, Margin;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../components/cards.dart';
import '../components/links.dart';
import '../components/media.dart';
import '../components/page_shell.dart';
import '../components/typography.dart';
import '../theme/palette.dart';

/// A two-column product story: a visual panel and text, in either order.
class _ProductRow extends StatelessComponent {
  const _ProductRow({required this.visual, required this.text, this.visualFirst = true});

  final Component visual;
  final Component text;
  final bool visualFirst;

  @override
  Component build(BuildContext context) {
    return div(classes: 'grid grid--center product-row', styles: Styles(raw: {'--min': '380px', '--gap': '64px'}), [
      if (visualFirst) ...[visual, text] else ...[text, visual],
    ]);
  }
}

/// Grey rounded panel that holds a product visual.
class _Panel extends StatelessComponent {
  const _Panel({required this.child});

  final Component child;

  @override
  Component build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundColor: Palette.subtle,
        borderRadius: BorderRadiusData.all(const Dim.px(20)),
        padding: const EdgeInsets.all(Dim.px(36)),
      ),
      child: child,
    );
  }
}

class _Feature extends StatelessComponent {
  const _Feature({required this.icon, required this.title, required this.text});

  final IconData icon;
  final String title;
  final String text;

  @override
  Component build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Dim.px(2)),
          child: Icon(icon, size: 22, color: Palette.burgundy),
        ),
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
    );
  }
}

class ProductsSection extends StatelessComponent {
  const ProductsSection({super.key});

  @override
  Component build(BuildContext context) {
    return Band(
      id: 'products',
      top: 104,
      bottom: 24,
      children: [
        const SectionIntro(
          eyebrow: 'Products',
          title: 'Products that help people connect, do business and achieve more.',
        ),
        const SizedBox.height(Dim.px(72)),
        const _PoddinPayRow(),
        const SizedBox.height(Dim.px(96)),
        const _PoddinAppRow(),
        const SizedBox.height(Dim.px(96)),
        const _AlsoFromPoddin(),
      ],
    );
  }
}

class _PoddinPayRow extends StatelessComponent {
  const _PoddinPayRow();

  @override
  Component build(BuildContext context) {
    return const _ProductRow(
      visual: _Panel(
        child: Align(
          alignment: Alignment.center,
          child: BrowserFrame(
            src: 'images/products/poddinpay-form-light.jpg',
            alt:
                "PoddinPay's payment link page: a form for the item being sold, price, customer contact, delivery "
                'duration and payout details',
            address: 'poddinpay.com/create-payment-link',
          ),
        ),
      ),
      text: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Eyebrow('PoddinPay'),
          Title('Escrow and payment links for social commerce.', level: 3, size: 'h-product'),
          Copy(
            'Launched in May 2026, PoddinPay is a web-based platform that protects individuals and businesses '
            'transacting on social networks from fraud. Generate a payment link and use escrow to build confidence '
            'between buyers and sellers.',
            variant: 'text',
          ),
          TextLink(label: 'Explore PoddinPay', to: 'https://poddinpay.com', external: true),
        ],
      ),
    );
  }
}

class _PoddinAppRow extends StatelessComponent {
  const _PoddinAppRow();

  @override
  Component build(BuildContext context) {
    return _ProductRow(
      visualFirst: false,
      visual: _Panel(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Flexible(
              child: Image(
                'images/products/banner3.jpg',
                alt: 'PoddinApp screen: a personalised product feed with a Shop Now button',
                classes: 'app-screen',
                lazyLoad: false,
                size: const SizeConstraints(width: Dim.percent(100), maxWidth: Dim.px(220)),
                radius: BorderRadiusData.all(const Dim.px(18)),
              ),
            ),
            Flexible(
              child: Margin(
                margin: EdgeInsets.only(top: Dim.px(48)),
                child: Image(
                  'images/products/banner6.jpg',
                  alt: 'PoddinApp screen: wallet history showing instant cashback on orders',
                  classes: 'app-screen',
                  lazyLoad: false,
                  size: SizeConstraints(width: Dim.percent(100), maxWidth: Dim.px(220)),
                  radius: BorderRadiusData.all(Dim.px(18)),
                ),
              ),
            ),
          ],
        ),
      ),
      text: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          const Eyebrow('PoddinApp'),
          const Title('A consumer platform with protection and support built in.', level: 3, size: 'h-product'),
          const Copy(
            'Launched in November 2024 to make online transactions secure, reward users and support businesses and '
            'consumers. Available on Google Play, the App Store and Huawei AppGallery.',
            variant: 'text',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 14,
            children: const [
              _Feature(
                icon: LucideIcons.icon_shield_check,
                title: 'Scam protection',
                text: 'Payments are secured until buyers confirm delivery.',
              ),
              _Feature(
                icon: LucideIcons.icon_circle_dollar_sign,
                title: 'Instant cashback',
                text: 'Earned on every confirmed order, with more through the referral programme.',
              ),
              _Feature(
                icon: LucideIcons.icon_message_circle,
                title: 'Dedicated support',
                text: 'Zara is available inside the app.',
              ),
            ],
          ),
          const TextLink(label: 'Get PoddinApp', to: 'https://poddinapp.com/install', external: true),
        ],
      ),
    );
  }
}

class _AlsoFromPoddin extends StatelessComponent {
  const _AlsoFromPoddin();

  @override
  Component build(BuildContext context) {
    return div(classes: 'grid', styles: Styles(raw: {'--min': '340px'}), [
      Surface(
        radius: 16,
        padding: 32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: const [
            Eyebrow('Poddin AI and Poddin Bot'),
            Title('Intelligent assistance where people already are.', level: 3, size: 'h-feature'),
            Copy(
              'Available through PoddinApp, WhatsApp and Telegram, removing barriers to entry and making PoddinApp '
              'accessible to everyone.',
              variant: 'small',
            ),
            TextLink(label: 'Explore PoddinAI', to: 'https://poddinapp.com/bot', external: true),
          ],
        ),
      ),
      Surface(
        radius: 16,
        padding: 32,
        dashed: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: const [
            Eyebrow('Coming soon', variant: 'eyebrow--grey'),
            Title('The next addition to the Poddin family.', level: 3, size: 'h-feature'),
            Copy('Under development.', variant: 'small'),
          ],
        ),
      ),
    ]);
  }
}
