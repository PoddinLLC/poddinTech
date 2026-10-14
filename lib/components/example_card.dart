import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';

import '../content/services.dart';
import 'cards.dart';
import 'links.dart';
import 'media.dart';

/// A piece of past work: a visual on top, then a title, description and optional link.
class ExampleCard extends StatelessComponent {
  const ExampleCard(this.example, {required this.visualHeight, super.key});

  final ServiceExample example;
  final double visualHeight;

  Component _visual() {
    final example = this.example;
    return switch (example) {
      LogoExample() => div(classes: 'visual visual--center', styles: Styles(height: visualHeight.px), [
        BlurBackdrop(
          example.logo,
          opacity: example.backdropOpacity,
          blur: example.backdropBlur,
          size: example.backdropSize,
          contain: true,
        ),
        LogoTile(example.logo, alt: example.logoAlt, inset: example.inset),
      ]),
      PhoneExample() => div(classes: 'visual visual--top visual--phones', styles: Styles(height: visualHeight.px), [
        BlurBackdrop(example.backdrop, opacity: example.backdropOpacity),
        for (final shot in example.shots) PhoneShot(shot.src, alt: shot.alt, offsetTop: shot.offsetTop),
      ]),
      BrowserExample() => div(classes: 'visual visual--top', styles: Styles(height: visualHeight.px), [
        BlurBackdrop(example.backdrop, opacity: 0.45, blur: 32),
        BrowserFrame(
          src: example.shot,
          alt: example.shotAlt,
          address: example.address,
          compact: example.address.isEmpty,
          flush: true,
          maxWidth: example.maxWidth,
        ),
      ]),
      SplitExample() => const Component.empty(),
    };
  }

  @override
  Component build(BuildContext context) {
    return Surface(
      radius: 16,
      clip: true,
      classes: 'example-card',
      child: div(classes: 'example-inner', [
        _visual(),
        div(classes: 'example-body', [
          div(classes: 'example-title', [.text(example.title)]),
          p(classes: 'small', [.text(example.text)]),
          if (example.linkUrl != null) TextLink(label: example.linkLabel!, to: example.linkUrl!, external: true),
        ]),
      ]),
    );
  }
}

/// The wide card used for a single flagship example: illustration beside
/// a description and short list.
class SplitExampleCard extends StatelessComponent {
  const SplitExampleCard(this.example, {super.key});

  final SplitExample example;

  @override
  Component build(BuildContext context) {
    return Surface(
      radius: 16,
      clip: true,
      child: div(classes: 'grid split', styles: Styles(raw: {'--min': '320px', '--gap': '0px'}), [
        div(classes: 'split-visual', [
          const BlurBackdrop('images/partners/rccg.png', opacity: 0.5, blur: 28, size: 460, contain: true),
          div(
            classes: 'crm-mock',
            attributes: const {'aria-hidden': 'true'},
            [
              img(src: 'images/crm-mock.svg', alt: ''),
            ],
          ),
          const LogoTile(
            'images/partners/rccg.png',
            alt: 'Redeemed Christian Church of God logo',
            size: 150,
            inset: 120,
          ),
        ]),
        div(classes: 'split-body', [
          div(classes: 'split-title', [.text(example.title)]),
          p(classes: 'text', [.text(example.text)]),
          div(classes: 'bullet-list', [
            for (final bullet in example.bullets) span([.text(bullet)]),
          ]),
        ]),
      ]),
    );
  }
}
