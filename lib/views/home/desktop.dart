import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';
import 'package:sch_mgt_system/constants/styles.dart';
import 'package:sch_mgt_system/model/dashboard_data.dart';
import 'package:sch_mgt_system/model/trending_articles.dart';
import 'package:sch_mgt_system/utils/drawer.dart';
import 'package:sch_mgt_system/widgets/custom_appbar.dart';
import 'package:sch_mgt_system/widgets/custom_search_field.dart';
import 'package:table_calendar/table_calendar.dart';

class DeskTopView extends StatelessWidget {
  DeskTopView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
                        itemCount: dashboardData.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          final DashboardData items = dashboardData[index];
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: InkWell(
                              onTap: () {
                                items.title;
                                debugPrint(items.title);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[200],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      items.icon,
                                      size: 30,
                                      color: Colors.grey[700],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      items.title,
                                      style: commonDashboardStyle(
                                        12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
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
                      height: height * 0.40,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.mainBlueColor,
                      ),
                      child: TableCalendar(
                        locale: 'en_US',
                        rowHeight: 50,
                        focusedDay: DateTime.now(),
                        firstDay: DateTime.utc(2020),
                        lastDay: DateTime(2050),
                        currentDay: DateTime.now(),
                        calendarFormat: CalendarFormat.month,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: AppColors.white,
                          ),
                          rightChevronIcon: Icon(
                            Icons.chevron_right,
                            color: AppColors.white,
                          ),
                        ),
                        calendarStyle: const CalendarStyle(
                          weekendTextStyle: TextStyle(
                            color: AppColors.white,
                          ),
                          holidayTextStyle: TextStyle(
                            color: AppColors.white,
                          ),
                          outsideTextStyle: TextStyle(
                            color: AppColors.white,
                          ),
                          outsideDaysVisible: false,
                          selectedDecoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: TextStyle(
                            color: AppColors.mainBlueColor,
                          ),
                          todayDecoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          todayTextStyle: TextStyle(
                            color: AppColors.mainBlueColor,
                          ),
                        ),
                        daysOfWeekVisible: true,
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: AppColors.white,
                          ),
                          weekendStyle: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                        selectedDayPredicate: (day) {
                          return isSameDay(
                            day,
                            DateTime.now(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tArticles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 78,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[200],
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.grey[300],
                                  child: Center(
                                    child: Text(
                                      tArticles[index].index.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  tArticles[index].title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  tArticles[index].subtitle,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
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
