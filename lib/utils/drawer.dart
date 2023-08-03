import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';
import 'package:sch_mgt_system/constants/sizes.dart';

class CustomDesktopDrawer extends StatelessWidget {
  const CustomDesktopDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(color: AppColors.primary),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 40,
                      child: Icon(
                        Icons.person,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'User Name',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.white,
                thickness: 2.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> menu = menuData[index];
                  return Padding(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Menu(
                      title: menu['title'],
                      icon: menu['icon'],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> menuData = [
  {
    'title': 'Dashboard',
    'icon': Icons.dashboard,
  },
  {
    'title': 'Students',
    'icon': Icons.person,
  },
  {
    'title': 'Teachers',
    'icon': Icons.person,
  },
  {
    'title': 'Parents',
    'icon': Icons.person,
  },
];

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon!,
          color: AppColors.white,
          size: 20.0,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
