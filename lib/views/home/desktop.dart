import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';
import 'package:sch_mgt_system/utils/drawer.dart';
import 'package:sch_mgt_system/widgets/custom_appbar.dart';
import 'package:sch_mgt_system/widgets/custom_search_field.dart';

class DeskTopView extends StatelessWidget {
  DeskTopView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundColor,
      key: drawerKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDesktopDrawer(),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const SearchFormField(),
                  AspectRatio(
                    aspectRatio: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.brown,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
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
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  right: 8.0,
                  bottom: 8.0,
                ),
                child: Column(
                  children: [
                    const AppBarActionItems(),
                    Container(
                      height: 200,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
