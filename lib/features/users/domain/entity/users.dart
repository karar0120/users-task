class Users {
  final List<UsersData> users;
  Users({required this.users});
}

class UsersData {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UsersData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}
