import 'package:flutter/material.dart';

void main() {
  runApp(CurencyConverterApp());
}

class CurencyConverterApp extends StatelessWidget {
  const CurencyConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _myController  = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Currency converter'),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
        ),

        body: Column(
            children: <Widget> [
            Image.network('https://previews.123rf.com/images/gkrphoto/gkrphoto1504/gkrphoto150400032/39142870-%EB%8B%A4%EB%A5%B8-%ED%86%B5%ED%99%94%EC%97%90%EC%84%9C-%EB%8F%88-%EB%B0%B0%EA%B2%BD.jpg'),

            Container(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _myController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),

                decoration: const InputDecoration(
                  fillColor: Colors.lightBlue,
                  hintText: "enter the amount in EUR",
                ),

                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return "please enter a number";
                  }

                  final double? result = double.tryParse(value);
                  if(result == null){
                    return "please enter a number";
                  }
                },
              ),
            ),

            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                    onPressed: () {
                      final bool valid = Form.of(context)!.validate();

                      if(valid){
                        final double value = double.parse(_myController.text);
                        final double resultValue = value * 5;

                        setState(() {
                          _result = '${resultValue.toStringAsFixed(3)} RON';
                        });
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey
                    ),

                    child: const Text('CONVERT!'),
                );
              },
            ),

            Text(
              _result,
              style: const TextStyle(color: Colors.black87, fontSize: 32),
            ),
            ],
        ),
      ),
    );
  }
}