import 'package:jaspr/client.dart';
import 'main.client.options.dart';
import 'app.dart';

void main() {
  Jaspr.initializeApp(options: defaultClientOptions);
  runApp(App());
}
