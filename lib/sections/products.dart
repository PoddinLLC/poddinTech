import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../brand.dart';
import '../content.dart';
import '../components/section.dart';

class Products extends StatelessComponent {
  const Products({super.key});

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'products',
      background: Brand.burgundy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 48,
        children: [
          const SectionHeading(
            eyebrow: 'Our products',
            title: 'Built to help people connect, do business, and achieve more.',
            onDark: true,
          ),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [for (final p in products) _ProductCard(p)],
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessComponent {
  const _ProductCard(this.product);

  final Product product;

  @override
  Component build(BuildContext context) {
    final soon = product.name == 'Spaq';
    return Container(
      constraints: const SizeConstraints(width: Dim.percent(100), minWidth: Dim.px(260), maxWidth: Dim.px(540)),
      child: Container(
        constraints: const SizeConstraints(width: Dim.percent(100)),
        decoration: BoxDecoration(
          backgroundColor: Colors.white.withOpacity(soon ? 0.04 : 0.08),
          borderRadius: BorderRadiusData.all(Dim.rem(1.25)),
          padding: const EdgeInsets.all(Dim.rem(1.75)),
          border: BorderData(
            color: Colors.white.withOpacity(0.16),
            style: soon ? BorderStyle.dashed : BorderStyle.solid,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            if (product.badge != null)
              NakiText(
                product.badge!.toUpperCase(),
                style: const TextStyle(
                  color: Brand.roseOnDark,
                  fontSize: Dim.rem(0.72),
                  fontWeight: FontWeight.bold,
                  letterSpacing: Dim.em(0.1),
                ),
              ),
            Heading(
              product.name,
              level: 3,
              style: const TextStyle(color: Colors.white, fontSize: Dim.rem(1.7), fontWeight: FontWeight.w800),
            ),
            NakiText(
              product.tagline,
              style: const TextStyle(color: Colors.white, fontSize: Dim.rem(1.05), fontWeight: FontWeight.w600),
            ),
            NakiText(
              product.description,
              style: const TextStyle(color: Brand.mist, lineHeight: Dim.em(1.65)),
            ),
          ],
        ),
      ),
    );
  }
}
