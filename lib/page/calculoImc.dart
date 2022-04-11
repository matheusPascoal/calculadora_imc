import 'package:flutter/material.dart';

class CalculoImc extends StatefulWidget {
  const CalculoImc({Key? key}) : super(key: key);

  @override
  State<CalculoImc> createState() => _CalculoImcState();
}

class _CalculoImcState extends State<CalculoImc> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _infoText = 'Informe seus dados!';
  _resetButton() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      var _infoText = 'Informe seus dados!';
    });
  }

  _calculo() {
    setState(() {
      // parse transforma o valor
      var peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      var imc = peso / (altura * altura);
      print(imc);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
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
          leading: IconButton(
              onPressed: () {
                setState(() {
                  _resetButton();
                });
              },
              icon: Icon(Icons.refresh, color: Colors.green, size: 40)),
        ),
        backgroundColor: Colors.blueGrey[800],
        body: Stack(
          children: [
            // Image.network(
            //     'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdepositphotos.com%2F127841984%2Fstock-photo-fitness-or-bodybuilding-background-old.html&psig=AOvVaw2EUADxYFOKuCIzxTwZXt2l&ust=1649574490939000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCNj4xIS2hvcCFQAAAAAdAAAAABAY',
            //     fit: BoxFit.cover,
            //     width: 1000),
            Column(
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
                    controller: pesoController,
                    decoration: InputDecoration(
                        labelText: 'Peso (KG)',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.green),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: alturaController,
                    decoration: InputDecoration(
                      labelText: 'Altura (cm)',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _calculo,
                  child: Text(
                    'CALCULAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
