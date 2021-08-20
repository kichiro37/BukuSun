class Account {
  final username;
  String name;
  String password;
  String imgUrl;

  Account(
      {required this.username,
      required this.name,
      required this.password,
      required this.imgUrl});
}

List<Account> dataAccount = [
  Account(username: 'admin', name: 'admin', password: 'admin', imgUrl: 'admin'),
  Account(
      username: 'kichiro',
      name: 'Aditya Andre',
      password: '1234',
      imgUrl: '432'),
  Account(
      username: 'bossun',
      name: 'Kurniawan Aditya',
      password: '1234',
      imgUrl: '432'),
];
