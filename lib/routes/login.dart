import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_read/utils/color.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#1e2632'),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('#1e2632'),
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: HexColor('#1e2632')),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: Image.asset(
                          'images/login.gif',
                          width: 128,
                        )),
                    Text(
                      'Reserve Player ',
                      style: GoogleFonts.sriracha(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 30)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(28, 60, 28, 28),
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: '用户名',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide())),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: '密码',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide())),
                          )
                        ],
                      )),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: Row(children: [
                          TextButton(onPressed: () {}, child: Text('注册')),
                          Spacer(),
                          TextButton(onPressed: () {}, child: Text('登陆'))
                        ]))
                  ],
                ))
              ],
            )
            // Expanded(
            //     child: SizedBox(
            //   width: double.infinity,
            //   child: ,
            // ))
          ],
        ),
      ),
    );
  }
}
