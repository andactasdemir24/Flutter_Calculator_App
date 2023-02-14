import 'package:flutter/material.dart';

class Calculatorr extends StatefulWidget {
  const Calculatorr({super.key});

  @override
  State<Calculatorr> createState() => _CalculatorrState();
}

class _CalculatorrState extends State<Calculatorr> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () => {calculate(btnText)},
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), fixedSize: const Size(70, 70), backgroundColor: btnColor),
      child: Text(
        btnText,
        style: TextStyle(fontSize: 25, color: txtColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(child: Text('Calculatorr')),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.white, fontSize: 70),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton('AC', Colors.grey, Colors.black),
                  numButton('+/-', Colors.grey, Colors.black),
                  numButton('%', Colors.grey, Colors.black),
                  numButton('÷', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton('7', Colors.grey[850]!, Colors.white),
                  numButton('8', Colors.grey[850]!, Colors.white),
                  numButton('9', Colors.grey[850]!, Colors.white),
                  numButton('x', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton('4', Colors.grey[850]!, Colors.white),
                  numButton('5', Colors.grey[850]!, Colors.white),
                  numButton('6', Colors.grey[850]!, Colors.white),
                  numButton('-', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numButton('1', Colors.grey[850]!, Colors.white),
                  numButton('2', Colors.grey[850]!, Colors.white),
                  numButton('3', Colors.grey[850]!, Colors.white),
                  numButton('+', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        fixedSize: const Size(160, 70),
                        alignment: AlignmentDirectional.centerStart,
                        backgroundColor: Colors.grey[850]),
                    child: const Text(
                      '0',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  numButton('.', Colors.grey[850]!, Colors.white),
                  numButton('=', Colors.orange, Colors.white)
                ],
              ),
              const SizedBox(height: 10),
            ],
          )),
    );
  }

  // Logic
  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String text = "0";
  String operation = "";

  void calculate(String btnText) {
    if (btnText == "AC") {
      result = "";
      text = "";
      firstNumber = 0;
      secondNumber = 0;
    } else if (btnText == "+" || btnText == "-" || btnText == "x" || btnText == "/") {
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
    } else if (btnText == "=") {
      secondNumber = int.parse(text);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
      }
      if (operation == "x") {
        result = (firstNumber * secondNumber).toString();
      }
      if (operation == "/") {
        result = (firstNumber ~/ secondNumber).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}
