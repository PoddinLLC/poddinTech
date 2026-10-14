import 'package:jaspr/jaspr.dart';
import '../content/company.dart';

import '../components/page_shell.dart';
import '../components/typography.dart';

class AboutPage extends StatelessComponent {
  const AboutPage({super.key});

  @override
  Component build(BuildContext context) {
    return const PageShell(
      seo: aboutPageSeo,
      children: [
        Band(children: [Title('Innovation begins with understanding people.', level: 1, size: 'h-hero')]),
      ],
    );
  }
}
