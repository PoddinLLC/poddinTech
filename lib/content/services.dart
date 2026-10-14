import 'package:naki_ui/naki_ui.dart';

import 'company.dart';

class Capability {
  const Capability(this.icon, this.title, this.text);

  final IconData icon;
  final String title;
  final String text;
}

class Step {
  const Step(this.title, this.text);

  final String title;
  final String text;
}

/// A piece of work shown on a service page. Each subtype picks its own visual.
sealed class ServiceExample {
  const ServiceExample({required this.title, required this.text, this.linkLabel, this.linkUrl});

  final String title;
  final String text;
  final String? linkLabel;
  final String? linkUrl;
}

/// A logo on a tile, over a blurred copy of itself.
class LogoExample extends ServiceExample {
  const LogoExample({
    required super.title,
    required super.text,
    required this.logo,
    required this.logoAlt,
    required this.inset,
    required this.backdropOpacity,
    required this.backdropBlur,
    required this.backdropSize,
    super.linkLabel,
    super.linkUrl,
  });

  final String logo;
  final String logoAlt;
  final double inset;
  final double backdropOpacity;
  final double backdropBlur;
  final double backdropSize;
}

class Screenshot {
  const Screenshot(this.src, this.alt, {this.offsetTop = 0});

  final String src;
  final String alt;
  final double offsetTop;
}

/// One or two phone screenshots over a blurred backdrop.
class PhoneExample extends ServiceExample {
  const PhoneExample({
    required super.title,
    required super.text,
    required this.shots,
    required this.backdrop,
    required this.backdropOpacity,
    super.linkLabel,
    super.linkUrl,
  });

  final List<Screenshot> shots;
  final String backdrop;
  final double backdropOpacity;
}

/// A browser-window screenshot over a blurred backdrop.
class BrowserExample extends ServiceExample {
  const BrowserExample({
    required super.title,
    required super.text,
    required this.shot,
    required this.shotAlt,
    required this.address,
    required this.backdrop,
    required this.maxWidth,
    super.linkLabel,
    super.linkUrl,
  });

  final String shot;
  final String shotAlt;
  final String address;
  final String backdrop;
  final double maxWidth;
}

/// A wide card: illustration on one side, description and a short list on the other.
class SplitExample extends ServiceExample {
  const SplitExample({
    required super.title,
    required super.text,
    required this.bullets,
    super.linkLabel,
    super.linkUrl,
  });

  final List<String> bullets;
}

class ServiceInfo {
  const ServiceInfo({
    required this.slug,
    required this.number,
    required this.tag,
    required this.listTitle,
    required this.listBlurb,
    required this.title,
    required this.lead,
    required this.bestFor,
    required this.whatYouGet,
    required this.capabilitiesTitle,
    required this.capabilities,
    required this.examplesLabel,
    required this.examplesTitle,
    required this.examples,
    required this.exampleColumnMin,
    required this.exampleVisualHeight,
    required this.processTitle,
    required this.steps,
    required this.ctaTitle,
  });

  final String slug;
  final String number;

  /// Eyebrow on the page, e.g. `Service 03 · B2C`.
  final String tag;

  /// Title and one-line description on the homepage services list.
  final String listTitle;
  final String listBlurb;

  final String title;
  final String lead;
  final String bestFor;
  final String whatYouGet;
  final String capabilitiesTitle;
  final List<Capability> capabilities;
  final String examplesLabel;
  final String examplesTitle;
  final List<ServiceExample> examples;

  /// Minimum card width and visual height for the examples grid.
  final double exampleColumnMin;
  final double exampleVisualHeight;
  final String processTitle;
  final List<Step> steps;
  final String ctaTitle;
}

const _poddinLogo = 'images/logo.png';
const _poddinPayLogo = 'images/products/poddinpay-logo.png';
const _poddinPayForm = 'images/products/poddinpay-form-light.jpg';
const _poddinAppFeed = 'images/products/banner3.jpg';
const _poddinAppWallet = 'images/products/banner6.jpg';

const services = [
  ServiceInfo(
    slug: 'ai',
    number: '01',
    tag: 'Service 01',
    listTitle: 'Artificial intelligence development',
    listBlurb:
        'AI-powered applications, assistants and automation that simplify workflows and improve customer experiences.',
    title: 'Artificial intelligence development',
    lead:
        "We design and build AI-powered assistants, applications and automation that take repetitive work off people's "
        'plates and make information easier to use.',
    bestFor:
        'Teams that want to automate routine questions, make internal knowledge searchable, or add an assistant to a '
        'product.',
    whatYouGet: 'A working assistant or automation, integrated with the channels your users already use.',
    capabilitiesTitle: 'Practical AI, shaped around your process.',
    capabilities: [
      Capability(
        LucideIcons.icon_message_circle,
        'Conversational assistants',
        'Assistants that answer questions, guide tasks and hand over to a person when needed, on web, mobile and '
            'messaging platforms.',
      ),
      Capability(
        LucideIcons.icon_workflow,
        'Workflow automation',
        'Automation for repetitive back-office steps, such as sorting requests, drafting replies and routing work to '
            'the right team.',
      ),
      Capability(
        LucideIcons.icon_search,
        'Knowledge and search',
        'Search and summaries across your documents and data, so staff and customers find what they need faster.',
      ),
      Capability(
        LucideIcons.icon_bot,
        'Bots for messaging channels',
        'Bots that live in WhatsApp and Telegram, reaching people in the places they already spend time.',
      ),
    ],
    examplesLabel: 'Examples',
    examplesTitle: 'AI we have built.',
    examples: [
      LogoExample(
        title: 'Poddin AI and Bot',
        text:
            'Intelligent assistance inside PoddinApp, WhatsApp and Telegram, bringing help to platforms people '
            'already use.',
        logo: _poddinLogo,
        logoAlt: '',
        inset: 62,
        backdropOpacity: 0.6,
        backdropBlur: 24,
        backdropSize: 280,
        linkLabel: 'Explore Poddin AI',
        linkUrl: 'https://poddinapp.com/bot',
      ),
      LogoExample(
        title: 'IsraelAssembly AI and Bot',
        text:
            'An AI and WhatsApp bot for Israel Assembly, a provincial headquarters in the Redeemed Christian Church '
            'of God. Members can check in for services and send feedback or prayer requests anonymously.',
        logo: 'images/partners/rccg.png',
        logoAlt: 'Redeemed Christian Church of God logo',
        inset: 76,
        backdropOpacity: 0.5,
        backdropBlur: 26,
        backdropSize: 300,
      ),
      LogoExample(
        title: 'Versus Player AI',
        text:
            'A chat-based AI in the Versus Player music app. Listeners describe what they want and it imports songs '
            'from Spotify, YouTube Music and SoundCloud based on prompts, mood and other parameters.',
        logo: 'images/partners/versus-logo.svg',
        logoAlt: 'Versus logo',
        inset: 66,
        backdropOpacity: 0.4,
        backdropBlur: 26,
        backdropSize: 300,
        linkLabel: 'Explore Versus',
        linkUrl: 'https://versussongs.com',
      ),
    ],
    exampleColumnMin: 300,
    exampleVisualHeight: 200,
    processTitle: 'From the problem to a working assistant.',
    steps: [
      Step(
        'Understand the problem',
        'We start with the challenge people face, then decide whether AI is the right tool for it.',
      ),
      Step(
        'Prototype early',
        'A small working version, tested with your real questions and content, before we build more.',
      ),
      Step(
        'Build and integrate',
        'We connect it to your systems and channels, with clear limits on what it can and cannot do.',
      ),
      Step('Launch and improve', 'We watch how people use it and keep refining the answers and the experience.'),
    ],
    ctaTitle: 'Have a task you would like an assistant to take on?',
  ),
  ServiceInfo(
    slug: 'commerce',
    number: '02',
    tag: 'Service 02',
    listTitle: 'Social commerce development',
    listBlurb: 'Platforms that help businesses showcase products, connect with customers and sell securely.',
    title: 'Social commerce development',
    lead:
        'We build platforms where businesses showcase products, connect with customers and sell, with payment '
        'protection built into the experience.',
    bestFor:
        'Brands selling through social channels, marketplaces and communities that need customers to trust the '
        'checkout.',
    whatYouGet: 'A storefront and ordering experience with secure payment flows, designed for mobile and web.',
    capabilitiesTitle: 'Selling that customers can trust.',
    capabilities: [
      Capability(
        LucideIcons.icon_shopping_bag,
        'Storefronts and catalogues',
        'Product pages and feeds that make it easy for customers to browse, compare and buy.',
      ),
      Capability(
        LucideIcons.icon_shield_check,
        'Secure checkout and escrow',
        'Payments held until delivery is confirmed, which reduces fraud and builds buyer confidence.',
      ),
      Capability(
        LucideIcons.icon_message_circle,
        'Chat and support',
        'Conversations between buyers and sellers inside the experience, with help available when something goes '
            'wrong.',
      ),
      Capability(
        LucideIcons.icon_circle_dollar_sign,
        'Rewards and referrals',
        'Cashback and referral features that give customers a reason to come back and bring others.',
      ),
    ],
    examplesLabel: 'Examples',
    examplesTitle: 'Social commerce we have built.',
    examples: [
      PhoneExample(
        title: 'PoddinApp',
        text:
            'A consumer platform launched in 2024 where payments are protected until buyers confirm delivery, orders '
            'earn instant cashback, and support is available in the app.',
        shots: [
          Screenshot(_poddinAppFeed, 'PoddinApp screen: a personalised product feed'),
          Screenshot(_poddinAppWallet, 'PoddinApp screen: wallet history showing instant cashback', offsetTop: 36),
        ],
        backdrop: _poddinLogo,
        backdropOpacity: 0.55,
        linkLabel: 'Get PoddinApp',
        linkUrl: 'https://poddinapp.com/install',
      ),
      BrowserExample(
        title: 'PoddinPay',
        text:
            'A web-based escrow and payment link platform, launched in May 2026, that protects people buying and '
            'selling on social networks from fraud.',
        shot: _poddinPayForm,
        shotAlt:
            "PoddinPay's payment link page: a form for the item being sold, price, customer contact, delivery "
            'duration and payout details',
        address: 'poddinpay.com/create-payment-link',
        backdrop: _poddinPayLogo,
        maxWidth: 380,
        linkLabel: 'Explore PoddinPay',
        linkUrl: 'https://poddinpay.com',
      ),
    ],
    exampleColumnMin: 340,
    exampleVisualHeight: 300,
    processTitle: 'From idea to a store customers trust.',
    steps: [
      Step('Map your customers', 'We learn how your buyers find you, what worries them and where sales are lost.'),
      Step('Design the experience', 'Browsing, ordering and payment flows designed to feel simple and safe.'),
      Step('Build with protection', 'Escrow, order tracking and support are part of the build, not an afterthought.'),
      Step('Launch and grow', 'We release, measure what customers do and keep improving the store.'),
    ],
    ctaTitle: 'Planning to sell more securely online?',
  ),
  ServiceInfo(
    slug: 'consumer',
    number: '03',
    tag: 'Service 03 · B2C',
    listTitle: 'Consumer applications, B2C',
    listBlurb: 'Apps designed around everyday needs, with a focus on usability, performance and engagement.',
    title: 'Consumer applications',
    lead:
        'We design and build mobile and web apps around everyday needs, with careful attention to usability, performance and keeping people engaged.',
    bestFor: 'Companies launching or improving a consumer product on iOS, Android or the web.',
    whatYouGet: 'A polished, tested app, from design through release and ongoing improvement.',
    capabilitiesTitle: 'Apps people want to open again.',
    capabilities: [
      Capability(
        LucideIcons.icon_smartphone,
        'Mobile apps',
        'Native-feeling apps for iOS and Android, built for speed and reliability on everyday devices.',
      ),
      Capability(
        LucideIcons.icon_monitor,
        'Web apps',
        'Browser-based products that work well on any screen, with no install needed.',
      ),
      Capability(
        LucideIcons.icon_pen_tool,
        'Product design',
        'Interface and experience design shaped by how people actually use the product day to day.',
      ),
      Capability(
        LucideIcons.icon_refresh_cw,
        'Release and iteration',
        'App store launches, then steady improvements informed by real usage and feedback.',
      ),
    ],
    examplesLabel: 'Examples',
    examplesTitle: 'Consumer products we have built.',
    examples: [
      PhoneExample(
        title: 'Versus Player',
        text:
            'A music app that brings songs and playlists from several streaming services into one personal library, '
            'with tag search and playlists.',
        shots: [
          Screenshot(
            'images/products/versus-shot1.jpg',
            'Versus Player screen: import music from Spotify, SoundCloud and YouTube Music into one library',
          ),
        ],
        backdrop: 'images/products/versus-shot1.jpg',
        backdropOpacity: 0.5,
        linkLabel: 'View on the App Store',
        linkUrl: 'https://apps.apple.com/us/app/versus-player/id6463187590',
      ),
      PhoneExample(
        title: 'PoddinApp',
        text:
            'A social commerce app that protects payments until delivery is confirmed, rewards orders with cashback and includes in-app support.',
        shots: [Screenshot(_poddinAppFeed, 'PoddinApp screen: a personalised product feed')],
        backdrop: _poddinAppFeed,
        backdropOpacity: 0.55,
        linkLabel: 'Explore PoddinApp',
        linkUrl: 'https://poddinapp.com',
      ),
      BrowserExample(
        title: 'PoddinPay',
        text:
            'A web app for creating secure payment links and holding funds in escrow, so buyers and sellers can trade with confidence.',
        shot: _poddinPayForm,
        shotAlt: "PoddinPay's payment link page",
        address: '',
        backdrop: _poddinPayLogo,
        maxWidth: 260,
        linkLabel: 'Explore PoddinPay',
        linkUrl: 'https://poddinpay.com',
      ),
    ],
    exampleColumnMin: 250,
    exampleVisualHeight: 280,
    processTitle: 'From concept to the app store.',
    steps: [
      Step('Discover', 'We learn who the app is for and the everyday need it should meet.'),
      Step('Design', 'Clickable designs you can react to before any code is written.'),
      Step('Build and test', 'Regular builds to try on real devices, with attention to speed and stability.'),
      Step('Launch and improve', 'We release to the stores and keep improving from real usage.'),
    ],
    ctaTitle: 'Have an app idea for everyday life?',
  ),
  ServiceInfo(
    slug: 'business',
    number: '04',
    tag: 'Service 04 · B2B',
    listTitle: 'Internal business software, B2B',
    listBlurb: 'Custom software to coordinate teams, manage information and automate routine tasks.',
    title: 'Internal business software',
    lead:
        'We build custom software that helps organisations coordinate teams, manage information and automate routine tasks.',
    bestFor:
        'Organisations that have outgrown spreadsheets and email threads, or need a system shaped around their own process.',
    whatYouGet:
        'A tailored internal tool that fits how your team already works, with training and support to adopt it.',
    capabilitiesTitle: 'Software that fits how you work.',
    capabilities: [
      Capability(
        LucideIcons.icon_users,
        'Relationship management',
        'CRM systems that keep records, conversations and follow-ups in one place.',
      ),
      Capability(
        LucideIcons.icon_workflow,
        'Workflows and approvals',
        'Digital versions of your routine processes, with clear owners, status and sign-off.',
      ),
      Capability(
        LucideIcons.icon_chart_column,
        'Dashboards and reporting',
        'Clear views of what is happening across your teams, without manual compilation.',
      ),
      Capability(
        LucideIcons.icon_plug,
        'Integrations and data migration',
        'Connections to the tools you already use, and a careful move of existing data.',
      ),
    ],
    examplesLabel: 'Example',
    examplesTitle: 'Business software we have built.',
    examples: [
      SplitExample(
        title: 'Israel Assembly CRM',
        text:
            'A custom CRM for Israel Assembly, a provincial headquarters in the Redeemed Christian Church of God, giving leaders one place to keep member records, follow-ups and communication.',
        bullets: [
          'Member records and history in one place',
          'Follow-ups and reminders for the team',
          'Messages and announcements to members',
          'Reports for leadership',
        ],
      ),
    ],
    exampleColumnMin: 320,
    exampleVisualHeight: 340,
    processTitle: 'From the way you work today to a system that supports it.',
    steps: [
      Step('Learn your process', 'We sit with the people who do the work to see where time and information get lost.'),
      Step('Agree the scope', 'A clear first release, so the most valuable parts are in use sooner.'),
      Step('Build with your team', 'Regular reviews so the software matches how your people actually work.'),
      Step('Roll out and support', 'Migration, training and support through the first stretch of real use.'),
    ],
    ctaTitle: 'Is there a process your team would like to simplify?',
  ),
];

/// Title and description of a service page. Shared by the page itself and by `tool/generate_page_html.dart`.
PageSeo serviceSeo(ServiceInfo service) =>
    PageSeo(title: '${service.title} | ${Company.shortName}', description: service.lead);

ServiceInfo? serviceBySlug(String slug) {
  for (final service in services) {
    if (service.slug == slug.toLowerCase()) return service;
  }
  return null;
}
