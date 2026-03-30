class Employee {
  final String name;
  final String email;
  final String mobile;
  final String? gender;
  final String branch;
  final String designation;
  final String city;

  Employee({
    required this.name,
    required this.email,
    required this.mobile,
    this.gender,
    required this.branch,
    required this.designation,
    required this.city,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['EmployeeName'] ?? '',
      email: json['EmailId'] ?? '',
      mobile: json['MobileNo'] ?? '',
      gender: json['Gender'],
      branch: json['BranchName'] ?? '',
      designation: json['Designation'] ?? '',
      city: json['EmployeeAddress']?['City'] ?? '',
    );
  }
}
