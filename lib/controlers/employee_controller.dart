import 'package:employee_management/model/employee_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  Future<void> fetchEmployees() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        employees.value = data.map((json) => Employee.fromJson(json)).toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load employees');
    } finally {
      isLoading(false);
    }
  }

  void searchEmployee(String id) {
    if (id.isEmpty) {
      fetchEmployees();
    } else {
      var filtered = employees.where((emp) => emp.id.contains(id)).toList();
      employees.value = filtered;
    }
  }
}
