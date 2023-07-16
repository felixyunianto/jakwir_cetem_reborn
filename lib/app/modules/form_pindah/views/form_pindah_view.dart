import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_pindah_controller.dart';

class FormPindahView extends GetView<FormPindahController> {
  const FormPindahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormPindahView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FormPindahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
