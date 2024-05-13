import 'package:ag_logistics_partner/Domain/Rest/authentication/authentication_state.dart';
import 'package:ag_logistics_partner/Domain/providers/authentication/authentication_provider.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/WSP/wsp_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../utils/enums/enums.dart';
import '../../utils/shared_pref/shared_pref_provider.dart';
import '../../utils/validators/number_validator.dart';
import '../../utils/widgets/widgets.dart';
import 'otp_verfication_page.dart';

var phoneNumberController = TextEditingController();

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: DropdownMenu<LANG>(
              inputDecorationTheme: const InputDecorationTheme(
                  enabledBorder: null, disabledBorder: null),
              initialSelection: LANG.empty,
              // controller: colorController,
              // requestFocusOnTap is enabled/disabled by platforms when it is null.
              // On mobile platforms, this is false by default. Setting this to true will
              // trigger focus request on the text field and virtual keyboard will appear
              // afterward. On desktop platforms however, this defaults to true.
              requestFocusOnTap: false,
              label: Text(translate('select_language')),
              onSelected: (LANG? color) async {
                SharedPref().setLanguage(color?.identifier ?? 'en');

                await changeLocale(context, SharedPref().getLanguage());
              },
              dropdownMenuEntries:
                  LANG.values.map<DropdownMenuEntry<LANG>>((LANG color) {
                return DropdownMenuEntry<LANG>(
                  value: color,
                  label: color.lng,
                  enabled: true,
                );
              }).toList(),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/app_logo.png',
                fit: BoxFit.cover,
                height: context.heightPx / 5,
                color: Colors.green,
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      translate('loginCreateSugg'),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  onChanged: (text) {
                    if (text.length == 10 && text.isValidPhoneNumber) {
                      ref
                          .watch(numberValidationProvider)
                          .setStatus(NumberValidation.CORRECT);
                    } else if (text.length == 10 && !text.isValidPhoneNumber) {
                      context.scaffoldMessenger.showSnackBar(
                          const SnackBar(content: Text('Invalid Number')));
                    }
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      hintText: translate('phone_number'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    context.themeData.primaryColor),
                            onPressed: () async {
                              context.pushPage(WSPHomeScreen());
                              // if (ref
                              //         .watch(numberValidationProvider)
                              //         .getStatus() ==
                              //     NumberValidation.CORRECT) {
                              //   await ref
                              //       .watch(authenticationProvider)
                              //       .sendOtp(
                              //           phoneNumber:
                              //               phoneNumberController.text.toInt)
                              //       .then((value) {
                              //     if (value.status == "1") {
                              //       successToast(value.message.toString());
                              //       // if (value['token'] == null) {
                              //       //   ref.watch(tokenProvider.notifier).state =
                              //       //       value['otp'].toString();
                              //       // } else {
                              //       //   ref.watch(tokenProvider.notifier).state =
                              //       //       value['token'].toString();
                              //       // }
                              //       ref
                              //           .watch(otpStatusProvider.notifier)
                              //           .setOtpStatus(OtpStatus.SENT);
                              //
                              //       context.pushPage(OtpVerificationPage(
                              //         phoneNumber: phoneNumberController.text,
                              //       ));
                              //     } else {
                              //       errorToast(value.message.toString());
                              //     }
                              //   });
                              // }
                            },
                            child: Text(
                              translate(
                                'proceed_securely',
                              ),
                              style: const TextStyle(color: Colors.white),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      translate('agreetoTermCondition'),
                      textAlign: TextAlign.center,
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    // InkWell(
                    //   onTap: () => context.pushPage(const WebviewPage(
                    //       url: 'https://apnagodam.com/test/terms-conditions')),
                    //   child: Text(
                    //     "Terms and Condition",
                    //     style: TextStyle(
                    //         color: context.themeData.primaryColor,
                    //         decoration: TextDecoration.underline),
                    //   ),
                    // )
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

var otpProvider = StateProvider((ref) => '');
var tokenProvider = StateProvider((ref) => '');
