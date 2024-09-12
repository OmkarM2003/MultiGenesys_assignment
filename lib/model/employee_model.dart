class Employee {
  String id;
  String name;
  String avatar;
  String emailId;
  String mobile;
  String country;
  String state;
  String district;

  Employee({
    required this.id,
    required this.name,
    required this.avatar,
    required this.emailId,
    required this.mobile,
    required this.country,
    required this.state,
    required this.district,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'] ?? 'https://via.placeholder.com/150',
      emailId: json['emailId'],
      mobile: json['mobile'],
      country: json['country'],
      state: json['state'],
      district: json['district'],
    );
  }
}
