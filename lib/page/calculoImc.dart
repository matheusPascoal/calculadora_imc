import 'package:flutter/material.dart';

class CalculoImc extends StatefulWidget {
  const CalculoImc({Key? key}) : super(key: key);

  @override
  State<CalculoImc> createState() => _CalculoImcState();
}

class _CalculoImcState extends State<CalculoImc> {
  calculadora() {
    if (18.5 >= 24.9) {
      print('Normal');
    } else if (25 >= 29.9) {
      print('Sobre peso');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Calculadora IMC'),
          leading: Icon(Icons.refresh, color: Colors.green, size: 40),
        ),
        backgroundColor: Colors.blueGrey[800],
        body: Column(
          children: [
            Center(
              child: Icon(
                Icons.person,
                color: Colors.green,
                size: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Peso (KG)',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.green),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.green),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'CALCULAR',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text('Informe seus Dados!')
          ],
        ));
  }
}
