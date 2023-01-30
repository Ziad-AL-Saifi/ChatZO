class GetUsersModel {
  final String email;
  final String username;
  final String password;
  final String phone;

  GetUsersModel(
    this.email,
    this.username,
    this.password,
    this.phone,
  );

  factory GetUsersModel.getUsers(data) {
    return GetUsersModel(
      data['email'],
      data['full_name'],
      data['password'],
      data['phone'],
    );
  }
}
