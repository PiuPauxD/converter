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
  final List<String> measures = ['meters', 'kilometres', 'grams', 'kilograms', 'feet', 'miles', 'pounds (lbs)', 'ounces'];
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
        body: Center(
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
                    value: startMeasure,
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
                    value: startMeasure,
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
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1d1e22),
                  ),
                  onPressed: (){}, 
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

              Text(
                (numberFrom == null) ? '' : numberFrom.toString(),
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
