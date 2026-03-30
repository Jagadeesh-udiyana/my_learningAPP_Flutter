import '../../../core/services/api_service.dart';
import '../../../core/config/app_config.dart';
import '../models/employee_model.dart';

class ProfileService {
  final ApiService _api = ApiService();

  Future<Employee> getProfile() async {
    final response = await _api.get(
      AppConfig.employeeEndpoint,
      params: {"EmployeeGUID": "ec635a3c-3095-4d78-b8bf-59b946b74a75"},
    );

    final data = response['Employee'][0];
    return Employee.fromJson(data);
  }
}
