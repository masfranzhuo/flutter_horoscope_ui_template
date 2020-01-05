import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/config/constants/constant.dart';
import 'package:flutter_horoscope_ui_template/src/config/data/category_data.dart';
import 'package:flutter_horoscope_ui_template/src/resources/pallete.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/styles/spacing_style.dart';
import 'package:flutter_horoscope_ui_template/src/ui/views/horoscope/builder/horoscope_appbar_builder.dart';

import 'builder/category_tab_builder.dart';

class HoroscopeScreen extends StatefulWidget {
  static const routeName = '/horoscope';

  @override
  _HoroscopeScreenState createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen>
    with TickerProviderStateMixin {
  TabController _tabDailyCategoryController;
  TabController _tabWeeklyCategoryController;
  TabController _tabMonthlyCategoryController;

  @override
  void initState() {
    super.initState();
    _tabDailyCategoryController =
        TabController(vsync: this, length: dataCategory.length);
    _tabWeeklyCategoryController =
        TabController(vsync: this, length: dataCategory.length);
    _tabMonthlyCategoryController =
        TabController(vsync: this, length: dataCategory.length);
    _tabDailyCategoryController.addListener(() {
      setState(() {});
    });
    _tabWeeklyCategoryController.addListener(() {
      setState(() {});
    });
    _tabMonthlyCategoryController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabDailyCategoryController.dispose();
    _tabWeeklyCategoryController.dispose();
    _tabMonthlyCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    final id = int.parse(args);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: DefaultTabController(
        length: PERIODS.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                flexibleSpace: HoroscopeAppbarBuilder(id: id),
                expandedHeight: 200,
                pinned: true,
                backgroundColor: Theme.of(context).backgroundColor,
              ),
              SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        color: Theme.of(context).backgroundColor,
                        child: TabBar(
                          labelColor: Pallete.textDefaultColor,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Theme.of(context).primaryColor,
                          indicatorWeight: TightSpacing,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: PERIODS.map((item) {
                            return Tab(text: item);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CategoryTabBuilder(_tabDailyCategoryController),
              CategoryTabBuilder(_tabWeeklyCategoryController),
              CategoryTabBuilder(_tabMonthlyCategoryController),
            ],
          ),
        ),
      ),
    );
  }
}
