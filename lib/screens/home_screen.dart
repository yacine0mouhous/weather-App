import 'dart:ui';

import 'package:app1/bloc/weither_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('asset/1.png');
      case >= 300 && < 400:
        return Image.asset('asset/2.png');
      case >= 500 && < 600:
        return Image.asset('asset/3.png');
      case >= 600 && < 700:
        return Image.asset('asset/4.png');
      case >= 700 && < 800:
        return Image.asset('asset/5.png');
      case == 800:
        return Image.asset('asset/6.png');
      case > 800 && <= 804:
        return Image.asset('asset/7.png');
      default:
        return Image.asset('asset/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(children: [
        Align(
          alignment: const AlignmentDirectional(3, -0.3),
          child: Container(
            height: 600,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.deepPurple),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-3, -0.3),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF673AB7)),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -1.2),
          child: Container(
            height: 300,
            width: 500,
            decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
          ),
        ),
        BlocBuilder<WeitherBloc, WeitherState>(
          builder: (context, state) {
            if (state is WeitherBlocSucces) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Text(
                      '📍 ${state.weather.areaName}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "good morning",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),

                    Container(
                      height: 200,
                      width: 200,
                      child:
                          getWeatherIcon(state.weather.weatherConditionCode!),
                    ),

                    Text(
                      '${state.weather.temperature}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${state.weather.weatherMain}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200),
                    ),
                    Text(
                      DateFormat('EEEE dd •')
                          .add_jm()
                          .format(state.weather.date!),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'asset/11.png',
                              scale: 6,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "sunrise",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  DateFormat()
                                      .add_jm()
                                      .format(state.weather.sunrise!),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),

                        //////////////////////////////////////////////////////////////////////////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'asset/12.png',
                                  scale: 6,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'sunset',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunset!),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        //////////////////////////////////////////////////////////////
                      ],
                    ),
                    ////////////////////////////////////////
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    /////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'asset/14.png',
                              scale: 6,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "temp min",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  '${state.weather.tempMin}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),

                        //////////////////////////////////////////////////////////////////////////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'asset/13.png',
                                  scale: 6,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temp max',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      '${state.weather.tempMax}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        ///////////////////////////////
                      ],
                    )
                  ]));
            } else
              return Scaffold();
          },
        ),
      ]),
    );
  }
}
