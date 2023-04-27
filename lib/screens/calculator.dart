import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'package:calculator/export widgets/export_widgets.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String textFieldExpression = "";
  String mathExpression = "";
  final textEditingController = TextEditingController();
  bool lastCharacterIsOperator = false;

  evaluateExpression() {
    // print(mathExpression);
    if (!lastCharacterIsOperator) {
      Expression expression = Expression.parse(mathExpression);
      const evaluator = ExpressionEvaluator();
      var context = {"dummy": "this is dummy context"};
      var result = evaluator.eval(expression, context);
      setState(() {
        textFieldExpression = "$result";
        mathExpression = "$result";
      });
    }
  }

  addCharacter(String char) {
    String mathChar = char;
    if (char == "×") {
      mathChar = "*";
    } else if (char == "÷") {
      mathChar = "/";
    }
    textFieldExpression = "$textFieldExpression$char";
    mathExpression = "$mathExpression$mathChar";
  }

  addDigit(String digit) {
    lastCharacterIsOperator = false;
    addCharacter(digit);
  }

  addOperator(String operator) {
    if (lastCharacterIsOperator) {
      // Replace the last operator
      var len = textFieldExpression.length;
      textFieldExpression =
          "${textFieldExpression.substring(0, len - 1)}$operator";
      mathExpression = "${mathExpression.substring(0, len - 1)}$operator";
    } else {
      // add the operator
      addCharacter(operator);
    }
    lastCharacterIsOperator = true;
  }

  clearExpression() {
    textFieldExpression = "";
    mathExpression = "";
    lastCharacterIsOperator = false;
  }

  @override
  Widget build(BuildContext context) {
    textEditingController.text = textFieldExpression;
    textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: textEditingController.text.length));

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    maxLines: 3,
                    controller: textEditingController,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue[200],
                      letterSpacing: 2.0,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.none,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                textFieldExpression =
                                    textFieldExpression.substring(
                                        0, textFieldExpression.length - 1);
                                mathExpression = mathExpression.substring(
                                    0, mathExpression.length - 1);
                              });
                            },
                            icon: Icon(
                              Icons.backspace,
                              color: Colors.blueGrey[500],
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),

          /// First row
          Container(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                addDigit("7");
                              });
                            },
                            child: Text(
                              "7",
                              style: digit,
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                addDigit("8");
                              });
                            },
                            child: Text(
                              "8",
                              style: digit,
                            )),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              addDigit("9");
                            });
                          },
                          child: Text(
                            "9",
                            style: digit,
                          ),
                        ),
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                addOperator("+");
                              });
                            },
                            elevation: 50.0,
                            child: const Text("+",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Second row
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                addDigit("4");
                              });
                            },
                            child: Text(
                              "4",
                              style: digit,
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                addDigit("5");
                              });
                            },
                            child: Text(
                              "5",
                              style: digit,
                            )),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              addDigit("6");
                            });
                          },
                          child: Text(
                            "6",
                            style: digit,
                          ),
                        ),
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                addOperator("-");
                              });
                            },
                            elevation: 50.0,
                            child: const Text("−",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Third row
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                addDigit("1");
                              });
                            },
                            child: Text(
                              "1",
                              style: digit,
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                addDigit("2");
                              });
                            },
                            child: Text(
                              "2",
                              style: digit,
                            )),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              addDigit("3");
                            });
                          },
                          child: Text(
                            "3",
                            style: digit,
                          ),
                        ),
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                addOperator("×");
                              });
                            },
                            elevation: 50.0,
                            child: const Text("×",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Fourth row
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                addDigit("0");
                              });
                            },
                            child: Text(
                              "0",
                              style: digit,
                            )),
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                clearExpression();
                              });
                            },
                            elevation: 50.0,
                            child: const Text("C",
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              evaluateExpression();
                              setState(() {
                                lastCharacterIsOperator = false;
                              });
                            },
                            elevation: 50.0,
                            child: const Text("=",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                addOperator("÷");
                              });
                            },
                            elevation: 50.0,
                            child: const Text("÷",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
