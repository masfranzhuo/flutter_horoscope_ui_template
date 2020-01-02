import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/resources/pallete.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/styles/container/box_decoration_style.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/styles/spacing_style.dart';
import 'package:flutter_horoscope_ui_template/src/ui/core/utils/size_config.dart';
import 'package:flutter_horoscope_ui_template/src/ui/views/horoscope/horoscope_screen.dart';

class HoroscopeWidget extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final String date;

  const HoroscopeWidget({Key key, @required this.id, @required this.image, this.name, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: SizeConfig.screenWidth * 0.27,
              height: SizeConfig.screenWidth * 0.27,
              decoration: boxDecorationStyle(
                borderRadius: SizeConfig.screenWidth * 0.27,
                elevation: 2,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: id,
                  child: Material(
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                    child: Ink.image(
                      image: AssetImage(image),
                      width: SizeConfig.screenWidth * 0.25,
                      height: SizeConfig.screenWidth * 0.25,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              HoroscopeScreen.routeName,
                              arguments: id);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        name == null
            ? SizedBox()
            : Container(
                padding: EdgeInsets.only(top: TightSpacing),
                child: Text(
                  name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: Pallete.textDefaultColor),
                ),
              ),
        date == null
            ? SizedBox()
            : Container(
                padding: EdgeInsets.only(top: TightSpacing),
                child: FittedBox(
                  child: Text(
                    date ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Pallete.textDefaultColor),
                  ),
                ),
              ),
      ],
    );
  }
}
