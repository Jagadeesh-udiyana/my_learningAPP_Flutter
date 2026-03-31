class Employee {
  final String employeeGUID;
  final String employeeCode;
  final String employeeName;
  final String userName;
  final String email;
  final String mobile;
  final String? gender;
  final String genderGUID;
  final String category;
  final String designation;
  final String branchName;
  final String city;
  final String address1;
  final String address2;
  final String address3;
  final String zipCode;
  final String stateGUID;
  final String state;
  final String countryGUID;
  final String country;
  final String alternatePhoneNo;
  final String doj;
  final String dob;
  final int yoe;
  final double target;
  final double incentive;
  final bool status;
  final bool linkToInvoice;
  final String achievement;
  final String photoURL;
  final String tpin;
  final bool isLoginAllowed;
  final String roleGUID;
  final String? bloodGroupGUID;
  final String attendanceID;
  final String emergencyName;
  final bool isAdmin;
  final int monthlyServiceTarget;
  final int monthlyProductTarget;
  final List<String> workAreas;
  final List<String> specialization;
  final List<String> languagesKnown;

  Employee({
    required this.employeeGUID,
    required this.employeeCode,
    required this.employeeName,
    required this.userName,
    required this.email,
    required this.mobile,
    this.gender,
    required this.genderGUID,
    required this.category,
    required this.designation,
    required this.branchName,
    required this.city,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.zipCode,
    required this.stateGUID,
    required this.state,
    required this.countryGUID,
    required this.country,
    required this.alternatePhoneNo,
    required this.doj,
    required this.dob,
    required this.yoe,
    required this.target,
    required this.incentive,
    required this.status,
    required this.linkToInvoice,
    required this.achievement,
    required this.photoURL,
    required this.tpin,
    required this.isLoginAllowed,
    required this.roleGUID,
    this.bloodGroupGUID,
    required this.attendanceID,
    required this.emergencyName,
    required this.isAdmin,
    required this.monthlyServiceTarget,
    required this.monthlyProductTarget,
    required this.workAreas,
    required this.specialization,
    required this.languagesKnown,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    final address = json['EmployeeAddress'] as Map<String, dynamic>?;
    final workAreas = (json['UserWorkAreas'] as List<dynamic>?)
            ?.map((item) => item['Name']?.toString() ?? '')
            .where((item) => item.isNotEmpty)
            .toList() ??
        [];
    final specialization = (json['Specialization'] as List<dynamic>?)
            ?.map((item) => item?.toString() ?? '')
            .where((item) => item.isNotEmpty)
            .toList() ??
        [];
    final languagesKnown = (json['LanguagesKnown'] as List<dynamic>?)
            ?.map((item) => item?.toString() ?? '')
            .where((item) => item.isNotEmpty)
            .toList() ??
        [];

    return Employee(
      employeeGUID: json['EmployeeGUID'] ?? '',
      employeeCode: json['Employeecode'] ?? '',
      employeeName: json['EmployeeName'] ?? '',
      userName: json['UserName'] ?? '',
      email: json['EmailId'] ?? '',
      mobile: json['MobileNo'] ?? '',
      gender: json['Gender'] ?? json['GenderGUID'],
      genderGUID: json['GenderGUID'] ?? '',
      category: json['Category'] ?? '',
      designation: json['Designation'] ?? '',
      branchName: json['BranchName'] ?? '',
      city: address?['City'] ?? '',
      address1: address?['Address1'] ?? '',
      address2: address?['Address2'] ?? '',
      address3: address?['Address3'] ?? '',
      zipCode: address?['ZipCode'] ?? '',
      stateGUID: address?['StateGUID'] ?? '',
      state: address?['State'] ?? '',
      countryGUID: address?['CountryGUID'] ?? '',
      country: address?['Country'] ?? '',
      alternatePhoneNo: address?['AlternatePhoneNo'] ?? '',
      doj: _formatDate(json['DOJ']?.toString()),
      dob: _formatDate(json['DOB']?.toString()),
      yoe: json['YOE'] is int ? json['YOE'] : int.tryParse(json['YOE']?.toString() ?? '') ?? 0,
      target: json['Target'] is num ? (json['Target'] as num).toDouble() : double.tryParse(json['Target']?.toString() ?? '') ?? 0.0,
      incentive: json['Incentive'] is num
          ? (json['Incentive'] as num).toDouble()
          : double.tryParse(json['Incentive']?.toString() ?? '') ?? 0.0,
      status: json['Status'] == true || json['Status']?.toString().toLowerCase() == 'true',
      linkToInvoice: json['LinktoInvoice'] == true || json['LinktoInvoice']?.toString().toLowerCase() == 'true',
      achievement: json['Achivement'] ?? '',
      photoURL: json['PhotoURL'] ?? '',
      tpin: json['TPIN'] ?? '',
      isLoginAllowed: json['IsLoginAllowed'] == true || json['IsLoginAllowed']?.toString().toLowerCase() == 'true',
      roleGUID: json['RoleGUID'] ?? '',
      bloodGroupGUID: json['BloodGroupGUID'],
      attendanceID: json['AttendanceID'] ?? '',
      emergencyName: json['EmergencyName'] ?? '',
      isAdmin: json['IsAdmin'] == true || json['IsAdmin']?.toString().toLowerCase() == 'true',
      monthlyServiceTarget: json['MonthlyServiceTarget'] is int
          ? json['MonthlyServiceTarget']
          : int.tryParse(json['MonthlyServiceTarget']?.toString() ?? '') ?? 0,
      monthlyProductTarget: json['MonthlyProductTarget'] is int
          ? json['MonthlyProductTarget']
          : int.tryParse(json['MonthlyProductTarget']?.toString() ?? '') ?? 0,
      workAreas: workAreas,
      specialization: specialization,
      languagesKnown: languagesKnown,
    );
  }

  factory Employee.fallback() {
    return Employee(
      employeeGUID: 'ec635a3c-3095-4d78-b8bf-59b946b74a75',
      employeeCode: 'SK',
      employeeName: 'SK Fit',
      userName: 'SK Fit',
      email: 'sadham.k@expertsin.in',
      mobile: '8754509091',
      gender: 'Male',
      genderGUID: 'd2e92d5d-6348-4fca-8565-c9868fde2475',
      category: 'Trainer',
      designation: 'Senior',
      branchName: 'Fit In Fit',
      city: 'Chennai',
      address1: 'Saidapet',
      address2: 'TSK Nagar',
      address3: '',
      zipCode: '625012',
      stateGUID: '687e86e0-03f6-6806-ee44-a65d065619d1',
      state: 'Tamil Nadu',
      countryGUID: 'a185565d-a83b-4d22-9262-dc4b459cd832',
      country: 'India',
      alternatePhoneNo: '9120250418',
      doj: _formatDate('2023-03-24T00:00:00'),
      dob: _formatDate('2015-04-18T00:00:00'),
      yoe: 24,
      target: 0.0,
      incentive: 0.0,
      status: true,
      linkToInvoice: true,
      achievement: 'upload image is not displayed in the web',
      photoURL: 'Uploads\\2026\\01\\05\\E627760D-901F-4583-8CD6-ED483AA29CD7_e627760d-901f-4583-8cd6-ed483aa29cd7.Jpg',
      tpin: '2233',
      isLoginAllowed: true,
      roleGUID: '8018d3c5-8134-2956-f073-3c0bf9e394f3',
      bloodGroupGUID: null,
      attendanceID: 'SK',
      emergencyName: 'Hussain',
      isAdmin: true,
      monthlyServiceTarget: 0,
      monthlyProductTarget: 0,
      workAreas: ['Fit In Fit'],
      specialization: [],
      languagesKnown: [],
    );
  }

  static String _formatDate(String? value) {
    if (value == null || value.isEmpty) return 'N/A';
    try {
      final date = DateTime.parse(value);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (_) {
      return value;
    }
  }
}
