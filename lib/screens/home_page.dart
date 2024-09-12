import 'package:employee_management/controlers/employee_controller.dart';
import 'package:employee_management/screens/employee_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final EmployeeController controller = Get.put(EmployeeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(114, 13, 93, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(228, 225, 225, 1),
        title: const Text('Employee Management'),
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromRGBO(114, 13, 93, 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Search Employee by ID',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                onChanged: (value) {
                  controller.searchEmployee(value);
                },
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.employees.isEmpty) {
                return const Center(child: Text('No Employees Found'));
              } else {
                return ListView.builder(
                  itemCount: controller.employees.length,
                  itemBuilder: (context, index) {
                    final employee = controller.employees[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromRGBO(228, 225, 225, 1),
                        leading: Hero(
                          tag: 'avatar-${employee.id}',
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                          ),
                        ),
                        title: Text(
                          employee.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(employee.emailId),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EmployeeDetailsScreen(employee: employee),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
