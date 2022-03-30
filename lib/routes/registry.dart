import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../utils/color.dart';

class Registry extends StatefulWidget {
  Registry({Key? key}) : super(key: key);

  @override
  State<Registry> createState() => _RegistryState();
}

class _RegistryState extends State<Registry> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _registry() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();

      Timer(const Duration(milliseconds: 200), () => Navigator.pop(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#1e2632'),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: HexColor('#1e2632')),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                children: [
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: '账号'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: '密码'),
                        obscureText: true,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: '邀请码(选填)'),
                        obscureText: true,
                      )
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 62),
                    child: RoundedLoadingButton(
                      child: const Text('注册',
                          style: TextStyle(color: Colors.white)),
                      controller: _btnController,
                      color: Colors.green[400],
                      successColor: Colors.deepPurpleAccent[400],
                      onPressed: _registry,
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
