class UserProfile {
  dynamic name, email, uid, phone,password;

  UserProfile({
    required this.phone,
    required this.name,
    required this.email,
    required this.uid,
    required this.password,
  });

  UserProfile.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    phone = json!['phone'];
    email = json['email'];
    uid = json['uid'];
    password = json['password'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'password': password,
      'email': email,
      'name': name,
      'phone': phone,
    };
  }
}
