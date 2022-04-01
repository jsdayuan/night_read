import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_read/utils/color.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../common/global.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  EdgeInsets _topPadding = const EdgeInsets.only(top: 100);

  late StreamSubscription<bool> keyboardSubscription;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _params = {'username': '', 'password': ''};

  Future<void> Function() _login(BuildContext context) => () async {
        if (_formKey.currentState!.validate()) {
          _btnController.start();

          _formKey.currentState!.save();

          await Global.setUserAndUpdateIsLogin(jsonEncode(_params));

          Timer(const Duration(seconds: 3), () {
            _btnController.success();

            Timer(const Duration(milliseconds: 300), () {
              Navigator.pushReplacementNamed(context, '/');
            });
          });
        }
      };

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        setState(() {
          _topPadding = const EdgeInsets.only(top: 0);
        });
      } else {
        setState(() {
          _topPadding = const EdgeInsets.only(top: 100);
        });
      }
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  AnimatedPadding(
                    padding: _topPadding,
                    duration: const Duration(milliseconds: 100),
                    child: Image.asset(
                      'images/login.gif',
                      width: 128,
                    ),
                  )
                ],
              ),
              Center(
                child: Text(
                  'Reserve Player ',
                  style: GoogleFonts.sriracha(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 30)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 60, 28, 28),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: '账号',
                              border:
                                  OutlineInputBorder(borderSide: BorderSide())),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入账号';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _params['username'] = value;
                          },
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: '密码',
                              border:
                                  OutlineInputBorder(borderSide: BorderSide())),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入密码';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _params['password'] = value;
                          },
                        )
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(38, 28, 38, 28),
                child: RoundedLoadingButton(
                  child: Text('登录', style: TextStyle(color: Colors.white)),
                  controller: _btnController,
                  animateOnTap: false,
                  color: Colors.green[400],
                  successColor: Colors.deepPurpleAccent[400],
                  onPressed: _login(context),
                ),
              ),
              Expanded(
                  child: Row(children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'registry');
                    },
                    child: Text('注册')),
                Spacer(),
                TextButton(onPressed: () {}, child: Text('修改密码'))
              ]))
            ],
          )),
    );
  }
}
