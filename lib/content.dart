/// Copy for the site, sourced from `_company_info.md`.
library;

class Product {
  const Product(this.name, this.tagline, this.description, {this.badge, this.icon});

  final String name;
  final String tagline;
  final String description;
  final String? badge;
  final String? icon;
}

class Service {
  const Service(this.title, this.description);

  final String title;
  final String description;
}

class Person {
  const Person(this.name, this.role, this.since, this.bio, this.highlight);

  final String name;
  final String role;
  final String since;
  final String bio;
  final String highlight;

  String get initials => name.split(' ').map((p) => p[0]).take(2).join();
}

const tagline = 'Technology that turns real-world challenges into possibilities.';

const aboutParagraphs = [
  'Poddin Technologies Limited is a technology company building intelligent, practical solutions for consumers and '
      'businesses of every size. Incorporated in December 2021, Poddin brings together modern software engineering, '
      'emerging technologies, and artificial intelligence to simplify everyday experiences and create new '
      'opportunities for growth.',
  'We believe innovation begins with understanding people. Our approach starts with the challenges individuals and '
      'organisations face, then applies the right technology to deliver solutions that are intuitive, reliable, and '
      'built to evolve.',
];

const mission =
    'To make technology a practical advantage for everyone we serve — empowering individuals, supporting growing '
    'businesses, and helping organisations navigate an increasingly digital world with confidence.';

const pillars = [
  Service('People first', 'We start with the challenge someone faces, then choose the technology.'),
  Service('AI at the core', 'Less repetitive work, more useful information, better-informed decisions.'),
  Service('Built to evolve', 'Intuitive, reliable products engineered to grow with their users.'),
];

const products = [
  Product(
    'PoddinApp',
    'Secure payments, rewarded.',
    'Our consumer platform, launched in 2024. Payments are held securely until buyers confirm delivery, users earn '
        'instant cashback on every confirmed order, and Zara provides dedicated in-app support.',
    badge: 'Google Play · App Store · AppGallery',
  ),
  Product(
    'PoddinAI & PoddinBot',
    'Intelligence where you already are.',
    'AI-powered tools available through PoddinApp, WhatsApp, and Telegram — removing barriers to entry and making '
        'PoddinApp accessible to everyone.',
    badge: 'App · WhatsApp · Telegram',
  ),
  Product(
    'PoddinPay',
    'Escrow and payment links.',
    'A web-based escrow and payment link platform that protects people selling and buying on social networks from '
        'fraud, building trust between buyers and sellers.',
    badge: 'Web',
  ),
  Product(
    'Spaq',
    'The next Poddin product.',
    'The next addition to the Poddin product family.',
    badge: 'Launching soon',
  ),
];

const services = [
  Service(
    'Artificial Intelligence Development',
    'AI-powered applications, assistants, and automation that simplify workflows and improve customer experiences.',
  ),
  Service(
    'Social Commerce Development',
    'Platforms that help businesses showcase products, connect with customers, and sell securely.',
  ),
  Service(
    'Consumer Applications · B2C',
    'Apps designed around everyday needs, with a focus on usability, performance, and engagement.',
  ),
  Service(
    'Internal Business Software · B2B',
    'Custom software to coordinate teams, manage information, and automate routine tasks.',
  ),
];

const team = [
  Person(
    'Samuel Cousin',
    'Founder & Chief Executive Officer',
    'December 2021 – present',
    'Leads Poddin’s vision and strategy with a decade of combined experience and a background in strategic '
        'marketing. Interests span mobile development, IT consulting, public speaking, and executive coaching.',
    'Certificate of Congressional Recognition, U.S. House of Representatives (Dec 2023)',
  ),
  Person(
    'Leader Bill',
    'Chief Operations Officer',
    'March 2025 – present',
    'Translates strategic priorities into coordinated action, bringing operational focus, team alignment, and clear '
        'communication to Poddin’s growth.',
    'TEDx licensee and lead organiser',
  ),
  Person(
    'Idara Israel',
    'Chief Relationships Manager',
    'September 2026 – present',
    'Builds and nurtures the relationships that connect Poddin with its customers, partners, and community, '
        'with a background in legal advocacy.',
    'Winning team and Best Oralist, 2026 WIPO Moot Court Competition',
  ),
];
