import 'package:bossunapp/models/data_buku.dart';

class Wishlist {
  final username;
  String idBuku;

  Wishlist({required this.username, required this.idBuku});

  Map<String, dynamic> toMap() {
    return {'username': username, 'idBuku': idBuku};
  }
}

List<Wishlist> dataWishlist = [
  Wishlist(username: 'kichiro', idBuku: 'buku4'),
  Wishlist(username: 'admin', idBuku: 'buku4'),
];

List wishlistBukuList(idBuku) {
  var output = [];
  dataBukuList.forEach((buku) {
    if (buku.id == idBuku) output.add({...buku.toMap()});
  });
  return output;
}
