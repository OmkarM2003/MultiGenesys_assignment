import 'package:employee_management/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(114, 13, 93, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(228, 225, 225, 1),
        title: const Text('Employee Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromRGBO(228, 225, 225, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Hero(
                        tag: 'avatar-${employee.id}',
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 75,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      employee.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Email: ${employee.emailId}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Mobile: ${employee.mobile}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Country: ${employee.country}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'State: ${employee.state}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'District: ${employee.district}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
