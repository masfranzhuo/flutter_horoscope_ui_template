import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/config/constants/constant.dart';
import 'package:flutter_horoscope_ui_template/src/config/data/category_data.dart';
import 'package:flutter_horoscope_ui_template/src/config/data/horoscope_data.dart';
import 'package:flutter_horoscope_ui_template/src/resources/local_images.dart';
import 'package:flutter_horoscope_ui_template/src/resources/pallete.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/styles/container/box_decoration_style.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/styles/spacing_style.dart';
import 'package:flutter_horoscope_ui_template/src/ui/shared/horoscope_widget.dart';

class HoroscopeScreen extends StatefulWidget {
  static const routeName = '/horoscope';

  @override
  _HoroscopeScreenState createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen>
    with TickerProviderStateMixin {
  TabController _tabCategoryController;

  @override
  void initState() {
    super.initState();
    _tabCategoryController =
        TabController(vsync: this, length: dataCategory.length);
    _tabCategoryController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    final id = int.parse(args);
    double appBarHeight = 0;
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
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    appBarHeight = constraints.biggest.height;
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: appBarHeight == 80.0 ? 1.0 : 0.0,
                        child: Text(
                          dataHoroscope[id].name,
                          style: Theme.of(context).textTheme.title.copyWith(
                              color: appBarHeight == 80.0
                                  ? Pallete.textDefaultColor
                                  : Theme.of(context).primaryColor),
                        ),
                      ),
                      background: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50)),
                              color: Theme.of(context).primaryColor,
                              image: DecorationImage(
                                image: AssetImage(
                                  LocalImages.appBarBackground,
                                ),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.white30, BlendMode.dstIn),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(DefaultSpacing),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          dataHoroscope[id].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .title
                                              .copyWith(
                                                  color:
                                                      Pallete.textDefaultColor),
                                        ),
                                        Text(
                                          '${dataHoroscope[id].startDate} - ${dataHoroscope[id].endDate}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle
                                              .copyWith(
                                                  color:
                                                      Pallete.textDefaultColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(DefaultSpacing),
                                  child: HoroscopeWidget(
                                    id: id.toString(),
                                    image: dataHoroscope[id].imagePath,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
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
              _buildDefaultTabController(context),
              _buildDefaultTabController(context),
              _buildDefaultTabController(context),
            ],
          ),
        ),
      ),
    );
  }

  DefaultTabController _buildDefaultTabController(BuildContext context) {
    return DefaultTabController(
      length: dataCategory.length,
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).backgroundColor,
            child: TabBar(
              controller: _tabCategoryController,
              indicatorWeight: 0.1,
              indicatorColor: Theme.of(context).backgroundColor,
              tabs: dataCategory.asMap().entries.map((item) {
                int index = item.key;
                var value = item.value;
                return Tab(
                  icon: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    width: _tabCategoryController.index == index ? 50 : 40,
                    height: _tabCategoryController.index == index ? 50 : 40,
                    padding: EdgeInsets.all(DefaultSpacing),
                    decoration: boxDecorationStyle(
                      color: _tabCategoryController.index == index
                          ? Pallete.secondaryColor[400]
                          : Theme.of(context).primaryColor,
                      borderRadius: 10,
                    ),
                    child: Icon(
                      value.icon,
                      color: Theme.of(context).backgroundColor
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabCategoryController,
              children: dataCategory.map((item) {
                return Container(
                  padding: EdgeInsets.all(WideSpacing),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: WideSpacing),
                        child: Text(
                          item.title,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Pallete.textDefaultColor),
                        ),
                      ),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
