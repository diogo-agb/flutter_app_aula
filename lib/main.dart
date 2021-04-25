import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  String _resultado = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _reset() {
    alcoolController.text = '';
    gasolinaController.text = '';

    setState(() {
      _resultado = '';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcularCombustivelIdeal() {
    setState(() {
      double varAlcool =
          double.parse(alcoolController.text.replaceAll(',', '.'));
      double varGasolina =
          double.parse(gasolinaController.text.replaceAll(',', '.'));
      double proporcao = varAlcool / varGasolina;

      _resultado =
          (proporcao < 0.7) ? 'Abasteça com Álcool' : 'Abasteça com Gasolina';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Álcool ou Gasolina?',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _reset();
              }),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.local_gas_station,
                size: 100,
                color: Colors.lightBlue[900],
              ),
              TextFormField(
                controller: alcoolController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Informe o valor do álcool'
                    : null,
                decoration: InputDecoration(
                  labelText: 'Valor do álcool',
                  labelStyle: TextStyle(color: Colors.lightBlue[900]),
                ),
                style: TextStyle(
                  color: Colors.lightBlue[900],
                  fontSize: 25.00,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: gasolinaController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Informe o valor da gasolina'
                    : null,
                decoration: InputDecoration(
                  labelText: 'Valor da gasolina',
                  labelStyle: TextStyle(
                    color: Colors.lightBlue[900],
                    fontSize: 25.00,
                  ),
                ),
                style: TextStyle(
                  color: Colors.lightBlue[900],
                  fontSize: 25.00,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calcularCombustivelIdeal();
                    }
                  },
                  child: Text(
                    'Verificar',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlue[900],
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
