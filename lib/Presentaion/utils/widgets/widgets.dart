import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

drawerItem(VoidCallback callback, IconData iconData, String title) => InkWell(
      onTap: callback,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(
              iconData,
              color: Colors.green.shade800,
            ),
            const SizedBox(width: 10),
            Text(
              translate(title),
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );

profileItem(String title, String content, IconData icon) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: '',
                  label: Text(title),
                  prefixIcon: Icon(
                    icon,
                  ),
                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              initialValue: content,
              enabled: false,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

CachedNetworkImage imageLoader(String imageUrl) => CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.cover,
    errorWidget: (context, url, error) => imageErrorWidget());

imageBuilder(imageUrl) => CachedNetworkImageProvider(imageUrl,
    errorListener: (_) => imageErrorWidget());
Widget imageErrorWidget() => Image.asset(
      'assets/app_logo.png',
      fit: BoxFit.cover,
    );

Widget noOrders(BuildContext context) => Container(
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
    alignment: Alignment.center,
    height: context.heightPx,
    width: context.widthPx,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/app_logo.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          translate('no_running_orders'),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        )
      ],
    ));

errorToast(String msg) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);

successToast(String msg) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0);

loader() => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset('assets/loader.json',
              fit: BoxFit.cover, height: 120, width: 120),
        ),
        const Text(
          'Loading...',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
