import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/naki_ui.dart';

import '../components/cta_band.dart';
import '../components/page_shell.dart';
import '../content/company.dart';
import '../content/services.dart';
import '../sections/service_sections.dart';

/// One page for all four services. The copy, examples and steps come from [services].
class ServicePage extends StatelessComponent {
  const ServicePage({required this.slug, super.key});

  final String slug;

  @override
  Component build(BuildContext context) {
    final info = serviceBySlug(slug);

    if (info == null) {
      return const PageNotFound(
        errorTitle: 'Service not found',
        errorText:
            'The service you are looking for does not exist. Return to homepage to know more about our services.',
      );
    }

    return PageShell(
      seo: PageSeo(
        title: '${info.title} | ${Company.shortName}',
        description: info.lead,
      ),
      children: [
        ServiceHero(info),
        ServiceCapabilities(info),
        ServiceExamples(info),
        ServiceProcess(info),
        CtaBand(title: info.ctaTitle),
      ],
    );
  }
}
