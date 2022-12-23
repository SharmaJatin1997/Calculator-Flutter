import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Calc());
}

class Calc extends StatelessWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  RxString enteredText = RxString('');
  var operator;
  RxDouble result = RxDouble(0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.4)),
                  margin: const EdgeInsets.only(
                      bottom: 10, left: 10, right: 10, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SingleChildScrollView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: 20, right: 20),
                              alignment: Alignment.centerRight,
                              child: Obx(
                                () => Text(
                                  enteredText.value,
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          child: Text(
                            result.value != 0.0 ? '=${result.value}' : '',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Flexible(
              flex: 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value = '';
                            result.value = 0.0;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            fixedSize: const Size(180, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            'AC',
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value = enteredText.value
                                .substring(0, enteredText.value.length - 1);
                            result.value = 0.0;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Icon(Icons.backspace),
                        ),
                      /*  ElevatedButton(
                          onPressed: () {
                            operator.value = '%';
                            enteredText.value += '%';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),*/
                        ElevatedButton(
                          onPressed: () {
                            operator = '/';
                            enteredText.value += '/';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '/',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '7';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '7',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '8';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '8',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '9';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '9',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            operator = 'x';
                            enteredText.value += 'x';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            'x',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '4';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '4',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '5';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '5',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '6';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '6',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            operator = '-';
                            enteredText.value += '-';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '-',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '1';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '2';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '2',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '3';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            operator = '+';
                            enteredText.value += '+';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '0';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(180, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '0',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            enteredText.value += '.';
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff272B33),
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '.',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            calculationMethod();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            fixedSize: const Size(80, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Text(
                            '=',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  calculationMethod() {
    double number1;
    double number2 = 0.0;
    List myList = enteredText.split(RegExp(r"[x/+-]"));
    List operatorList = enteredText.split(RegExp("[0-9]"));
    List newList=[];
    for(int j = 0; j < operatorList.length; j++){
      if(operatorList[j]!="" && operatorList[j]!="." ){
        newList.add(operatorList[j]);
      }
    }
    number2=double.parse(myList[0]);
    for (int i = 1; i < myList.length; i++) {
      number1 = double.parse(myList[i]);
      switch (newList[0]) {
        case '+':
          {
            number2 += number1;
            newList.removeAt(0);
            break;
          }
        case '-':
          {
            number2 -= number1;
            newList.removeAt(0);
            break;
          }
        case 'x':
          {
            number2 *= number1;
            newList.removeAt(0);
            break;
          }
        case '/':
          {
            number2 /= number1;
            newList.removeAt(0);
            break;
          }
      }
    }
    result.value = number2.toPrecision(5);
  }

}
