import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController phCtrl = TextEditingController();

  TextEditingController o2Ctrl = TextEditingController();

  TextEditingController co2Ctrl = TextEditingController();

  TextEditingController hco3Ctrl = TextEditingController();

  TextEditingController naCtrl = TextEditingController();

  TextEditingController albuminCtrl = TextEditingController();

  TextEditingController chlorideCtrl = TextEditingController();

  String result = '';
  String message = '';
  String anionGapAnalyze = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Row(
            children: [
              // const Expanded(child: SideMenu()),
              Expanded(
                  child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text(
                      'Calculate Aterial Blood Gases',
                      style: TextStyle(fontSize: 20, color: Colors.white54),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      leading: const Text('PH'),
                      title: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: phCtrl,
                            keyboardType: TextInputType.number,
                          )),
                        ],
                      )),
                  ListTile(
                      leading: const Text('PAO2'),
                      title: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: o2Ctrl,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      )),
                  ListTile(
                      leading: const Text('PACO2'),
                      title: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: co2Ctrl,
                            keyboardType: TextInputType.number,
                          )),
                        ],
                      )),
                  ListTile(
                      leading: const Text('HCO3'),
                      title: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: hco3Ctrl,
                            keyboardType: TextInputType.number,
                          )),
                        ],
                      )),
                  ListTile(
                      leading: const Text('Na'),
                      title: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: naCtrl,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      )),
                  ListTile(
                      leading: const Text('Chloride'),
                      title: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: chlorideCtrl,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      )),
                  ListTile(
                      leading: const Text('Albumin'),
                      title: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: albuminCtrl,
                              keyboardType: TextInputType.number,

                            ),
                          ),
                        ],
                      )),
                  TextButton(
                      onPressed: interpret, child: const Text('Interpret')),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20                                                                               ),
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    anionGapAnalyze,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    result,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  void interpret() {
    String phStatus = 'Ph';
    String co2Status = 'Co2';
    String hco3Status = 'HCo3';
    String o2status = 'O2';
    String naStatus = 'Sodium';
    String clStatus = 'Chloride';
    String albuminStatus = 'albumin';
    String anionGapStatus = ' ';
    anionGapAnalyze='';
    String minCo2 = 'min co2';
    String maxCo2 = ' max co2';
    double ph = double.parse(phCtrl.text);
    double o2 = double.parse(o2Ctrl.text);
    double co2 = double.parse(co2Ctrl.text);
    double hco3 = double.parse(hco3Ctrl.text);
    double na = double.parse(naCtrl.text);
    double cl = double.parse(chlorideCtrl.text);
    double albumin = double.parse(albuminCtrl.text);
    double aniongap = 0.0;
    if (albumin < 4.4) {
      aniongap = na - (cl + hco3) + 2.5 * (4.4 - albumin);
    } else {
      aniongap = na - (cl + hco3);
    }

    double co2min = hco3 * 1.5 + 8 - 2;
    double co2max = hco3 * 1.5 + 8 + 2;

    setState(() {
      if (ph < 7.35) {
        phStatus = 'Low';
      } else if (ph > 7.45) {
        phStatus = 'High';
      } else {
        phStatus = 'Normal';
      }
      if (co2 < 35) {
        co2Status = 'Low';
      } else if (co2 > 45) {
        co2Status = 'High';
      } else {
        co2Status = 'Normal';
      }
      if (hco3 < 22) {
        hco3Status = 'Low';
      } else if (hco3 > 26) {
        hco3Status = 'High';
      } else {
        hco3Status = 'Normal';
      }
      if (o2 < 75) {
        o2status = 'Low';
      } else if (o2 > 100) {
        o2status = 'High';
      } else {
        o2status = 'Normal';
      }
      if (na < 135) {
        naStatus = 'Low';
      } else if (o2 > 145) {
        naStatus = 'High';
      } else {
        naStatus = 'Normal';
      }
      if (cl < 96) {
        clStatus = 'Low';
      } else if (cl > 106) {
        clStatus = 'High';
      } else {
        clStatus = 'Normal';
      }
      if (albumin < 3.4) {
        albuminStatus = 'Low';
      } else if (albumin > 5.4) {
        albuminStatus = 'High';
      } else {
        albuminStatus = 'Normal';
      }
      if (aniongap < 8) {
        anionGapStatus = 'Low';
      } else if (aniongap > 10) {
        anionGapStatus = 'High';
      } else {
        anionGapStatus = 'Normal';
      }

      String vars =
          'Ph $phStatus\n CO2 $co2Status \n HCO3 $hco3Status \n O2 $o2status \n Na $naStatus \n Chloride $clStatus \n Albumin $albuminStatus ';
      if (ph < 7.35 && hco3 < 22) {
        if (co2 < co2min) {
          anionGapAnalyze = 'Anion Gap : $aniongap $anionGapStatus';
          message = 'Metabolic Acidosis with Respiratory Alkalosis ';
          result =
              "$vars \n Winters Formula \n $hco3 * 1.5 + 8 \n Co2 range $co2min _ $co2max \n Co2 < $co2min";
        } else if (co2 > co2max) {
          anionGapAnalyze = 'Anion Gap : $aniongap $anionGapStatus';
          message = 'Metabolic Acidosis with Respiratory Acidosis';
          result =
              "$vars \n Winters Formula \n $hco3 * 1.5 + 8 \n Co2 range $co2max _ $co2min \n Co2 > $co2max";
        } else {
          anionGapAnalyze = 'Anion Gap : $aniongap $anionGapStatus';
          message = 'Metabolic Acidosis';
          result =
              "$vars \n Winters Formula \n $hco3 * 1.5 + 8 \n Co2 range $co2max _ $co2min \n Co2 in normal range  ";
        }
      } else if (ph > 7.45 && hco3 > 26) {
        double max = 40 + (hco3 - 24) * 0.7;
        if (co2 < 35) {
          anionGapAnalyze='';
          message = 'Metabolic Alkalosis with Respiratory Alkalosis';
          result = vars;
        } else if (co2 > max) {
          anionGapAnalyze='';
          message = 'Metabolic Alkalosis with Respiratory Acidosis';
          result = vars;
        } else if (max > co2 && co2 > 35) {
          anionGapAnalyze='';
          message = 'Metabolic Alkalosis with  Respiratory compensation';
          result = vars;
        }
      } else if (ph < 7.35 && co2 > 45) {
        anionGapAnalyze='';
        message = 'Respiratory Acidosis';
        result = vars;
      } else if (ph > 7.45 && co2 < 35) {
        anionGapAnalyze='';
        message = 'Respiratory Alkalosis ';
        result = vars;
      } else {
        message = 'Normal ABG';
        result = vars;
      }

      minCo2 = co2min.toString();
      maxCo2 = co2max.toString();
      phCtrl.text = ph.toString();
      o2Ctrl.text = o2.toString();
      co2Ctrl.text = co2.toString();
      hco3Ctrl.text = hco3.toString();
      naCtrl.text = na.toString();
      chlorideCtrl.text = cl.toString();
      albuminCtrl.text = albumin.toString();
    });
  }
}
