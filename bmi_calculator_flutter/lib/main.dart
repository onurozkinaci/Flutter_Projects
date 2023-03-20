import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        //primaryColor: Colors.red,
        appBarTheme: AppBarTheme(color: Color(0XFF203A76)),
        //accentColor: Colors.yellow,
        scaffoldBackgroundColor: Color(0xFF040B22),
      ),
      home: InputPage(),
    );
  }
}

//**Butona tiklandiginda temayi Light-Dark arasinda degistirmek icin
/* Butona tiklandiginda temayi Light-Dark arasinda degistirmek icin;
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InputPage();
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  ThemeData status = ThemeData.dark();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: status,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('BMI CALCULATOR')),
          ),
          body: Center(
            child: Text('Body Text'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                status == ThemeData.dark()
                    ? status = ThemeData.light()
                    : status = ThemeData.dark();
              });
            },
          ),
        ));
  }
}
*/
