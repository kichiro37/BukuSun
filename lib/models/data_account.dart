class Account {
  final id;
  String username;
  String name;
  String password;
  String imgUrl;

  Account(
      {required this.id,
      required this.username,
      required this.name,
      required this.password,
      required this.imgUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'imgUrl': imgUrl,
      'password': password,
    };
  }
}

List<Account> dataAccount = [
  Account(
      id: '3',
      username: 'admin',
      name: 'admin',
      password: 'admin',
      imgUrl: 'admin'),
  Account(
      id: '1',
      username: 'kichiro',
      name: 'Aditya Andre',
      password: '1234',
      imgUrl: 'img/depan.jpg'),
  Account(
      id: '2',
      username: 'bossun',
      name: 'Kurniawan Aditya',
      password: '1234',
      imgUrl: 'img/andre.jpg'),
];
