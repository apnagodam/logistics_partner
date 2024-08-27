import 'dart:async';
import 'dart:convert';

import 'package:ag_logistics_partner/Data/models/auth_model.dart';
import 'package:ag_logistics_partner/Data/repoImpl/authentication/authentication_repo_impl.dart';
import 'package:ag_logistics_partner/Domain/Rest/authentication/authentication_service.dart';
import 'package:ag_logistics_partner/Domain/Rest/authentication/authentication_state.dart';
import 'package:ag_logistics_partner/Domain/providers/authentication/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../utils/enums/enums.dart';
import '../../utils/shared_pref/shared_pref_provider.dart';
import '../../utils/widgets/widgets.dart';
import '../home/home_page.dart';
import 'login_page.dart';

class OtpVerificationPage extends ConsumerWidget {
  const OtpVerificationPage({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(timerCountProvider) == 0) {
      // ref.watch(timerCountProvider.notifier).state = 20;
    } else {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        ref.watch(timerCountProvider.notifier).state =
            ref.watch(timerCountProvider.notifier).state - 1;
      });
    }
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/app_logo.png',
                fit: BoxFit.contain,
                height: context.heightPx / 5,
                color: Colors.green,
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translate('verify'),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OtpTextField(
                  enabled: ref.watch(otpStatusProvider) == OtpStatus.FILLED
                      ? false
                      : true,
                  numberOfFields: 6,
                  focusedBorderColor: context.themeData.primaryColor,
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.05),
                  showFieldAsBox: false,
                  onCodeChanged: (String code) {
                    ref.watch(otpProvider.notifier).state = code;
                  },
                  borderColor: context.themeData.primaryColor,
                  borderWidth: 3,
                  onSubmit: (String verificationCode) async {
                    await ref
                        .watch(verifyOtpProvider(
                                otp: verificationCode, phoneNumber: phoneNumber)
                            .future)
                        .then((value) async {
                      if (value.status == 1) {
                        SharedPref().setUserData(
                            jsonDecode(authenticationModelToMap(value)));
                        SharedPref().setToken(
                            SharedPref().getUserData().authorization ?? "");
                        ref
                            .watch(otpStatusProvider.notifier)
                            .setOtpStatus(OtpStatus.FILLED);

                        context.pAndRemoveUntil(const HomePage());
                      } else {
                        ref
                            .watch(otpStatusProvider.notifier)
                            .setOtpStatus(OtpStatus.FAILED);
                        errorToast(value.message ??= "Error");
                      }
                    });

                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible:
                      ref.watch(otpStatusProvider.notifier).getOtpStatus() ==
                          OtpStatus.SENT,
                  child: InkWell(
                    child: Text(
                        '${translate('resend')} ${ref.watch(timerCountProvider)}'),
                    onTap: () {
                      ref
                          .watch(
                              authenticationServiceProvider(phoneNumber.toInt)
                                  .notifier)
                          .sendOtp();
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: context.themeData.primaryColor),
                    onPressed: () {
                      ref
                          .watch(authenticationServiceProvider(
                                  phoneNumberController.text.toInt)
                              .notifier)
                          .verifyOtp(
                              ref.watch(otpProvider), ref.watch(tokenProvider))
                          .then((value) {
                        if (value['status'] == 1) {
                          successToast("Logged in successfully");
                          SharedPref().setUserData(value);
                          print(SharedPref().getUserData());
                          print(value);
                        }
                      });
                    },
                    child: Text(
                      translate('submit'),
                      style: const TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

var timerCountProvider = StateProvider((ref) => 20);
