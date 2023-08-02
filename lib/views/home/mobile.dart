import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';
import 'package:sch_mgt_system/views/home/res_layout.dart';
import 'package:sch_mgt_system/widgets/custom_appbar.dart';
import 'package:sch_mgt_system/widgets/custom_search_field.dart';
import 'package:sch_mgt_system/widgets/custom_sidebar.dart';

class MobileView extends StatelessWidget {
  MobileView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundColor,
      key: drawerKey,
      appBar: !ResponsiveLayout.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  drawerKey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu, color: AppColors.black),
              ),
              actions: const [
                AppBarActionItems(),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      drawer: const SizedBox(width: 100, child: CustomSideBarMenu()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SearchFormField(),
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[400],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 78,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
