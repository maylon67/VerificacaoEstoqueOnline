class UserModel{

  String email = '';
  String userName = '';
  String permissions = '';
  int userId = 0;
  String password = '';
  String lastLogin = '';
  int isLogged = -1;

  UserModel({
   required this.email,
   required this.userName,
   required this.permissions,
   required this.userId,
   required this.lastLogin,
   required this.isLogged,
   required this.password
  });

   @override
  String toString() => 'User{ '
      'Email: $email, '
      'Password: $password, '
      'Permissions: $permissions '
      'User: $userId '
      'Last Login: $lastLogin'
      'Login: $isLogged'
      ' }';

  /*MapSD toDB() => {
    '$fieldUsersEmail': email,
    '$fieldUsersPassword': password,
    '$fieldUsersUser': userName,
    '$fieldUsersUserid': userId,
    '$fieldUsersPermissions': permissions,
    '$fieldUsersLastLogin': lastLogin,
    '$fieldUsersLogged': isLogged
  };*/

  /*UserModel.fromDatabase(MapSD map) {
    email = map[fieldUsersEmail];
    userName = map[fieldUsersUser];
    userId = map[fieldUsersUserid];
    password = map[fieldUsersPassword];
    permissions = map[fieldUsersPermissions];
    lastLogin = map[fieldUsersLastLogin];
    isLogged = map[fieldUsersLogged];
  }*/

  UserModel copyWith({
    String? email,
    String? userName,
    String? permissions,
    int? userId,
    String? password,
    String? lastLogin,
    int? isLogged
  }) {
    return UserModel(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      permissions: permissions ?? this.permissions,
      userId: userId ?? this.userId,
      password: password ?? this.password,
      lastLogin: lastLogin ?? this.lastLogin,
      isLogged: isLogged ?? this.isLogged,
    );
  }

}