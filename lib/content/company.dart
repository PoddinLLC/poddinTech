/// Company facts and copy. Only confirmed facts appear here: dates, launches,
/// sponsorships and press coverage.
abstract final class Company {
  static const name = 'Poddin Technologies Limited';
  static const shortName = 'Poddin Technologies';

  /// Public origin, used for canonical and social-preview URLs, which must be absolute.
  static const siteUrl = 'https://poddin.net';
  static const tagline = 'Technology that turns real-world challenges into possibilities.';
  static const intro =
      'We build intelligent, practical solutions for consumers and businesses of every size, bringing together modern software engineering, emerging technologies and artificial intelligence.';
  static const summary =
      'A technology company, incorporated in December 2021, building intelligent, practical solutions for '
      'consumers and businesses of every size.';
  static const productsLine = 'PoddinApp, PoddinAI and PoddinBot, PoddinPay, and a new product coming soon';
  static final copyright = '© ${DateTime.now().year} Poddin Technologies Limited. All rights reserved.';
}

class Milestone {
  const Milestone(this.year, this.text);

  final String year;
  final String text;
}

const milestones = [
  Milestone('2021', 'Poddin Technologies Limited incorporated'),
  Milestone('2024', 'PoddinApp launched'),
  Milestone('2026', 'PoddinPay launched'),
];

const sponsorships = [
  'Sponsored TEDx Unilag 2026',
  'Sponsored University of Lagos Faculty of Law Business Competition 2026',
];

class Leader {
  const Leader({
    required this.name,
    required this.role,
    required this.since,
    required this.bio,
    required this.highlight,
    required this.image,
    required this.focusY,
  });

  final String name;
  final String role;
  final String since;
  final String bio;
  final String highlight;
  final String image;

  /// Vertical object-position (percent) that keeps the face in the square crop.
  final int focusY;
}

const leaders = [
  Leader(
    name: 'Samuel Cousin',
    role: 'Founder and Chief Executive Officer',
    since: 'December 2021 to present',
    bio:
        "Leads Poddin's vision and direction, with more than a decade of combined experience and a background in "
        'strategic marketing.',
    highlight: 'Certificate of Congressional Recognition, U.S. House of Representatives, December 2023',
    image: 'images/team/samuel.png',
    focusY: 40,
  ),
  Leader(
    name: 'Leader Bill',
    role: 'Chief Operations Officer',
    since: 'March 2025 to present',
    bio:
        'Translates strategic priorities into coordinated action, bringing operational focus, team alignment and '
        'clear communication.',
    highlight: 'TEDx licensee and lead organiser',
    image: 'images/team/leader-bill.png',
    focusY: 35,
  ),
  Leader(
    name: 'Idara Israel',
    role: 'Relationships Manager',
    since: 'September 2026 to present',
    bio:
        'Builds and nurtures the relationships that connect Poddin with its customers, partners and wider '
        'community.',
    highlight: 'Winning team and Best Oralist, 2026 World Intellectual Property Moot Court Competition',
    image: 'images/team/idara.png',
    focusY: 30,
  ),
];

class PressItem {
  const PressItem({
    required this.outlet,
    required this.url,
    required this.logo,
    required this.gradientFrom,
    required this.gradientTo,
    required this.tileColor,
    required this.logoFill,
    required this.logoSize,
  });

  final String outlet;
  final String url;
  final String logo;
  final String gradientFrom;
  final String gradientTo;

  /// Background of the logo tile.
  final String tileColor;

  /// `contain` keeps a transparent logo inset on its tile, `cover` lets a square icon fill it.
  final bool logoFill;
  final double logoSize;
}

const pressItems = [
  PressItem(
    outlet: 'Vanguard Nigeria',
    url: 'https://www.vanguardngr.com/2026/06/firm-invests-n1m-in-unilag-student-entrepreneurs/',
    logo: 'images/press/vanguard.png',
    gradientFrom: '#E5251C',
    gradientTo: '#8B0F0F',
    tileColor: '#FFFFFF',
    logoFill: false,
    logoSize: 36,
  ),
  PressItem(
    outlet: 'TechCabal',
    url: 'https://techcabal.com/2023/10/23/eradicating-mistrust-in-online-shopping/',
    logo: 'images/press/techcabal.png',
    gradientFrom: '#F23204',
    gradientTo: '#A62003',
    tileColor: '#F23204',
    logoFill: true,
    logoSize: 56,
  ),
  PressItem(
    outlet: 'BusinessDay Nigeria',
    url: 'https://businessday.ng/sponsored/article/africa-instilling-trust-in-online-shopping/',
    logo: 'images/press/businessday.png',
    gradientFrom: '#D82A2F',
    gradientTo: '#85161A',
    tileColor: '#FFFFFF',
    logoFill: true,
    logoSize: 56,
  ),
  PressItem(
    outlet: 'The Guardian Nigeria',
    url: 'https://guardian.ng/news/poddin-the-trusted-guardian-against-online-scams-in-the-world-of-e-commerce/',
    logo: 'images/press/guardian-icon.png',
    gradientFrom: '#11AEEF',
    gradientTo: '#076E9B',
    tileColor: '#11AEEF',
    logoFill: true,
    logoSize: 56,
  ),
  PressItem(
    outlet: 'Tech Economy',
    url: 'https://techeconomy.ng/transforming-trust-in-online-shopping-the-rise-of-poddin/',
    logo: 'images/press/techeconomy-white.svg',
    gradientFrom: '#3F78E0',
    gradientTo: '#1C3D8C',
    tileColor: '#FFFFFF',
    logoFill: false,
    logoSize: 44,
  ),
];

class PageSeo {
  final String title;
  final String description;
  const PageSeo({required this.title, required this.description});
}

const homePageSeo = PageSeo(
  title: 'Poddin Technologies | Building Intelligent, Practical Solutions',
  description:
      'Poddin Technologies Limited, incorporated in December 2021, brings together modern software engineering, emerging technologies, and artificial intelligence to simplify everyday experiences.',
);

const aboutPageSeo = PageSeo(
  title: 'About | Poddin Technologies',
  description:
      'Learn about Poddin Technologies, our mission, and the team turning real-world challenges into practical software and intelligent solutions.',
);

// const servicesPageSeo = PageSeo(
//   title: 'Services | Poddin Technologies',
//   description:
//       'Explore custom software and AI development by Poddin Technologies. We build intuitive, scalable solutions for businesses of every size.',
// );
