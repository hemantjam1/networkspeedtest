import 'package:flutter/material.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:internet_speed_test/internet_speed_test.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double rate = 0;
  final internetSpeedTest = InternetSpeedTest();
  void downloadSpeed() {
    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        rate = transferRate;
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        setState(() {
          rate = transferRate;
        });
      },
      onError: (String errorMessage, String speedTestError) {},
    );
  }

  void uploadSpeedTest() {
    internetSpeedTest.startUploadTesting(
      onDone: (double transferRate, SpeedUnit unit) {},
      onProgress: (double percent, double transferRate, SpeedUnit unit) {},
      onError: (String errorMessage, String speedTestError) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speed Test'),
      ),
      body: Container(
        child: Center(
          child: Container(
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 150,
                  // ranges: <GaugeRange>[
                  //   GaugeRange(
                  //       startValue: 0, endValue: 50, color: Colors.green),
                  //   GaugeRange(
                  //       startValue: 50, endValue: 100, color: Colors.orange),
                  //   GaugeRange(
                  //       startValue: 100, endValue: 150, color: Colors.red)
                  // ],
                  pointers: <GaugePointer>[NeedlePointer(value: rate)],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                          child: Text('${rate.toString()} Mbps',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        angle: 90,
                        positionFactor: 0.5),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: downloadSpeed,
      ),
    );
  }
}
