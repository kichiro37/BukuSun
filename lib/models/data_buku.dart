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
}

class ReviewBuku {
  String id;
  String idBuku;
  String nama;
  String bintang;
  String imageAsset;
  String komentar;
  String tanggal;

  ReviewBuku(
      {required this.id,
      required this.idBuku,
      required this.nama,
      required this.bintang,
      required this.imageAsset,
      required this.komentar,
      required this.tanggal});
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
      nama: 'depan',
      bintang: '★★',
      imageAsset: 'img/depan.jpg',
      komentar: 'larii ada banteeeeng',
      tanggal: 'Agustus 17, 2021'),
  ReviewBuku(
      id: 'review2',
      idBuku: 'buku4',
      nama: 'depan',
      bintang: '★★',
      imageAsset: 'img/depan.jpg',
      komentar:
          'larii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeeng',
      tanggal: 'Agustus 17, 2021'),
  ReviewBuku(
      id: 'review5',
      idBuku: 'buku1',
      nama: 'depan',
      bintang: '★★',
      imageAsset: 'img/depan.jpg',
      komentar:
          'larii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeeng',
      tanggal: 'Agustus 17, 2021'),
  ReviewBuku(
      id: 'review3',
      idBuku: 'buku4',
      nama: 'depan',
      bintang: '★★',
      imageAsset: 'img/depan.jpg',
      komentar:
          'larii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeeng',
      tanggal: 'Agustus 17, 2021'),
  ReviewBuku(
      id: 'review4',
      idBuku: 'buku4',
      nama: 'depan',
      bintang: '★★',
      imageAsset: 'img/depan.jpg',
      komentar:
          'larii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeenglarii ada banteeeeng',
      tanggal: 'Agustus 17, 2021')
];

List reviewBukuList(idBuku) {
  var output = [];
  reviewList.forEach((review) {
    if (review.idBuku == idBuku) output.add(review);
  });
  return output;
}
