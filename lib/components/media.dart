import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';
import 'package:naki_ui/theme.dart';

import '../theme/palette.dart';

/// A heavily blurred copy of an image that fills its (relatively positioned)
/// parent, so a card visual is never an empty rectangle. [opacity] and
/// [blur] tune it per image.
class BlurBackdrop extends StatelessComponent {
  const BlurBackdrop(this.src, {this.opacity = 0.5, this.blur = 30, this.contain = false, super.key});

  final String src;
  final double opacity;
  final double blur;

  /// `contain` for logos, `cover` for photographs and screenshots.
  final bool contain;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'backdrop${contain ? ' backdrop--contain' : ''}',
      styles: Styles(raw: {'--op': '$opacity', '--blur': '${blur}px'}),
      attributes: const {'aria-hidden': 'true'},
      [Image(src, alt: '', fit: contain ? ObjectFit.contain : ObjectFit.cover)],
    );
  }
}

/// A phone screenshot with a rounded top edge and soft shadow,
/// cropped by its parent at the bottom.
class PhoneShot extends StatelessComponent {
  const PhoneShot(this.src, {required this.alt, this.width = 150, this.offsetTop = 0, super.key});

  final String src;
  final String alt;
  final double width;
  final double offsetTop;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'phone-shot',
      styles: Styles(
        width: width.px,
        margin: .only(top: offsetTop.px),
      ),
      [Image(src, alt: alt, lazyLoad: true)],
    );
  }
}

/// A browser window mock with an address bar around a screenshot.
class BrowserFrame extends StatelessComponent {
  const BrowserFrame({required this.src, required this.alt, required this.address, this.compact = false, super.key});

  final String src;
  final String alt;
  final String address;
  final bool compact;

  @override
  Component build(BuildContext context) {
    return div(classes: 'browser${compact ? ' browser--compact' : ''}', [
      div(classes: 'browser-bar', [
        span(classes: 'dot', []),
        span(classes: 'dot', []),
        span(classes: 'dot', []),
        if (address.isNotEmpty) span(classes: 'browser-address', [.text(address)]),
      ]),
      Image(
        src,
        alt: alt,
        size: const SizeConstraints(width: Dim.percent(100)),
        lazyLoad: true,
      ),
    ]);
  }
}

/// A square white tile holding a logo, lifted off the page by a soft shadow.
class LogoTile extends StatelessComponent {
  const LogoTile(this.src, {required this.alt, this.size = 96, this.inset = 62, super.key});

  final String src;
  final String alt;
  final double size;

  /// Rendered size of the logo inside the tile.
  final double inset;

  @override
  Component build(BuildContext context) {
    return Container(
      classes: 'logo-tile',
      decoration: BoxDecoration(
        backgroundColor: Palette.white,
        border: BorderData(color: Palette.line, width: const Dim.px(1)),
        borderRadius: BorderRadiusData.all(Dim.px(size / 4)),
      ),
      width: Dim.px(size),
      height: Dim.px(size),
      child: Align(
        alignment: Alignment.center,
        child: Image(
          src,
          alt: alt,
          size: SizeConstraints(width: Dim.px(inset), height: Dim.px(inset)),
          fit: ObjectFit.contain,
        ),
      ),
    );
  }
}
