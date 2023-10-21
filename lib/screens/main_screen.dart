import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:kifah/constant/style.dart';
import 'package:kifah/widgets/DefaultTextStyle/defaultextstyle.dart';
import 'package:kifah/widgets/defaultbuttomn/defaultbuttomn.dart';
import 'package:kifah/widgets/mytextfromfield/my_textfrom_field.dart';
import 'package:kifah/widgets/mytoast/mytoast.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

String separateWithSlash(String input) {
  // Split the input string into a list of characters
  List<String> characters = input.split('');

  // Join the characters with "/" in between
  String separatedString = characters.join('/');

  return separatedString;
}


  String dotLess(String input) {
    var words = input.split(" ");
    for (var i = 0; i < words.length; i++) {
      var word = "", oneWord = words[i].split(''), size = oneWord.length - 1;
      for (var j = 0; j <= size; j++) {
        var newChar = oneWord[j];
        if ('ةبتثجخذزشضظغفقني'.contains(newChar)) {
          var pos = 'ةبتثجخذزشضظغفقني'.indexOf(newChar);
          newChar = 'هٮٮٮححدرسصطعڡٯٮٮ'[pos];
          if (j == size ||
              (j <= size && !RegExp(r'[ء-غف-ي]').hasMatch(oneWord[j + 1]))) {
            if (newChar == 'ي') {
              newChar = 'ى';
            } else if (newChar == 'ن') {
              newChar = 'ں';
            }
          }
        }
        word += newChar;
      }
      words[i] = word;
    }
    return words.join(" ");
  }

  TextEditingController textEditingController = TextEditingController();

  String result = "";

  String tchfir = "طريقة التشفير";
  bool dotless = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: height * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.025,
                      child: Image.asset(
                        "assets/images/راية_العقاب 1.png",
                        height: height * 0.1,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    MyDefaultTextStyle(
                        text: "رضك",
                        height: height * 0.03,
                        bold: true,
                        color: black),
                    SizedBox(
                      height: height * 0.04,
                      child: Image.asset(
                        "assets/images/Vector.png",
                        height: height * 0.1,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    MyDefaultTextStyle(
                        text: "إخوانك ودافع عن",
                        height: height * 0.03,
                        bold: true,
                        color: black),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    MyDefaultTextStyle(
                        text: "أنصر",
                        height: height * 0.03,
                        bold: true,
                        color: maincolor),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: width * 0.06),
                  
                    child: MyDefaultTextStyle(
                        text:
                            "منصة لإنشاء هاشتاج واعادة صياغة المنشورات بطريقة لاتتبعها خوارزميات السوشل ميديا نصرة لإخواننا في فلسطين ودعم قضية المسلمين.",
                        height: height * 0.016,
                        color: subtext),
                  ),
                
                SizedBox(
                  height: height * 0.025,
                ),
                Container(
                  margin:
                      EdgeInsets.only(right: width * 0.06, left: width * 0.06),
                  child: Defaultbutton(
                      functon: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return Container(
                                margin: EdgeInsets.only(top: height * 0.04),
                                height: height * 0.3,
                                child: Column(
                                  children: [
                                    Defaultbutton(
                                        functon: () {
                                          setState(() {
                                            tchfir = 'تشفير النص بدون نقاط';
                                            dotless = true;
                                          });
                                          Navigator.pop(ctx);
                                        },
                                        text: 'تشفير النص بدون نقاط',
                                        height: height * 0.07,
                                        width: width * 0.9,
                                        color: maincolor,
                                        textcolor: white,
                                        border: 3),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    Defaultbutton(
                                        functon: () {
                                          setState(() {
                                            tchfir =
                                                'تشفير النص بوضع / بين كل حرف ';
                                            dotless = false;
                                          });
                                          Navigator.pop(ctx);
                                        },
                                        text: 'تشفير النص بوضع / بين كل حرف ',
                                        height: height * 0.07,
                                        width: width * 0.9,
                                        color: maincolor,
                                        textcolor: white,
                                        border: 3),
                                  ],
                                ),
                              );
                            });
                      },
                      text: tchfir,
                      height: height * 0.07,
                      width: width * 0.9,
                      color: gris,
                      textcolor: black,
                      border: 3),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.2,
                  margin:
                      EdgeInsets.only(right: width * 0.06, left: width * 0.06),
                  child: MyTextForm(
                      controller: textEditingController,
                      hinttext: "ادخل النص",
                      height: height * 0.2,
                      width: width * 0.9),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  margin:
                      EdgeInsets.only(right: width * 0.06, left: width * 0.06),
                  child: Defaultbutton(

                   
                      functon: () {

                        if(dotless){
setState(() {
                          result = dotLess(textEditingController.text);
                        });

                        print(textEditingController.text);
                        print(result);
                        }

                        else{

                          setState(() {
                          result = separateWithSlash(textEditingController.text);
                        });

                        print(textEditingController.text);
                        print(result);


                        }
                        
                      },
                      text: 'تشفير النص',
                      height: height * 0.07,
                      width: width * 0.9,
                      color: maincolor,
                      textcolor: white,
                      border: 3),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  margin:
                      EdgeInsets.only(right: width * 0.06, left: width * 0.06),
                  alignment: Alignment.center,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.white, // Border color (red in this case)
                        width: 4.0,
                      )),
                  child: Column(children: [
                    MyDefaultTextStyle(
                        text: ":ستظهر نتائج العملية هنا",
                        height: height * 0.018,
                        color: black),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Expanded(
                      child: MyDefaultTextStyle(
                          text: result,
                          height: height * 0.018,
                          color: black,
                          bold: true),
                    ),
                  
                     Defaultbutton(
                          functon: () {
                            FlutterClipboard.copy(result)
                                .then((value) => showtoast("تم نسخ الناتج"));
                          },
                          text: 'نسخ النتائج كاملا',
                          height: height * 0.04,
                          width: width * 0.9,
                          color: copytext,
                          textcolor: black,
                          fontsize: height * 0.016,
                          border: 3),
                   
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
