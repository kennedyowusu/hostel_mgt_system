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
        decoration: const BoxDecoration(color: AppColors.secondaryBg),
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
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.white,
                thickness: 1.5,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> menu = menuData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
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
          color: AppColors.iconGray,
          size: 20.0,
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.iconGray,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
