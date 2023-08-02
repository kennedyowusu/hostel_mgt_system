import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(
              Icons.calendar_month,
              color: AppColors.black,
              size: 20.0,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: AppColors.black,
              size: 20.0,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 15),
          Row(
            children: const [
              CircleAvatar(
                radius: 17,
                backgroundImage: NetworkImage(
                  'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
