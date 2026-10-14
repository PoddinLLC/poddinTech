import 'package:jaspr/jaspr.dart';

import '../components/page_shell.dart';
import '../content/company.dart';
import '../sections/contact.dart';
import '../sections/home_hero.dart';
import '../sections/leadership.dart';
import '../sections/milestones.dart';
import '../sections/press.dart';
import '../sections/products.dart';
import '../sections/services_list.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return const PageShell(
      seo: homePageSeo,
      children: [
        HomeHero(),
        MilestonesBand(),
        ProductsSection(),
        ServicesSection(),
        LeadershipSection(),
        PressSection(),
        ContactSection(),
      ],
    );
  }
}
