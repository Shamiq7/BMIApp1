import 'package:flutter/material.dart';

class MyBMIPage extends StatefulWidget {
  const MyBMIPage({super.key});

  @override
  State<MyBMIPage> createState() => _MyBMIPageState();
}

class _MyBMIPageState extends State<MyBMIPage> {
  var n1controller = TextEditingController();
  var n2controller = TextEditingController();
  var n3controller = TextEditingController();
  var result = " ";
  var changeButton = false;
  var bgt = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MY BMI",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          //textDirection: TextDirection.ltr,
        ),
        centerTitle: true,
        backgroundColor: bgt,
      ),
      body: Container(
        width: 500,
        color: bgt,
        child: ListView(
          scrollDirection: Axis.vertical,

          //mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/assets/BMI.png",
              height: 350,
              fit: BoxFit.fill,
              //width: 500
            ),
            SizedBox(height: 20),

            Center(
              child: SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: n1controller,
                  decoration: InputDecoration(
                    hintText: "Enter Your Weight",
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      //backgroundColor: Colors.lightGreen,
                    ),
                    prefixIcon: Icon(Icons.monitor_weight),
                    iconColor: Colors.lightGreen,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.lightGreen),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: n2controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Height (in inches)",
                    prefixIcon: Icon(Icons.line_weight_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.lightGreen),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: n3controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Height (in Feet)",
                    prefixIcon: Icon(Icons.monitor_weight_rounded),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.lightGreen),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Center(
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    var iwt = n1controller.text.toString();
                    var iHi = n2controller.text.toString();
                    var iHf = n3controller.text.toString();

                    if (iwt != "" && iHi != "" && iHf != "") {
                      var intwt = double.parse(iwt);
                      var intHi = double.parse(iHi);
                      var intHf = double.parse(iHf);

                      var Tinch = (intHi * 12) + intHf;
                      var Tcm = Tinch * 2.54;
                      var Tm = Tcm / 100;
                      var BMI = intwt / (Tm * Tm);
                      var msg = "";
                      if (BMI > 25) {
                        msg = "You Are Overweight!";
                        bgt = Colors.orange;
                      } else if (BMI < 18) {
                        msg = "You Are Underweight!";
                        bgt = Colors.yellow;
                      } else {
                        msg = "You Are Healthy!";
                        bgt = Colors.green;
                      }

                      result = "$msg and Your BMI is ${BMI.toStringAsFixed(2)}";
                      setState(() {});
                    } else {
                      result = "Please Enter ALL the Data";

                      setState(() {});
                    }
                  },
                  child: Text("Convert", style: TextStyle(fontSize: 25)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(child: Text(result, style: TextStyle(fontSize: 15))),
          ],
        ),
      ),
    );
  }
}








/*import 'package:flutter/material.dart';

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
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
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
*/