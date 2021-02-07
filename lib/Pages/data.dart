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
    description: 'Anırlar Açıklama',
    iconImage: 'assets/anitlar.png',
  ),
  KulturelMirasInfo(
    2,
    name: 'Sitler',
    description: 'Sitler Açıklama',
    iconImage: 'assets/sitlogo.png',
  ),
  KulturelMirasInfo(
    3,
    name: 'Yapı Toplulukları',
    description: 'Yapı Toplulukları Açıklama',
    iconImage: 'assets/yapitopluluklari.png',
  ),
  KulturelMirasInfo(
    4,
    name: 'Anıtlar',
    description: 'Anıtlar Açıklama',
    iconImage: 'assets/anitlar.png',
  ),
  KulturelMirasInfo(
    5,
    name: 'Sitler',
    description: 'Sitler Açıklama',
    iconImage: 'assets/sitlogo.png',
  ),
  KulturelMirasInfo(
    6,
    name: 'Yapı Toplulukları',
    description: 'Yapı Toplulukları Açıklama',
    iconImage: 'assets/yapitopluluklari.png',
  ),
];
