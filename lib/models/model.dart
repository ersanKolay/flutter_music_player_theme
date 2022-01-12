class Album {
  final String id;
  final String singer;
  final String albumName;
  final String albumImage;
  final List<String> albumList;

  Album({
    required this.id,
    required this.singer,
    required this.albumName,
    required this.albumImage,
    this.albumList = const [""],
  });
  static final albums = [
    Album(id: "1", singer: "Gripin", albumName: "Nasılım Biliyor musun?", albumImage: "gripin.jpg"),
    Album(id: "2", singer: "Mor ve Ötesi", albumName: "Başıbozuk", albumImage: "morveotesi.jpg"),
    Album(id: "3", singer: "MFÖ", albumName: "Vak The Rock", albumImage: "mfo.jpg"),
    Album(id: "4", singer: "Yüksek Sadakat", albumName: "IV", albumImage: "yukseksadakat.jpg"),
  ];
}

class RelatedAlbum {
  final String singer;
  final String albumName;
  final String albumImage;

  RelatedAlbum(
      {required this.singer,
      required this.albumName,
      required this.albumImage});
}

class Category {
  final String name;
  final bool selected;
  Category({required this.name, this.selected = false});
  static final category = [
    Category(name: "Rock", selected: true),
    Category(name: "Soul"),
    Category(name: "Reggae"),
    Category(name: "Funky")
  ];
}
