import 'package:jaspr/jaspr.dart';

import '../components/cta_band.dart';
import '../components/page_shell.dart';
import '../content/company.dart';
import '../sections/about_sections.dart';
import '../sections/milestones.dart';

class AboutPage extends StatelessComponent {
  const AboutPage({super.key});

  @override
  Component build(BuildContext context) {
    return const PageShell(
      seo: aboutPageSeo,
      children: [
        AboutHero(),
        WhoWeAre(),
        HowWeThink(),
        AiApproach(),
        MissionBand(),
        FounderSection(),
        MilestonesBand(padding: 72),
        LeadershipStrip(),
        CtaBand(),
      ],
    );
  }
}
