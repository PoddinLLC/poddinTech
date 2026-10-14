import 'package:jaspr/dom.dart' hide Padding, Transform, Visibility;
import 'package:jaspr/jaspr.dart';

import '../content/company.dart';
import 'links.dart';
import 'site_header.dart';

class _FooterColumn extends StatelessComponent {
  const _FooterColumn({required this.title, required this.children});

  final String title;
  final List<Component> children;

  @override
  Component build(BuildContext context) {
    return div(classes: 'footer-col', [
      div(styles: Styles(fontWeight: .w600), [.text(title)]),
      ...children,
    ]);
  }
}

Component _footerLink(String label, String to, {bool external = false}) {
  if (external) {
    return a(
      href: to,
      classes: 'lnk footer-link',
      target: Target.blank,
      attributes: const {'rel': 'noopener noreferrer'},
      [.text(label)],
    );
  }
  return a(href: to, classes: 'lnk footer-link', [.text(label)]);
}

class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'container footer-top', [
        div(classes: 'footer-about', [
          div(styles: Styles(display: .flex, alignItems: .center, gap: .all(10.px)), [
            const Brand(size: 30, fontSize: 16),
          ]),
          p(classes: 'footer-summary', [.text(Company.summary)]),
          const TextLink(label: 'About us', to: '/about'),
        ]),
        _FooterColumn(
          title: 'Products',
          children: [
            _footerLink('PoddinApp', 'https://poddinapp.com/install', external: true),
            _footerLink('PoddinAI and PoddinBot', 'https://poddinapp.com/bot', external: true),
            _footerLink('PoddinPay', 'https://poddinpay.com', external: true),
            span(classes: 'footer-muted', [.text('Coming soon')]),
          ],
        ),
        _FooterColumn(
          title: 'Services',
          children: [
            _footerLink('AI development', '/services/ai'),
            _footerLink('Social commerce', '/services/commerce'),
            _footerLink('Consumer apps', '/services/consumer'),
            _footerLink('Business software', '/services/business'),
          ],
        ),
        _FooterColumn(
          title: 'Company',
          children: [
            _footerLink('About', '/about'),
            _footerLink('Leadership', '/#leadership'),
            _footerLink('Press', '/#press'),
            _footerLink('Contact', '/#contact'),
          ],
        ),
      ]),
      div(classes: 'container footer-legal', [
        div(classes: 'footer-legal-line', [.text(Company.copyright)]),
      ]),
    ]);
  }
}
