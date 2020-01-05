import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/config/data/horoscope_data.dart';
import 'package:flutter_horoscope_ui_template/src/resources/local_images.dart';
import 'package:flutter_horoscope_ui_template/src/resources/pallete.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/styles/spacing_style.dart';
import 'package:flutter_horoscope_ui_template/src/ui/shared/horoscope_widget.dart';

class HoroscopeScreen extends StatelessWidget {
  static const routeName = '/horoscope';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    final id = int.parse(args);
    double appBarHeight = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
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
                                  padding: const EdgeInsets.all(DefaultSpacing),
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
          ];
        },
        body: ListView(
          children: <Widget>[
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 100),
              color: Colors.yellow,
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 100),
              color: Colors.yellow,
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 100),
              color: Colors.yellow,
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 100),
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
