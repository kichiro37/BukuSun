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
  Account(username: 'kichiro', name: '432', password: '4213', imgUrl: '432'),
  Account(username: 'bossun', name: '432', password: '4213', imgUrl: '432'),
];
