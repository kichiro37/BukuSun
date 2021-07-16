class DataBuku {
  String judul;
  String imageAsset;
  String deskripsi;

  DataBuku({
    required this.judul,
    required this.imageAsset,
    required this.deskripsi,
  });
}

var dataBukuList = [
  DataBuku(
      judul: 'Totoro',
      imageAsset: 'img/totoro.jpg',
      deskripsi: 'Ini bukunya tentang TOTORO'),
  DataBuku(
      judul: 'A Million To One',
      imageAsset: 'img/buku2.jpg',
      deskripsi: 'Buku inspirasi'),
  DataBuku(
      judul: 'killing on the floor',
      imageAsset: 'img/buku1.jpg',
      deskripsi: 'Buku inspirasi'),
];
