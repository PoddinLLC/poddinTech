// Writes one HTML entry point per route, each with that page's title, description, canonical URL and
// Open Graph / Twitter tags already in the markup.
//
// The site renders in the browser, so the HTML a server returns is an empty shell. Social crawlers
// (WhatsApp, Facebook, LinkedIn, X) and most link unfurlers do not run JavaScript, so without this every link
// preview is blank. Static hosts serve `about/index.html` for `/about`, and the app boots over it as usual.
//
// Titles and descriptions come from the same data the pages use (`lib/content`), so they cannot drift apart.
//
//   dart run tool/generate_page_html.dart           write the files into web/
//   dart run tool/generate_page_html.dart --check   exit 1 if any file is missing or out of date (for CI)
import 'dart:io';

import 'package:poddin_tech/content/company.dart';
import 'package:poddin_tech/content/services.dart';

/// Shown in link previews. Must be an absolute URL. 1200 x 630 (1.91:1) is what Facebook, LinkedIn, WhatsApp
/// and X's large card all expect.
const _shareImage = '${Company.siteUrl}/images/og-banner.jpg';
const _shareImageWidth = 1200;
const _shareImageHeight = 630;
const _shareImageAlt = '${Company.name}: ${Company.tagline}';

const _fontStylesheet =
    'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@400;500;600&family=IBM+Plex+Serif:wght@400;500&display=swap';

typedef _Page = ({String path, PageSeo seo});

final _pages = <_Page>[
  (path: '/', seo: homePageSeo),
  (path: '/about', seo: aboutPageSeo),
  for (final service in services) (path: '/services/${service.slug}', seo: serviceSeo(service)),
];

String _escape(String value) => value
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&#39;');

String _render(_Page page) {
  final title = _escape(page.seo.title);
  final description = _escape(page.seo.description);
  final url = page.path == '/' ? Company.siteUrl : '${Company.siteUrl}${page.path}';

  // Tags marked data-seo="static" are removed by PageMeta once the app boots. After that the app keeps the
  // title and meta tags current as the visitor navigates, and keeping both would leave duplicates.
  String meta(String attribute, String key, String content) =>
      '    <meta $attribute="$key" content="$content" data-seo="static">';

  return [
    '<!DOCTYPE html>',
    '<html lang="en">',
    '',
    '<head>',
    '    <meta charset="utf-8">',
    '    <title>$title</title>',
    meta('name', 'description', description),
    '    <link rel="canonical" href="$url" data-seo="static">',
    '    <link rel="icon" type="image/png" href="/images/favicon.png">',
    '    <link rel="preconnect" href="https://fonts.googleapis.com/">',
    '    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>',
    '    <link rel="stylesheet" href="$_fontStylesheet">',
    '    <link rel="stylesheet" href="/main.css">',
    '    <link rel="stylesheet" href="/site.css">',
    meta('property', 'og:type', 'website'),
    meta('property', 'og:site_name', _escape(Company.name)),
    meta('property', 'og:locale', 'en'),
    meta('property', 'og:url', url),
    meta('property', 'og:title', title),
    meta('property', 'og:description', description),
    meta('property', 'og:image', _shareImage),
    meta('property', 'og:image:width', '$_shareImageWidth'),
    meta('property', 'og:image:height', '$_shareImageHeight'),
    meta('property', 'og:image:alt', _escape(_shareImageAlt)),
    meta('name', 'twitter:card', 'summary_large_image'),
    meta('name', 'twitter:title', title),
    meta('name', 'twitter:description', description),
    meta('name', 'twitter:image', _shareImage),
    meta('name', 'twitter:image:alt', _escape(_shareImageAlt)),
    '    <script defer src="/main.client.dart.js"></script>',
    '</head>',
    '',
    '<body>',
    '</body>',
    '',
    '</html>',
    '',
  ].join('\n');
}

/// Collapses whitespace so an editor re-wrapping a long tag is not mistaken for a stale file.
String _normalize(String html) => html.replaceAll(RegExp(r'\s+'), ' ').replaceAll('> <', '><').trim();

File _fileFor(_Page page) => File(page.path == '/' ? 'web/index.html' : 'web${page.path}/index.html');

void main(List<String> args) {
  final check = args.contains('--check');
  var stale = 0;

  for (final page in _pages) {
    final file = _fileFor(page);
    final html = _render(page);
    final current = file.existsSync() ? file.readAsStringSync() : null;

    if (current != null && _normalize(current) == _normalize(html)) continue;

    if (check) {
      stderr.writeln('out of date: ${file.path}');
      stale++;
    } else {
      file.parent.createSync(recursive: true);
      file.writeAsStringSync(html);
      stdout.writeln('wrote ${file.path}');
    }
  }

  if (check && stale > 0) {
    stderr.writeln('Run: dart run tool/generate_page_html.dart');
    exit(1);
  }
  if (stale == 0 && !check) stdout.writeln('All page HTML is up to date.');
}
