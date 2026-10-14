import 'package:jaspr/dom.dart';
import 'package:naki_ui/theme.dart';

/// Poddin brand colours (Pantone 4102 / 2040 / 207 / 205 CP) and the neutrals
/// used around them. Burgundy anchors the page and carries text accents.
/// Crimson is reserved for the one primary action in a view. Rose (deepened from
/// Pantone 205 CP so white text clears 4.5:1) fills full-width bands.
abstract final class Palette {
  static const burgundy = Color('#6B2433');
  static const crimson = Color('#D91E52');
  static const crimsonHover = Color('#B8183F');
  static const rose = Color('#C23A6A');

  static const ink = Color('#1F1A1C');
  static const body = Color('#4A4246');
  static const muted = Color('#5E5559');
  static const line = Color('#E4DDDA');
  static const subtle = Color('#F4F0EE');
  static const ground = Color('#FBF9F8');
  static const white = Color('#FFFFFF');
}

const _typography = TypographyScheme(fontFamily: ['IBM Plex Sans', 'system-ui', 'sans-serif']);

/// The approved design is light only, so [DarkThemeData] mirrors the
/// defaults and is never selected.
const lightTheme = LightThemeData(
  colorSeed: ColorSeed(
    primary: Palette.crimson,
    secondary: Palette.burgundy,
    accent: Palette.rose,
    backgroundColor: Palette.ground,
    baseTextColor: Palette.ink,
    subtitleColor: Palette.body,
    surfaceVariantColor: Palette.white,
    focusBorderColor: Palette.burgundy,
  ),
  typography: _typography,
  radius: RadiusScheme(radiusMd: Dim.px(8), radiusLg: Dim.px(16)),
);

const darkTheme = DarkThemeData(typography: _typography);
