import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';
import 'package:sch_mgt_system/constants/sizes.dart';
import 'package:sch_mgt_system/views/auth/login.dart';

class CustomSideBarMenu extends StatelessWidget {
  const CustomSideBarMenu({
    Key? key,
  }) : super(key: key);

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
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              IconButton(
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                icon: const Icon(
                  Icons.home_outlined,
                  color: AppColors.iconGray,
                ),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.iconGray,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
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
