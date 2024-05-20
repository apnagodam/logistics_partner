import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddMoneyScreen extends ConsumerWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: Pad(all: 10),
        child: ColumnSuper(
          alignment: Alignment.center,
          children: [
            Text("Add Money",
                style: TextStyle(
                    fontSize: Adaptive.sp(22), fontWeight: FontWeight.w700)),
            Text("Available Balance: \$3500",
                style: TextStyle(
                    fontSize: Adaptive.sp(22),
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Center(
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Enter Amount')),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(
                        color: context.themeData.primaryColor)),
                onPressed: () {},
                child: Text("Submit"))
          ],
        ),
      )),
    );
  }
}
