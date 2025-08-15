import 'package:bmi_app/mainpage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nxtpg = TextEditingController();
  var message = "";
  var Name = "";
  var changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Login Page',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 3.0, 1.0, 3.0),
              child: Icon(Icons.replay_circle_filled_rounded, size: 30),
            ),
            onPressed: () {
              setState(() {
                nxtpg.clear();
                changeButton = false;
                message = " ";
                Name = "";
              });
            },
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              Text(
                "Welcome $Name",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
          
              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: nxtpg,
                  onChanged: (value) {
                    Name = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.edit_note_rounded),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.green.shade100,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.lightGreen,
                      ),
                    ),
                    hintText: "Enter Your Name",
                  ),
                ),
              ),
              SizedBox(height: 15),
          
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 30),
                child: InkWell(
                  splashColor: Colors.green,
                  onTap: () async {
                    if (nxtpg.text.trim().isNotEmpty) {
                      changeButton = true;
                      setState(() {});
                      //await Future.delayed(Duration(microseconds: 200));
                      await Future.delayed(Duration(seconds: 1));
          
                       await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyBMIPage()),
                      );
                       changeButton = false;
                      setState(() {});
                      //await Future.delayed(Duration(seconds: 2));
                      message = "";
                    } else {
                      Text(
                        message = "Plese Enter Your Name ",
                        style: TextStyle(fontSize: 20),
                      );
                      setState(() {});
                    }
                  },
                  child: AnimatedContainer(
                    width: changeButton ? 50 : 150,
                    height: 50,
          
                    duration: Duration(seconds: 1),
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: Colors.blueAccent,
                    //   // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                    // ),
                    child: changeButton
                        ? Icon(Icons.done, color: Colors.white)
                        : Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                    // child: ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     splashFactory: InkRipple.splashFactory,
                    //   ),
                    //   onPressed: () {
                    //     var nextpage = nxtpg.text.toString();
                    //     if (nextpage != "") {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => MyBMIPage()),
                    //       );
                    //       message = "";
                    //       setState(() {});
                    //     } else {
                    //       Text(
                    //         message = "Plese Enter Your Name ",
                    //         style: TextStyle(fontSize: 20),
                    //       );
                    //       setState(() {});
                    //     }
                    //   },
                    //   child: Text("LOGIN"),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                message,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



















/*import 'package:bmi_app/mainpage.dart';
import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "MY Main Page",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
       
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Text(
                'HELLO',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Text("NEXT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/