import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Measurese Converter', 
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    ),
  );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? numberFrom;
  String? startMeasure;
  String? convertedMeasure;
  final List<String> measures = ['meters', 'kilometres', 'grams', 'kilograms', 'feet', 'miles', 'pounds (lbs)', 'ounces'];
  final Map<String, int> measuresMap = {
    'meters' : 0,
    'kilometres' : 1,
    'grams' : 2,
    'kilograms' : 3,
    'feet' : 4,
    'miles' : 5,
    'pounds (lbs)' : 6,
    'ounces' : 7,
  };

  final dynamic formulas = {
    '0' : [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1' : [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2' : [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3' : [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4' : [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5' : [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6' : [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7' : [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };

  void convert (double value, String from, String to){
    int? nFrom = measuresMap[from];
    int? nTo = measuresMap[to];
    var multiplier = formulas[nFrom.toString()][nTo];
    var result = value * multiplier;
    if (result == 0) {
      resultMessage = 'This convertation cannot be performed';
    } else{
      resultMessage = '${numberFrom.toString()} $startMeasure are ${result.toString()} $convertedMeasure';
    }
    setState(() {
      resultMessage = resultMessage;
    });
  }

  String? resultMessage;

  @override
  void initState(){
    numberFrom = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111217),
      appBar: AppBar(
      backgroundColor: Color(0xff111217),
      title: Text(
        'Measures Converter',
        style: TextStyle(
          color: Color(0xfff9fbfc),
        ),
          ),
        ), 
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 8),
                  child: Center(
                    child: Text(
                      'Value',
                      style: TextStyle(
                        fontSize: 24,
                        color:Color(0xfff9fbfc),
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff1d1e22),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        strutStyle: StrutStyle(
                          fontSize: 16,
                          height: 2,
                        ),
                        decoration: InputDecoration(
                          hintText:  'Please insert the measure to be...',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff8e8e91),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (text) {
                          var rv = double.tryParse(text);
                          if (rv != null) {
                            setState(() {
                              numberFrom = rv;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 8),
                  child: Center(
                    child: Text(
                      'From',
                      style: TextStyle(
                        fontSize: 24,
                        color:Color(0xfff9fbfc),
                      ),
                    ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff1d1e22),
                    ),
                    child: DropdownButton(
                      hint: Text(
                        'Select measure',
                        style: TextStyle(color: Colors.white,
                        ),
                      ),
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(16),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      dropdownColor: Color(0xff1d1e22),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      underline: SizedBox(),
                      items: measures.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:Text(value), 
                          );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          startMeasure = value;
                        });
                      }, 
                      value: startMeasure,
                    ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 8),
                  child: Center(
                    child: Text(
                      'To',
                      style: TextStyle(
                        fontSize: 24,
                        color:Color(0xfff9fbfc),
                      ),
                    ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff1d1e22),
                    ),
                    child: DropdownButton(
                      hint: Text(
                        'Select converted measure',
                        style: TextStyle(color: Colors.white,
                        ),
                      ),
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(16),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      dropdownColor: Color(0xff1d1e22),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      underline: SizedBox(),
                      items: measures.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:Text(value), 
                          );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          convertedMeasure = value;
                        });
                      },
                      value: convertedMeasure, 
                    ),
                  ),
                ),
          
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1d1e22),
                    ),
                    onPressed: (){
                      if (startMeasure!.isEmpty || convertedMeasure!.isEmpty || numberFrom == 0){
                        return;
                      } else{
                        convert(numberFrom!, startMeasure!, convertedMeasure!);
                      }
                    }, 
                    child: Center(
                      child: Text(
                        'Convert',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    (resultMessage == null) ? '' : resultMessage.toString(),
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
