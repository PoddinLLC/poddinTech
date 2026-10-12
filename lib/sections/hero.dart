import 'package:jaspr/dom.dart' hide AspectRatio, Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../brand.dart';
import '../content.dart';
import '../components/section.dart';

class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'top',
      gradient: Gradient()
        ..applyLinear(
          colors: [context.primaryColor.withOpacity(0.14), context.backgroundColor],
          direction: LinearGradientDirection.toBottomRight,
        ),
      child: Wrap(
        alignment: MainAxisAlignment.spaceBetween,
        spacing: 56,
        runSpacing: 56,
        children: [
          Container(
            constraints: const SizeConstraints(width: Dim.percent(100), maxWidth: Dim.px(580)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                _Pill('Incorporated December 2021'),
                Heading(
                  tagline,
                  style: TextStyle(
                    color: context.textColor,
                    fontSize: const Dim.rem(3.4),
                    lineHeight: const Dim.em(1.08),
                    fontWeight: FontWeight.w800,
                    letterSpacing: const Dim.em(-0.02),
                  ),
                ),
                NakiText(
                  'We build intelligent, practical software for consumers and businesses of every size — from secure '
                  'payments to AI assistants and custom systems.',
                  style: TextStyle(
                    color: context.subtitleColor,
                    fontSize: const Dim.rem(1.2),
                    lineHeight: const Dim.em(1.6),
                  ),
                ),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    anchorLink(
                      '#products',
                      Button.filled(
                        context.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: Dim.rem(1.75), vertical: Dim.rem(0.9)),
                        child: const NakiText('Explore our products'),
                      ),
                    ),
                    anchorLink(
                      '#services',
                      Button.outlined(
                        BorderData(color: context.borderColor, width: const Dim.px(1.5)),
                        foregroundColor: context.textColor,
                        backgroundColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: Dim.rem(1.75), vertical: Dim.rem(0.9)),
                        child: const NakiText('Work with us'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const _HeroVisual(),
        ],
      ),
    );
  }
}

class _Pill extends StatelessComponent {
  const _Pill(this.label);

  final String label;

  @override
  Component build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundColor: context.primaryColor.withOpacity(0.12),
        borderRadius: BorderRadiusData.all(Dim.px(999)),
        padding: const EdgeInsets.symmetric(horizontal: Dim.rem(0.9), vertical: Dim.rem(0.35)),
      ),
      child: NakiText(
        label,
        style: TextStyle(color: context.primaryColor, fontSize: const Dim.rem(0.85), fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _HeroVisual extends StatelessComponent {
  const _HeroVisual();

  @override
  Component build(BuildContext context) {
    return Container(
      constraints: const SizeConstraints(width: Dim.percent(100), maxWidth: Dim.px(420)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: AspectRatioType.ratio1_1,
            child: Container(
              constraints: const SizeConstraints(width: Dim.percent(100), height: Dim.percent(100)),
              decoration: BoxDecoration(
                gradient: Gradient()
                  ..applyLinear(
                    colors: [Brand.coral, Brand.crimson, Brand.burgundy],
                    direction: LinearGradientDirection.toBottomRight,
                  ),
                borderRadius: BorderRadiusData.all(Dim.rem(2)),
                alignment: Alignment.center,
                shadow: Shadow(color: Brand.crimson.withOpacity(0.35), blurRadius: 60, offsetY: 24),
              ),
              child: const Image(
                'images/logo.png',
                alt: 'Poddin',
                fit: ObjectFit.contain,
                size: SizeConstraints(width: Dim.percent(62), height: Dim.percent(62)),
              ),
            ),
          ),
          Positioned(bottom: const Dim.px(12), left: const Dim.px(12), child: const _Chip('Secure payments')),
          Positioned(top: const Dim.px(28), right: const Dim.px(12), child: const _Chip('AI assistants')),
        ],
      ),
    );
  }
}

class _Chip extends StatelessComponent {
  const _Chip(this.label);

  final String label;

  @override
  Component build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundColor: context.surfaceColor,
        borderRadius: BorderRadiusData.all(Dim.px(999)),
        padding: const EdgeInsets.symmetric(horizontal: Dim.rem(1), vertical: Dim.rem(0.55)),
        shadow: Shadow(color: Colors.black.withOpacity(0.15), blurRadius: 24, offsetY: 8),
      ),
      child: NakiText(
        label,
        style: TextStyle(color: context.textColor, fontSize: const Dim.rem(0.9), fontWeight: FontWeight.w600),
      ),
    );
  }
}
