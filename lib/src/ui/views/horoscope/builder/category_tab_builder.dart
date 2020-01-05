import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/config/data/category_data.dart';
import 'package:flutter_horoscope_ui_template/src/resources/pallete.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/styles/container/box_decoration_style.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/styles/spacing_style.dart';

class CategoryTabBuilder extends StatelessWidget {
  final TabController controller;
  
  CategoryTabBuilder(this.controller);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: dataCategory.length,
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).backgroundColor,
            child: TabBar(
              controller: controller,
              indicatorWeight: 0.1,
              indicatorColor: Theme.of(context).backgroundColor,
              tabs: dataCategory.asMap().entries.map((item) {
                int index = item.key;
                var value = item.value;
                return Tab(
                  icon: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    width: controller.index == index ? 50 : 40,
                    height: controller.index == index ? 50 : 40,
                    padding: EdgeInsets.all(DefaultSpacing),
                    decoration: boxDecorationStyle(
                        color: controller.index == index
                            ? Pallete.secondaryColor[400]
                            : Theme.of(context).primaryColor,
                        borderRadius: 10,
                        elevation: 1),
                    child: Icon(value.icon,
                        color: Theme.of(context).backgroundColor),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
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
