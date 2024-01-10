import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarComponent,
        body: Center(
          child: Layout(),
        ),
      ),
    );
  }
}

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  TextEditingController _controller = TextEditingController();
  double _inputUser = 0.0;
  double _kelvin = 0.0;
  double _reamur = 0.0;

  _handleInputUser(value) {
    setState(() {
      _inputUser = value;
    });
  }

  _handleSubmitButton() {
    setState(() {
      _kelvin = _inputUser + 173.15;
      _reamur = _inputUser * (4 / 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: _controller,
            onChanged: (value) {
              _handleInputUser(double.parse(value));
            },
          ),
          showResultConverted(_kelvin,_reamur),
          ElevatedButton(onPressed: _handleSubmitButton, 
          child: Text("Konversi Suhu")
          )
        ],
      ),
    );
  }
}

var AppBarComponent = AppBar(
  backgroundColor: Colors.green,
  title: Center(
    child: Text(
      "Konversi Suhu".toUpperCase(),
      style: AppBarTitleStyle,
    ),
  ),
);

var AppBarTitleStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);

showResultConverted(kelvin, reamur) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      handleShowResultConverted("Kelvin", kelvin),
      handleShowResultConverted("Reamur", reamur)
    ],
  );
}

handleShowResultConverted(type, value) {
  return Container(
    child: Column(
      children: [Text("Suhu ${type}"), Text("${value}")],
    ),
  );
}
