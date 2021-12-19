import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final _formkey = GlobalKey<
      FormState>(); //form ko key generate gareko, form kun key sanga associate chata bhanera herna lai formkey
  final _firstcontroller = TextEditingController();
  final _secondcontroller = TextEditingController();

  String result = " ";
  String? myvalidation(value) {
    if (value == null || value.isEmpty) {
      return "Field is empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              const Text(
                'Adding two numbers',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              TextFormField(
                validator:myvalidation,
                controller: _firstcontroller,
                keyboardType: TextInputType.number,
                cursorColor: Colors.red,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  labelText: 'First number',
                  hintText: '0',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _firstcontroller.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator:myvalidation,
                controller: _secondcontroller,
                keyboardType: TextInputType.number,
                cursorColor: Colors.red,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  labelText: 'Second number',
                  hintText: '0',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _secondcontroller.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      result = ((int.parse(_firstcontroller.text) +
                              int.parse(_secondcontroller.text))
                          .toString());
                    });
                  }
                },
                child: const Text('Sum'),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 150,
                      height: 50,
                      color: Colors.black,
                      child: const Center(
                        child: Text(
                          'Result',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 150,
                      height: 50,
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          result,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
