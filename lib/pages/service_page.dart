import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/naki_ui.dart';
import '../content/company.dart';

import '../components/page_shell.dart';
import '../components/typography.dart';
import '../content/services.dart';

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
        Band(children: [Title(slug, level: 1, size: 'h-hero')]),
      ],
    );
  }
}
