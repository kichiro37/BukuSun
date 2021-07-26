class DataBuku {
  String judul;
  String imageAsset;
  String deskripsi;
  String author;
  String tanggal;
  String publisher;

  DataBuku({
    required this.tanggal,
    required this.author,
    required this.judul,
    required this.imageAsset,
    required this.deskripsi,
    required this.publisher,
  });
}

var dataBukuList = [
  DataBuku(
      judul: 'Totoro',
      author: 'bossun',
      tanggal: 'Jan 2015',
      imageAsset: 'img/totoro.jpg',
      deskripsi: 'Ini bukunya tentang TOTORO',
      publisher: 'bossunCorp'),
  DataBuku(
      judul: 'A Million To One A Million To One A Million To One',
      author: 'Ken Wakui',
      imageAsset: 'img/buku2.jpg',
      tanggal: 'Jun 2018',
      deskripsi: 'Buku inspirasi',
      publisher: 'bossunCorp'),
  DataBuku(
      judul: 'The Poison Killer',
      author: 'Fitrah Hari Subagyo',
      imageAsset: 'img/buku1.jpg',
      tanggal: 'Des 2012',
      deskripsi: 'Buku inspirasi',
      publisher: 'bossunCorp'),
  DataBuku(
      judul: 'Tokyo Revengers: Lariii ada Maiki',
      author: 'Ken Wakui',
      imageAsset: 'img/maiki.jpg',
      tanggal: 'Jan 2019',
      deskripsi:
          'Takemichi time-leaps 12 years into the past to save his beloved ex-girlfriend, Hinata, from getting murdered by the villainous Tokyo Manji Gang. In order to stop the Moebius from splitting Toman apart, Takemichi tries to persuade Mikey to avoid the conflict. That’s when Moebius attacks! Things spiral out of control, leaving Takemichi bewildered over rapid changes in the timeline. And someone’s got a knife with Draken’s name on it!',
      publisher: 'Kodansha America LLC'),
];
