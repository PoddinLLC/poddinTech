import 'package:jaspr/jaspr.dart';
import 'package:naki_ui/naki_ui.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return NakiApp.router();
  }
}
