import 'dart:convert';
import 'package:asm_help1/config/config_global.dart';
import 'package:asm_help1/src/secondApp.dart';
import 'package:asm_help1/utils/peticiones.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Informe extends StatefulWidget {
  static String routeName = 'Informe';
  const Informe({super.key});

  @override
  State<Informe> createState() => _InformeState();
}

class _InformeState extends State<Informe> {
  late List<_ChartData> data;
  // List<dynamic> data = [];

  @override
  void initState() {
    data = [
      _ChartData('sueñotranscurrido', 1000),
      _ChartData('totalSueño', 100),
    ];
    // TODO: implement initState

    super.initState();
  }

  void obtenerMedicinas() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer  ${pref.token}'
    };
    var request = http.Request('POST',
        Uri.parse('${ConfigGlobal.serverBackend}/api/v1/getmedicamentos'));

    request.headers.addAll(headers);

    dynamic resp = await http.post(
        Uri.parse('${ConfigGlobal.serverBackend}/api/v1/getmedicamentos'),
        headers: headers);
    List<dynamic> data = jsonDecode(resp.body);

    setState(() {});
    print(data);

    // print(response.stream)
    // if (resp.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 100,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SecondScreen(),
                            ));
                          },
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.blue,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SecondScreen(),
                            ));
                          },
                          icon: Icon(
                            Icons.home,
                            color: Colors.blue,
                          ))
                    ],
                  )
                ],
              ),
              Text(('Informe')),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, Index) {
                    return Column(
                      children: [
                        Text('medicamento'),
                        Container(
                          // width: 150,
                          child: SfCircularChart(

                              // tooltipBehavior: _tooltip,
                              series: <CircularSeries<_ChartData, String>>[
                                DoughnutSeries<_ChartData, String>(
                                  dataSource: data,
                                  xValueMapper: (_ChartData data, _) => data.x,
                                  yValueMapper: (_ChartData data, _) => data.y,
                                )
                              ]),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          )),
        ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
