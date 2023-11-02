import 'package:calculator_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(userInput.toString(),style: TextStyle(fontSize: 30, color: Colors.white),),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(answer.toString(),style: TextStyle(fontSize: 40, color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(title: 'AC',onPress: (){
                          userInput = '';
                          answer = '';
                          setState(() {

                          });
                        },),
                        MyButton(title: '+/-',onPress: (){
                          userInput += '+/-';
                          setState(() {

                          });
                        },),
                        MyButton(title: '%',onPress: (){
                          userInput += '%';
                          setState(() {

                          });
                        },),
                        MyButton(title: '/',onPress: (){
                          userInput += '/';
                          setState(() {

                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '7',onPress: (){
                          userInput += '7';
                          setState(() {

                          });
                        },),
                        MyButton(title: '8',onPress: (){
                          userInput += '8';
                          setState(() {

                          });
                        },),
                        MyButton(title: '9',onPress: (){
                          userInput += '9';
                          setState(() {

                          });
                        },),
                        MyButton(title: 'x',onPress: (){
                          userInput += 'x';
                          setState(() {

                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '4',onPress: (){
                          userInput += '4';
                          setState(() {

                          });
                        },),
                        MyButton(title: '5',onPress: (){
                          userInput += '5';
                          setState(() {

                          });
                        },),
                        MyButton(title: '6',onPress: (){
                          userInput += '6';
                          setState(() {

                          });
                        },),
                        MyButton(title: '-',onPress: (){
                          userInput += '-';
                          setState(() {

                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '1',onPress: (){
                          userInput += '1';
                          setState(() {

                          });
                        },),
                        MyButton(title: '2',onPress: (){
                          userInput += '2';
                          setState(() {

                          });
                        },),
                        MyButton(title: '3',onPress: (){
                          userInput += '3';
                          setState(() {

                          });
                        },),
                        MyButton(title: '+',onPress: (){
                          userInput += '+';
                          setState(() {

                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '0',onPress: (){
                          userInput += '0';
                          setState(() {

                          });
                        },),
                        MyButton(title: '.',onPress: (){
                          userInput += '.';
                          setState(() {

                          });
                        },),
                        MyButton(title: 'DEL',onPress: (){
                          userInput = userInput.substring(0, userInput.length-1);
                          setState(() {

                          });
                        },),
                        MyButton(title: '=',onPress: (){
                          equalPress();
                          setState(() {

                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress(){
    String finalUserInput = userInput;
    finalUserInput = finalUserInput.replaceAll('x','*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);

    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}


