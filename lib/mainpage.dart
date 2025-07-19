import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var iWt = TextEditingController();
  var iHf = TextEditingController();
  var iHi = TextEditingController();
  var result = "";
  var BGT = Colors.white10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "MY BMI APP",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
          ),
        ),
        backgroundColor: Colors.lightBlueAccent.shade400,
      ),

      body: Container(
        color: BGT,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: iWt,
                  decoration: InputDecoration(hintText: "Enter Your Weight"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8),
                TextField(
                  controller: iHf,
                  decoration: InputDecoration(
                    hintText: "Enter Your Height (in feet)",
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8),
                TextField(
                  controller: iHi,
                  decoration: InputDecoration(
                    hintText: "Enter Your Height (in inch)",
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    var iWeight = iWt.text.toString();
                    var iHeightF = iHf.text.toString();
                    var iHeighti = iHi.text.toString();

                    if (iWeight != "" && iHeightF != "" && iHeighti != "") {
                      var intWT = int.parse(iWeight);
                      var intHF = int.parse(iHeightF);
                      var intHi = int.parse(iHeighti);

                      var Tinch = (intHF * 12) + intHi;
                      var Tcm = Tinch * 2.54;
                      var Tm = Tcm / 100;
                      var BMI = intWT / (Tm * Tm);

                      var msg = "";
                      if (BMI > 25) {
                        msg = "You Are OverWeight!";
                        BGT = Colors.orangeAccent;
                      } else if (BMI < 18) {
                        msg = "You Are UnderWeight";
                        BGT = Colors.redAccent;
                      } else {
                        msg = "You Are Healthy!";
                        BGT = Colors.greenAccent;
                      }
                      result = "$msg \n Your BMI is : ${BMI.toStringAsFixed(2)}";
                      setState(() {});
                    } else {
                      Text(
                        'Please Enter All The Data!',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w100,
                        ),
                      );
                      setState(() {});
                    }
                  },
                  child: Text(
                    'CONVERT',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  result,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
