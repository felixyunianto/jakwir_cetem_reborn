import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        Container(
            height: double.infinity,
            width: size.width,
            padding: EdgeInsets.only(top: 123, right: 47, left: 47),
            color: Color(0xffF1F3F6),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "JAKWIR",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff5193F2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      const Text(
                        "CETEM",
                        style: TextStyle(
                            fontSize: 24,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.06),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ubah Password",
                          style: TextStyle(
                              color: Color(0xFF757C8E),
                              fontSize: 12,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Form(
                            key: controller.changePasswordFormKey,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: TextFormField(
                                    maxLength: 4,
                                    keyboardType: TextInputType.number,
                                    validator: controller.validator,
                                    controller: controller.otpController,
                                    style: const TextStyle(
                                        letterSpacing: 0.4,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff5B5B5B),
                                        fontSize: 14),
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        border: InputBorder.none,
                                        filled: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelText: "OTP",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Color(0xFFF1F3F6)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Color(0xFFF1F3F6)),
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Obx((() => (TextFormField(
                                        controller:
                                            controller.passwordController,
                                        validator: controller.validator,
                                        obscureText:
                                            controller.isShowPassword.value,
                                        style: const TextStyle(
                                            letterSpacing: 0.4,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff5B5B5B),
                                            fontSize: 12),
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  controller.setIsShowPassword(
                                                      !controller.isShowPassword
                                                          .value);
                                                },
                                                icon: const Icon(
                                                  Icons.remove_red_eye,
                                                  color: Color(0xff0C3B2E),
                                                )),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 24),
                                            border: InputBorder.none,
                                            filled: true,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: "Kata Sandi",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFFF1F3F6)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFFF1F3F6)),
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold)),
                                      )))),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Obx((() => (TextFormField(
                                        controller:
                                            controller.newPasswordController,
                                        validator: controller.validator,
                                        obscureText:
                                            controller.isShowNewPassword.value,
                                        style: const TextStyle(
                                            letterSpacing: 0.4,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff5B5B5B),
                                            fontSize: 12),
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  controller
                                                      .setIsShowNewPassword(
                                                          !controller
                                                              .isShowNewPassword
                                                              .value);
                                                },
                                                icon: const Icon(
                                                  Icons.remove_red_eye,
                                                  color: Color(0xff0C3B2E),
                                                )),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 24),
                                            border: InputBorder.none,
                                            filled: true,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: "Konfirmasi Kata Sandi",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFFF1F3F6)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFFF1F3F6)),
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold)),
                                      )))),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        controller.changePassword();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff5193F2),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      child: const Text("Ubah Password")),
                                ),
                              ],
                            ))
                      ]),
                ])))
      ]),
    );
  }
}
