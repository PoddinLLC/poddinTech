import 'package:jaspr/dom.dart';
import 'package:naki_ui/theme.dart';

/// Brand colours taken from the Poddin palette (Pantone 4102 / 205 / 2040 / 207 CP).
abstract final class Brand {
  static const crimson = Color('#D91E52'); // 2040 CP
  static const rose = Color('#DD4F80'); // 205 CP
  static const raspberry = Color('#AB1E48'); // 207 CP
  static const burgundy = Color('#6B2433'); // 4102 CP
  static const ink = Color('#2A0F18');
  static const blush = Color('#FFF1F5');
  static const coral = Color('#FF6B6B'); // logo gradient start
  static const roseOnDark = Color('#FF8FAF');
  static const mist = Color('#E9C7D2');
}

const lightTheme = LightThemeData(
  colorSeed: ColorSeed(
    primary: Brand.crimson,
    secondary: Brand.burgundy,
    accent: Brand.rose,
    backgroundColor: Color('#FFFAFB'),
    baseTextColor: Brand.ink,
    subtitleColor: Color('#6F4A56'),
    surfaceVariantColor: Color('#FFFFFF'),
    focusBorderColor: Brand.raspberry,
  ),
  typography: TypographyScheme(fontFamily: ['Plus Jakarta Sans', 'Inter', 'system-ui', 'sans-serif']),
  radius: RadiusScheme(radiusMd: Dim.rem(0.75), radiusLg: Dim.rem(1.25)),
);

const darkTheme = DarkThemeData(
  colorSeed: ColorSeed(
    primary: Color('#FF4D7E'),
    secondary: Brand.rose,
    accent: Brand.coral,
    backgroundColor: Color('#16080D'),
    baseTextColor: Color('#FCEFF3'),
    subtitleColor: Color('#C9A3B0'),
    surfaceVariantColor: Color('#240F17'),
    focusBorderColor: Color('#FF7FA2'),
  ),
  typography: TypographyScheme(fontFamily: ['Plus Jakarta Sans', 'Inter', 'system-ui', 'sans-serif']),
  radius: RadiusScheme(radiusMd: Dim.rem(0.75), radiusLg: Dim.rem(1.25)),
);
