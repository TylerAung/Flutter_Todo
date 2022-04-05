class User{
  final String userid;
  final String name;
  final String password;
  final String email;
  // final DateTime registrationDate;

  const User({
   required this.userid, required this.name, required this.password, required this.email, //this.registrationDate = '22-02-1992'
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'name': name,
      'password': password,
      'email' : email
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'User{userid: $userid, name: $name, password: $password, email: $email}';
  }
}