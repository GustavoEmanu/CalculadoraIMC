import 'package:flutter/material.dart';

class MyCalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraEstado createState() => _CalculadoraEstado();
}

class _CalculadoraEstado extends State<Calculadora> {
  double resultado = 0;
  TextEditingController controlaentrada1 = TextEditingController();
  TextEditingController controlaentrada2 = TextEditingController();

  void calcular() {
    double entrada1 = double.tryParse(controlaentrada1.text) ?? 0;
    double entrada2 = double.tryParse(controlaentrada2.text) ?? 0;

    setState(() {
      double resultadoCalculado = entrada2/(entrada1 * entrada1) ;

      resultado = resultadoCalculado;
      print(resultado);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(resultado);
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Calculadora IMC"),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),

      ),
      backgroundColor: Color.fromARGB(255, 189, 184, 184),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: controlaentrada1,
              decoration: const InputDecoration(labelText: "Altura"),
            ),
            
            TextField(
              keyboardType: TextInputType.number,
              controller: controlaentrada2,
              decoration: const InputDecoration(labelText: "Peso"),
            ),
            
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: calcular,
                  child: const Text("Calcular"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 0, 0)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Índice de massa corporal: $resultado",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              
              
            ),
          ],
        ),
      ),
    );
  }
}
