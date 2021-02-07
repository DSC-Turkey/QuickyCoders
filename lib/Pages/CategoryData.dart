class KulturelMirasInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  KulturelMirasInfo(
    this.position, {
    this.name,
    this.iconImage,
    this.description,
    this.images,
  });
}

List<KulturelMirasInfo> miraslar = [
  KulturelMirasInfo(
    1,
    name: 'Anıtlar',
    description:
        "Anıtlar, genellikle heykel ya da çeşitli biçimlerdeki yapılar olabildiği gibi, ağaç da anıt olarak kabul edilmektedir",
    iconImage: 'assets/anitlar.png',
  ),
  KulturelMirasInfo(
    2,
    name: 'Sitler',
    description:
        'Arkeolojik sit, geçmişten bugüne izler taşıyan ve arkeolojinin ilgi alanına giren yer ya da yerlerin genel adı.',
    iconImage: 'assets/sitlogo.png',
  ),
  KulturelMirasInfo(
    3,
    name: 'Yapı Toplulukları',
    description:
        'Yapı toplulukları bulundukları konum nedeniyle tarihi veya sanatsal veya bilimsel olarak evrensel değerlere sahiptirler.',
    iconImage: 'assets/yapitopluluklari.png',
  ),
  KulturelMirasInfo(
    4,
    name: 'Anıtlar',
    description:
        'Anıtlar, genellikle heykel ya da çeşitli biçimlerdeki yapılar olabildiği gibi, ağaç da anıt olarak kabul edilmektedir.',
    iconImage: 'assets/anitlar.png',
  ),
  KulturelMirasInfo(
    5,
    name: 'Sitler',
    description:
        'Arkeolojik sit, geçmişten bugüne izler taşıyan ve arkeolojinin ilgi alanına giren yer ya da yerlerin genel adı.',
    iconImage: 'assets/sitlogo.png',
  ),
  KulturelMirasInfo(
    6,
    name: 'Yapı Toplulukları',
    description:
        'Yapı toplulukları bulundukları konum nedeniyle tarihi veya sanatsal veya bilimsel olarak evrensel değerlere sahiptirler.',
    iconImage: 'assets/yapitopluluklari.png',
  ),
];
