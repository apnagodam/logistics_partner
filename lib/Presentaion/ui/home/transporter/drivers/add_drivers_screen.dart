import 'dart:io';

import 'package:ag_logistics_partner/Presentaion/utils/constants/color_constants.dart';
import 'package:ag_logistics_partner/Presentaion/utils/constants/string_constants.dart';
import 'package:ag_logistics_partner/Presentaion/utils/constants/style_constants.dart';
import 'package:ag_logistics_partner/Presentaion/utils/widgets/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TextEditingController driverNameController = TextEditingController();
TextEditingController driverPhoneController = TextEditingController();
TextEditingController driverEmailController = TextEditingController();
TextEditingController driverLicenseController = TextEditingController();
TextEditingController driverCityController = TextEditingController();
TextEditingController driverStateController = TextEditingController();
TextEditingController driverPincodeController = TextEditingController();
TextEditingController driverBankNameController = TextEditingController();
TextEditingController driverBankAccountNoController = TextEditingController();
TextEditingController driverBankIFSCController = TextEditingController();
TextEditingController driverPanCardNoController = TextEditingController();
TextEditingController driverAadharNoController = TextEditingController();

class AddDriversScreen extends ConsumerWidget {
  AddDriversScreen({super.key});

  ImagePicker imagePicker = ImagePicker();
  var selectState = "Select State";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Drivers",
            style: TextStyle(
                fontSize: Adaptive.sp(18), fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleTextStyle: const TextStyle(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const Pad(all: 10),
          child: driverFormLayout(context, ref),
        ));
  }

  driverFormLayout(BuildContext context, WidgetRef ref) => ListView(children: [
        TextFormField(
          controller: driverNameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text("Driver Name"),
              hintText: "Driver Name",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverPhoneController,
          textInputAction: TextInputAction.next,
          maxLength: 10,
          decoration: const InputDecoration(
              label: Text("Driver Phone"),
              hintText: "Driver Phone",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverEmailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text("Driver Email"),
              hintText: "Driver Email",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverLicenseController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text("Driver License number"),
              hintText: "Driver License number",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: context.widthPx,
          child: ElevatedButton(
              style: StyleConstants.buttonBordersStyle(
                  borderColor: ColorConstants.primaryColorWSP,
                  backgroundColor: Colors.white),
              onPressed: () async {
                await imagePicker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) async {
                  if (value != null) {
                    ref.watch(licenseImage.notifier).state = File(value.path);
                  }
                });
              },
              child: Text(
                "Select license Image",
                style: StyleConstants.normalStyle(),
              )),
        ),
        if (ref.watch(licenseImage) != null)
          Image.file(ref.watch(licenseImage) ?? File(""))
        else
          SizedBox(),
        const SizedBox(
          height: 10,
        ),
        DropdownButton(
          // Initial Value
          value: ref.watch(stateProvider),

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: StringContants.states.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            ref.watch(stateProvider.notifier).state =
                newValue ?? "Select State";
          },
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverCityController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text("Select City"),
              hintText: "Select City",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverPincodeController,
          textInputAction: TextInputAction.next,
          maxLength: 6,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              label: Text("Enter Pincode"),
              hintText: "Enter Pincode",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverBankNameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text("Bank Name"),
              hintText: "Bank Name",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverBankAccountNoController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              label: Text("Bank Account Number"),
              hintText: "Bank Account Number",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverBankIFSCController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text("Bank IFSC code"),
              hintText: "Bank IFSC code",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverPanCardNoController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text("Pan card no"),
              hintText: "Pan card no",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: driverAadharNoController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text("Aadhar card no."),
              hintText: "Aadhar card no.",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: context.widthPx,
          child: ElevatedButton(
              style: StyleConstants.buttonBordersStyle(
                  borderColor: ColorConstants.primaryColorWSP,
                  backgroundColor: Colors.white),
              onPressed: () async {
                await imagePicker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) async {
                  if (value != null) {
                    ref.watch(panImage.notifier).state = File(value.path);
                  }
                });
              },
              child: Text(
                "Select Pan Image",
                style: StyleConstants.normalStyle(),
              )),
        ),
        if (ref.watch(panImage) != null)
          Image.file(ref.watch(panImage) ?? File(""))
        else
          SizedBox(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: context.widthPx,
          child: ElevatedButton(
              style: StyleConstants.buttonBordersStyle(
                  borderColor: ColorConstants.primaryColorWSP,
                  backgroundColor: Colors.white),
              onPressed: () async {
                await imagePicker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) async {
                  if (value != null) {
                    ref.watch(aadharImage.notifier).state = File(value.path);
                  }
                });
              },
              child: Text(
                "Select Aadhar Image",
                style: StyleConstants.normalStyle(),
              )),
        ),
        if (ref.watch(aadharImage) != null)
          Image.file(ref.watch(aadharImage) ?? File(""))
        else
          SizedBox(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: context.widthPx,
          child: ElevatedButton(
              style: StyleConstants.buttonBordersStyle(
                  borderColor: ColorConstants.primaryColorWSP,
                  backgroundColor: Colors.white),
              onPressed: () async {
                await imagePicker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) async {
                  if (value != null) {
                    ref.watch(chequeImage.notifier).state = File(value.path);
                  }
                });
              },
              child: Text(
                "Select Cheque/Passbook Image",
                style: StyleConstants.normalStyle(),
              )),
        ),
        if (ref.watch(chequeImage) != null)
          Image.file(ref.watch(chequeImage) ?? File(""))
        else
          SizedBox(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: context.widthPx,
          child: ElevatedButton(
              style: StyleConstants.buttonBordersStyle(
                  borderColor: ColorConstants.primaryColorWSP,
                  backgroundColor: Colors.white),
              onPressed: () async {
                await imagePicker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) async {
                  if (value != null) {
                    ref.watch(profileImage.notifier).state = File(value.path);
                  }
                });
              },
              child: Text(
                "Select Profile Image",
                style: StyleConstants.normalStyle(),
              )),
        ),
        if (ref.watch(profileImage) != null)
          Image.file(ref.watch(profileImage) ?? File(""))
        else
          SizedBox(),
        ElevatedButton(
            style: StyleConstants.buttonBordersStyle(
                borderColor: Colors.white,
                backgroundColor: ColorConstants.secondaryColorWSP),
            onPressed: () {
              if (driverNameController.text.toString().isEmpty) {
                errorToast("please input driver name");
              } else if (driverPhoneController.text.isEmpty ||
                  driverPhoneController.text.length != 10) {
                errorToast("please input proper driver phone");
              } else if (driverEmailController.text.isEmpty) {
                errorToast("please input driver email");
              } else if (driverLicenseController.text.isEmpty) {
                errorToast("please input driver license");
              } else if (driverCityController.text.isEmpty) {
                errorToast("please input driver city");
              } else if (driverPincodeController.text.isEmpty) {
                errorToast("please input driver pincode");
              } else if (driverBankNameController.text.isEmpty) {
                errorToast("please input driver bank name");
              } else if (driverBankAccountNoController.text.isEmpty) {
                errorToast("please input driver account number");
              } else if (driverBankIFSCController.text.isEmpty) {
                errorToast("please input driver bank ifsc");
              } else if (driverPanCardNoController.text.isEmpty) {
                errorToast("please input driver pan card number");
              } else if (driverAadharNoController.text.isEmpty) {
                errorToast("please input driver aadhar number");
              } else if (ref.watch(licenseImage) == null) {
                errorToast("please select license image");
              } else if (ref.watch(panImage) == null) {
                errorToast("please select pan card image");
              } else if (ref.watch(aadharImage) == null) {
                errorToast("please select aadhar card image");
              } else if (ref.watch(chequeImage) == null) {
                errorToast("please select cheque image");
              } else if (ref.watch(profileImage) == null) {
                errorToast("please select profile image");
              } else {
                successToast("Success");
              }
            },
            child: Text(
              "Submit",
              style: StyleConstants.buttonTextStyle(),
            ))
      ]);

  var stateProvider = StateProvider<String?>((ref) => null);

  var licenseImage = StateProvider<File?>((ref) => null);
  var panImage = StateProvider<File?>((ref) => null);
  var aadharImage = StateProvider<File?>((ref) => null);
  var chequeImage = StateProvider<File?>((ref) => null);
  var profileImage = StateProvider<File?>((ref) => null);
}
