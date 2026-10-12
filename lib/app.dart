import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';

import 'brand.dart';
import 'content.dart';
import 'pages/home_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return NakiApp.router(
      title: 'Poddin Technologies Limited',
      themeMode: ThemeMode.system,
      cacheThemeMode: true,
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      seo: const SEO(title: 'Poddin Technologies Limited', description: tagline),
      routes: [Route(path: '/', name: 'home', builder: (context, state) => const HomePage())],
    );
  }
}
