import 'package:bossunapp/models/data_account.dart';

class DataBuku {
  String id;
  String judul;
  String imageAsset;
  String deskripsi;
  String author;
  String tanggal;
  String publisher;

  DataBuku(
      {required this.id,
      required this.tanggal,
      required this.author,
      required this.judul,
      required this.imageAsset,
      required this.deskripsi,
      required this.publisher});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'imageAsset': imageAsset,
      'deskripsi': deskripsi,
      'author': author,
      'publisher': publisher,
      'tanggal': tanggal,
    };
  }
}

class ReviewBuku {
  String id;
  String idBuku;
  String username;
  String bintang;
  String komentar;

  ReviewBuku(
      {required this.id,
      required this.idBuku,
      required this.username,
      required this.bintang,
      required this.komentar});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idBuku': idBuku,
      'username': username,
      'bintang': bintang,
      'komentar': komentar,
    };
  }
}

var dataBukuList = [
  DataBuku(
    id: 'buku1',
    judul: 'Totoro',
    author: 'bossun',
    tanggal: 'Jan 2015',
    imageAsset: 'img/totoro.jpg',
    deskripsi: 'Ini bukunya tentang TOTORO',
    publisher: 'bossunCorp',
  ),
  DataBuku(
    id: 'buku2',
    judul: 'A Million To One A Million To One A Million To One',
    author: 'Ken Wakui',
    imageAsset: 'img/buku2.jpg',
    tanggal: 'Jun 2018',
    deskripsi: 'Buku inspirasi',
    publisher: 'bossunCorp',
  ),
  DataBuku(
    id: 'buku3',
    judul: 'The Poison Killer',
    author: 'Fitrah Hari Subagyo',
    imageAsset: 'img/buku1.jpg',
    tanggal: 'Des 2012',
    deskripsi: 'Buku inspirasi',
    publisher: 'bossunCorp',
  ),
  DataBuku(
    id: 'buku4',
    judul: 'Tokyo Revengers: Lariii ada Maiki',
    author: 'Ken Wakui',
    imageAsset: 'img/maiki.jpg',
    tanggal: 'Jan 2019',
    deskripsi:
        'Takemichi time-leaps 12 years into the past to save his beloved ex-girlfriend, Hinata, from getting murdered by the villainous Tokyo Manji Gang. In order to stop the Moebius from splitting Toman apart, Takemichi tries to persuade Mikey to avoid the conflict. That’s when Moebius attacks! Things spiral out of control, leaving Takemichi bewildered over rapid changes in the timeline. And someone’s got a knife with Draken’s name on it!',
    publisher: 'Kodansha America LLC',
  ),
];

var reviewList = [
  ReviewBuku(
      id: 'review1',
      idBuku: 'buku4',
      username: 'kichiro',
      bintang: '★★',
      komentar: 'larii ada banteeeeng'),
  ReviewBuku(
      id: 'review2',
      idBuku: 'buku4',
      username: 'kichiro',
      bintang: '★★',
      komentar:
          'larii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeeng'),
  ReviewBuku(
    id: 'review5',
    idBuku: 'buku1',
    username: 'kichiro',
    bintang: '★★',
    komentar:
        'larii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeeng',
  ),
  ReviewBuku(
    id: 'review3',
    idBuku: 'buku4',
    username: 'kichiro',
    bintang: '★★',
    komentar:
        'larii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeeng',
  ),
  ReviewBuku(
    id: 'review4',
    idBuku: 'buku4',
    username: 'bossun',
    bintang: '★★',
    komentar:
        'larii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeeng',
  )
];

List reviewBukuList(idBuku) {
  var output = [];
  reviewList.asMap().forEach((index, review) {
    if (review.idBuku == idBuku) {
      final reviewAccount =
          dataAccount.firstWhere((akun) => akun.username == review.username);

      output.add({...review.toMap(), ...reviewAccount.toMap()});
    }
  });
  return output;
}
