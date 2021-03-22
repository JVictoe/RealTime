import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class InfoCidade extends StatelessWidget {
  BuildContext context;
  AsyncSnapshot snapshot;
  InfoCidade(this.context, this.snapshot);

  @override
  Widget build(BuildContext context) {

    DateTime currently = DateTime.now();
    final tablet = ResponsiveWrapper.of(context).isTablet;

    return Expanded(
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  currently.hour >= 06 && currently.hour <= 17 ?
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        "image/sol.gif",
                        fit: BoxFit.contain,
                      ),
                    ) :
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        "image/lua.gif",
                        fit: BoxFit.contain,
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(
                          '${snapshot.data["results"]["city"]}',
                          style: TextStyle(color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                        ),
                      Row(
                        children: [
                          Text(
                              '${snapshot.data["results"]["temp"]}',
                              style: TextStyle(color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 30),
                            ),
                          Icon(
                            MaterialCommunityIcons.temperature_celsius,
                            size: 20,
                            color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                          ),
                        ],
                      ),
                      Text(
                          '${snapshot.data["results"]["forecast"][0]["weekday"]}',
                          style: TextStyle(color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                        ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 600,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Icon(
                      FontAwesome.thermometer_full,
                      size: 20,
                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                    ),
                    AutoSizeText(
                      '${snapshot.data["results"]["forecast"][0]["max"]}',
                      style: TextStyle(color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                    Icon(
                      MaterialCommunityIcons.temperature_celsius,
                      size: 20,
                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: VerticalDivider(color: Colors.black,),
                    ),
                    Icon(
                      FontAwesome.thermometer_empty,
                      size: 20,
                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                    ),
                    AutoSizeText(
                      '${snapshot.data["results"]["forecast"][0]["min"]}°',
                      style: TextStyle(color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                    Icon(
                      MaterialCommunityIcons.temperature_celsius,
                      size: 20,
                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                    ),
                    const SizedBox(
                      width: 30,
                      height: 20,
                      child: VerticalDivider(color: Colors.black,),
                    ),
                    Icon(MaterialCommunityIcons.weather_windy, color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,),
                    AutoSizeText(
                      '${snapshot.data["results"]["wind_speedy"]}',
                      style: TextStyle(color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                    const SizedBox(
                      width: 30,
                      height: 20,
                      child: VerticalDivider(color: Colors.black,),
                    ),
                    if (snapshot.data["results"]["forecast"][0]
                            ["description"] ==
                        "Ensolarado")
                      Icon(MaterialCommunityIcons.weather_sunny, color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,),
                    if (snapshot.data["results"]["forecast"][0]
                            ["description"] ==
                        "Nublado")
                      Icon(MaterialCommunityIcons.weather_partly_cloudy, color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,),
                    if (snapshot.data["results"]["forecast"][0]
                                ["description"] !=
                            "Ensolarado" &&
                        snapshot.data["results"]["forecast"][0]
                                ["description"] !=
                            "Nublado")
                      Icon(MaterialCommunityIcons.weather_partly_cloudy, color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,),
                    AutoSizeText(
                      '${snapshot.data["results"]["forecast"][0]["description"]}',
                      style: TextStyle(color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      minFontSize: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: tablet ? 150 : 100,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 150,
                  width: 400,
                  color: currently.hour >= 06 && currently.hour <= 17 ? Colors.grey[200] : Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: AutoSizeText(
                                  '${snapshot.data["results"]["forecast"][1]["date"]}',
                                  style: TextStyle(
                                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  minFontSize: 10,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: AutoSizeText(
                                  '${snapshot.data["results"]["forecast"][1]["weekday"]}',
                                  style: TextStyle(
                                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  minFontSize: 10,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesome.thermometer_full,
                                    size: 20,
                                    color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                                  ),
                                  AutoSizeText(
                                    '${snapshot.data["results"]["forecast"][1]["max"]}',
                                    style: TextStyle(
                                        color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    minFontSize: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesome.thermometer_empty,
                                    size: 20,
                                    color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                                  ),
                                  AutoSizeText(
                                    '${snapshot.data["results"]["forecast"][1]["min"]}',
                                    style: TextStyle(
                                        color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    minFontSize: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: AutoSizeText(
                                  '${snapshot.data["results"]["forecast"][1]["description"]}',
                                  style: TextStyle(
                                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15,
                                  ),
                                  overflow: TextOverflow.visible,
                                  maxLines: 3,
                                  minFontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(color: Colors.grey[300],),
                      Container(
                        width: 120,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: AutoSizeText(
                                  '${snapshot.data["results"]["forecast"][2]["date"]}',
                                  style: TextStyle(
                                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  minFontSize: 10,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: AutoSizeText(
                                  '${snapshot.data["results"]["forecast"][2]["weekday"]}',
                                  style: TextStyle(
                                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  minFontSize: 10,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesome.thermometer_empty,
                                    size: 20,
                                    color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                                  ),
                                  AutoSizeText(
                                    '${snapshot.data["results"]["forecast"][2]["max"]}',
                                    style: TextStyle(
                                        color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    minFontSize: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesome.thermometer_empty,
                                    size: 20,
                                    color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                                  ),
                                  AutoSizeText(
                                    '${snapshot.data["results"]["forecast"][2]["min"]}',
                                    style: TextStyle(
                                        color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    minFontSize: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: AutoSizeText(
                                  '${snapshot.data["results"]["forecast"][2]["description"]}',
                                  style: TextStyle(
                                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15,
                                  ),
                                  overflow: TextOverflow.visible,
                                  maxLines: 3,
                                  minFontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(color: Colors.grey[300],),
                      Container(
                        width: 120,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: AutoSizeText(
                                  '${snapshot.data["results"]["forecast"][3]["date"]}',
                                  style: TextStyle(
                                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  minFontSize: 10,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: AutoSizeText(
                                  '${snapshot.data["results"]["forecast"][3]["weekday"]}',
                                  style: TextStyle(
                                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  minFontSize: 10,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesome.thermometer_full,
                                    size: 20,
                                    color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                                  ),
                                  AutoSizeText(
                                    '${snapshot.data["results"]["forecast"][3]["max"]}',
                                    style: TextStyle(
                                        color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    minFontSize: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesome.thermometer_empty,
                                    size: 20,
                                    color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                                  ),
                                  AutoSizeText(
                                    '${snapshot.data["results"]["forecast"][3]["min"]}',
                                    style: TextStyle(
                                        color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    minFontSize: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: AutoSizeText(
                                  '${snapshot.data["results"]["forecast"][3]["description"]}',
                                  style: TextStyle(
                                      color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white, fontSize: 15,
                                  ),
                                  overflow: TextOverflow.visible,
                                  maxLines: 3,
                                  minFontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
