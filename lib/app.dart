import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';

import 'content/company.dart';
import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/service_page.dart';
import 'theme/palette.dart';

class App extends StatelessComponent {
  const App({super.key});

  static const _ibmFontFamily =
      'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@400;500;600&family=IBM+Plex+Serif:wght@400;500&display=swap';

  @override
  Component build(BuildContext context) {
    return NakiApp.router(
      locale: 'en',
      basePath: '/',
      favicon: 'images/favicon.png',
      themeMode: ThemeMode.light,
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      scrollBarConfiguration: ScrollBarConfiguration(
        thumbColor: Palette.rose,
        trackColor: Palette.ground,
        width: 2,
        height: 2,
        radius: 10,
      ),
      head: [
        // theme color
        meta(name: 'theme-color', content: Palette.ground.value),
        // fonts
        link(href: 'https://fonts.googleapis.com/', rel: 'preconnect'),
        link(href: 'https://fonts.gstatic.com/', rel: 'preconnect', attributes: const {'crossorigin': ''}),
        link(href: _ibmFontFamily, rel: 'stylesheet'),
        // styles
        link(href: 'main.css', rel: 'stylesheet'),
        link(href: 'site.css', rel: 'stylesheet'),
      ],
      seo: SEO(
        socialMediaBanner: 'images/og-banner.jpg',
        url: kDebugMode ? null : Company.siteUrl,
        robots: [
          'index',
          'follow',
          'max-image-preview:large',
          'max-snippet:-1',
          'max-video-preview:-1',
        ],
        keywords: [
          'Artificial Intelligence',
          'Software Engineering',
          'Web Development',
          'Mobile Development',
          'Cloud Computing',
          'DevOps',
          'poddin technologies limited',
          'poddin',
          'poddin tech',
          'poddin ltd',
          'poddin technologies',
          'poddin technologies ltd',
          'IoT',
          'FinTech',
          'HealthTech',
          'EduTech',
          'AgriTech',
          'AI Company',
          'Software Engineering Company in Nigeria',
          'Web Development Company in Nigeria',
          'Mobile Development Company in Nigeria',
        ],
      ),
      routes: [
        Route(path: '/', name: 'home', builder: (context, state) => const HomePage()),
        Route(path: '/about', name: 'about', builder: (context, state) => const AboutPage()),
        Route(
          path: '/services/:slug',
          name: 'service',
          builder: (context, state) => ServicePage(slug: state.params['slug'] ?? ''),
        ),
      ],
      errorPage: const PageNotFound(
        errorTitle: 'Page not found',
        errorText: 'The page you are looking for does not exist. Return to homepage.',
      ),
    );
  }
}
