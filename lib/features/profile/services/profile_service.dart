import '../../../core/services/api_service.dart';
import '../../../core/config/app_config.dart';
import '../models/employee_model.dart';

class ProfileResult {
  final Employee employee;
  final bool isDefault;
  final String message;

  ProfileResult({
    required this.employee,
    required this.isDefault,
    required this.message,
  });
}

class ProfileService {
  final ApiService _api = ApiService();

  Future<ProfileResult> getProfile() async {
    try {
      final response = await _api.get(
        AppConfig.employeeEndpoint,
        params: {"EmployeeGUID": "ec635a3c-3095-4d78-b8bf-59b946b74a75"},
      );

      final employeeList = response['Employee'];
      if (employeeList is List && employeeList.isNotEmpty) {
        final data = employeeList[0] as Map<String, dynamic>;
        return ProfileResult(
          employee: Employee.fromJson(data),
          isDefault: false,
          message: 'Profile loaded successfully.',
        );
      }

      return ProfileResult(
        employee: Employee.fallback(),
        isDefault: true,
        message: 'No employee data found. Showing default profile data.',
      );
    } catch (error) {
      return ProfileResult(
        employee: Employee.fallback(),
        isDefault: true,
        message: 'Unable to load profile. Showing default profile data.',
      );
    }
  }
}
