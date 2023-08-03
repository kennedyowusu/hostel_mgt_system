import 'package:flutter/material.dart';

class DashboardData {
  final int index;
  final String title;
  final IconData icon;

  DashboardData({required this.index, required this.title, required this.icon});

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      index: json['index'],
      title: json['title'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() => {
        'index': index,
        'title': title,
        'icon': icon,
      };
}

List<DashboardData> dashboardData = [
  DashboardData(
    index: 1,
    title: "Registered Students",
    icon: Icons.person_add,
  ),
  DashboardData(
    index: 2,
    title: "Total Rooms",
    icon: Icons.touch_app_outlined,
  ),
  DashboardData(
    index: 3,
    title: "Booked Rooms",
    icon: Icons.lock_person_sharp,
  ),
  DashboardData(
    index: 4,
    title: "Available Rooms",
    icon: Icons.vpn_key,
  ),
];
