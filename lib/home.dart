import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: KalkulatorBmi(),
    );
  }
}

//StatefulWidget
class KalkulatorBmi extends StatefulWidget{
  KalkulatorBmi({Key key}) : super(key: key);

  @override
  _KalkulatorBmiState createState() => _KalkulatorBmiState();
}

class _KalkulatorBmiState extends State<KalkulatorBmi> {

  int currentindex = 0;
  String result = "";
  double height = 0;
  double weight = 0;

  //Deklarasi Controller input
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kalkulator BMI", style: TextStyle(color: Colors.black),),
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      radioButton("Laki-Laki", Colors.greenAccent, 0),
                      radioButton("Perempuan", Colors.yellowAccent, 1),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //input form
                  Text(
                    "Tinggi Badan (Cm):",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    //menambahkan controller
                    controller: heightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Tinggi Badan Anda (Cm)",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0,
                  ),

                  //BB
                  Text(
                    "Berat Badan (Kg):",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Berat Badan Anda (Kg)",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,
                  ),

                  //Button Hitung
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          height = double.parse(heightController.value.text);
                          weight = double.parse(weightController.value.text);
                        });

                        hitungBmi(height, weight);
                      },
                      color: Colors.greenAccent,
                      child: Text("Hitung",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                    ),
                  ),
                SizedBox(height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                  "Body Mass Index Anda :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    ),
                   ),
                  ),
                  SizedBox(height: 50.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "$result",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
              )
          ),
        ),
      ),
    );
  }

  void hitungBmi(double height, double weight){
    double finalresult = weight / (height * height / 10000); //convert Cm to M
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  //deklarasi fungsi changeindex value di button pressed
  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  //customwidget radio
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        //margin
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        //height buat button
        height: 80.0,
        child: FlatButton(
          //warna
          color: currentindex == index ? color : Colors.grey[200],
          //border rounded
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),

          onPressed: () {
            changeIndex(index);
          },

          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
