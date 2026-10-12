import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/framework.dart';
import 'package:naki_ui/naki_ui.dart';

import '../sections/about.dart';
import '../sections/footer.dart';
import '../sections/hero.dart';
import '../sections/navbar.dart';
import '../sections/products.dart';
import '../sections/services.dart';
import '../sections/team.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return const Scaffold(
      appBar: SiteNavbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Hero(), About(), Products(), Services(), Team(), ContactCta(), SiteFooter()],
        ),
      ),
    );
  }
}
