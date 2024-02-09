
import 'package:ag_logistics_partner/Domain/providers/duty/duty_provider.dart';
import 'package:ag_logistics_partner/Domain/providers/orders/orders_provider.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/quality_check_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Domain/Rest/data/services/authentication/authentication_service.dart';
import '../../../Domain/Rest/data/services/auto_accept/auto_accept_notifier.dart';
import '../../../Domain/Rest/data/services/duty/duty_service.dart';
import '../../../Domain/Rest/data/services/location/location_service.dart';
import '../../../Domain/Rest/data/services/orders/running_orders_service.dart';
import '../../../Domain/providers/dio/dio_provider.dart';
import '../../utils/calculative_functions/functions.dart';
import '../../utils/shared_pref/shared_pref_provider.dart';
import '../../utils/validators/strings.dart';
import '../../utils/widgets/widgets.dart';
import '../authentication/login_page.dart';
import '../user/profile_page.dart';
import 'drawer/all_bookings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sharedPrefData = ref.read(sharedPrefProvider);

    return Scaffold(
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {},
          backgroundColor: context.themeData.primaryColor,
          child: const Icon(
            Icons.call,
            color: Colors.white,
          ),
        ),
        drawer: drawerLayout(context, ref),
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(translate('duty')),

                    ref.watch(dutyOnOffProvider(0)).when(
                        data: (data) => Switch(
                            value: ref.watch(dutyProvider.notifier).state,
                            onChanged: (value) {
                              ref.watch(dutyStatusProvider).getLpDutyStatus(status: ref.watch(dutyProvider.notifier).state==true?0:1).then((response) {
                                if (response['online_offline'].toString() == '1') {
                                  ref.watch(dutyProvider.notifier).state = true;
                                } else {
                                  ref.watch(dutyProvider.notifier).state = false;
                                }
                                successToast(response['message'].toString());
                              });

                            }),
                        error: (e, s) =>
                            Switch(value: false, onChanged: (value) {}),
                        loading: () =>
                            Switch(value: false, onChanged: (value) {})),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(translate('auto_accept')),
                      ref.watch(autoAcceptStatusProvider(0)).when(data:(status)=>Switch(
                          value:  ref.watch(autoAccetpProvider.notifier).state,
                          onChanged: (value) {
                           ref.watch(dutyStatusProvider).getAutoAcceptStatus( ref.watch(autoAccetpProvider.notifier).state==false?1:0).then((value) {
                             if (value['auto_accept'] == "1") {
                               ref.watch(autoAccetpProvider.notifier).state=true;
                             } else {
                               ref.watch(autoAccetpProvider.notifier).state=false;
                             }
                           });
                          }), error: (e,s)=> Switch(value: false, onChanged: (value) {}), loading: ()=> Switch(value: false, onChanged: (value) {}))

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: ref.watch(currentOrdersProvider).when(
            data: (orders) => Stack(
                  fit: StackFit.expand,
                  children: [
                    ref.watch(positionStreamProvider).when(
                        data: (position) {
                          ref.watch(dioProvider).updateDio({"lat":position.latitude,'long':position.longitude});

                          return SlidingUpPanel(
                              parallaxEnabled: true,
                              backdropEnabled: true,
                              borderRadius: BorderRadius.circular(10),
                              parallaxOffset: 0.7,
                              maxHeight: context.heightPx,
                              controller: ref.watch(panelController),
                              panelBuilder: () => SingleChildScrollView(
                                    child: SizedBox(
                                      height: context.heightPx,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        ref
                                                                .watch(
                                                                    userLatProvider
                                                                        .notifier)
                                                                .state =
                                                            const LatLng(
                                                                26.858889,
                                                                75.759598);

                                                        PolylinePoints
                                                            polylinePoints =
                                                            PolylinePoints();
                                                        PolylineResult result =
                                                            await polylinePoints
                                                                .getRouteBetweenCoordinates(
                                                          'AIzaSyCBSE9f-8MEb5om7pzPBJo1yt-9ObNYhA4',
                                                          // Your Google Map Key
                                                          PointLatLng(
                                                              position.latitude,
                                                              position
                                                                  .longitude),
                                                          PointLatLng(
                                                              ref
                                                                  .watch(
                                                                      userLatProvider)
                                                                  .latitude,
                                                              ref
                                                                  .watch(
                                                                      userLatProvider)
                                                                  .longitude),
                                                        );
                                                        if (result.points
                                                            .isNotEmpty) {
                                                          ref
                                                              .watch(
                                                                  polylineCoordinates
                                                                      .notifier)
                                                              .state
                                                              .clear();
                                                          result.points.forEach(
                                                              (PointLatLng
                                                                  point) {
                                                            ref
                                                                .watch(
                                                                    polylineCoordinates
                                                                        .notifier)
                                                                .state
                                                                .add(
                                                                  LatLng(
                                                                      point
                                                                          .latitude,
                                                                      point
                                                                          .longitude),
                                                                );
                                                          });
                                                        }

                                                        ref
                                                            .watch(
                                                                panelController)
                                                            .close();
                                                      },
                                                      icon: const Icon(
                                                          Icons.arrow_back)),
                                                  Expanded(
                                                      child: Text(
                                                    translate('Orders'),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  )),
                                                  const Expanded(
                                                      child: SizedBox())
                                                ],
                                              )),
                                          orders.orders?.data == null ||
                                                  orders.orders!.data!.isEmpty
                                              ? Expanded(
                                                  child: noOrders(context))
                                              : Expanded(
                                                  child: Wrap(
                                                  children: List.generate(
                                                      orders.orders!.data!
                                                              .length ??
                                                          0, (index) {
                                                    var e = orders
                                                        .orders!.data![index];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: ref
                                                          .watch(
                                                              positionStreamProvider)
                                                          .when(
                                                              data:
                                                                  (position) =>
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          ref.watch(userLatProvider.notifier).state = LatLng(
                                                                              double.parse(e.userLat.toString()),
                                                                              double.parse(e.userLong.toString()));

                                                                          PolylinePoints
                                                                              polylinePoints =
                                                                              PolylinePoints();
                                                                          PolylineResult
                                                                              result =
                                                                              await polylinePoints.getRouteBetweenCoordinates(
                                                                            'AIzaSyCBSE9f-8MEb5om7pzPBJo1yt-9ObNYhA4',
                                                                            // Your Google Map Key
                                                                            PointLatLng(position.latitude,
                                                                                position.longitude),
                                                                            PointLatLng(ref.watch(userLatProvider).latitude,
                                                                                ref.watch(userLatProvider).longitude),
                                                                          );
                                                                          if (result
                                                                              .points
                                                                              .isNotEmpty) {
                                                                            ref.watch(polylineCoordinates.notifier).state.clear();
                                                                            result.points.forEach((PointLatLng
                                                                                point) {
                                                                              ref.watch(polylineCoordinates.notifier).state.add(
                                                                                    LatLng(point.latitude, point.longitude),
                                                                                  );
                                                                            });
                                                                          }
                                                                        },
                                                                        child:
                                                                            Card(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Text(
                                                                                  translate('Order Information'),
                                                                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      height: 80,
                                                                                      width: 80,
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                        child: imageLoader("$IMAGE_BASE_URL_user_photo${e.profileImage}"),
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    Expanded(
                                                                                        child: Text(
                                                                                      "${e.buyerName}",
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                                                      maxLines: 2,
                                                                                    )),
                                                                                    IconButton(
                                                                                        onPressed: () {
                                                                                          ref.watch(distanceProvider.notifier).state = Functions().calculateDistance(position.latitude, position.longitude, double.parse(e.userLat ?? ""), double.parse(e.userLong ?? "")).toString();
                                                                                        },
                                                                                        icon: const Icon(LineAwesome.location_arrow_solid))
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Text(ref.watch(distanceProvider).toString() ?? ""),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), backgroundColor: MaterialStateProperty.resolveWith((states) => context.themeData.primaryColor)),
                                                                                    onPressed: () {
                                                                                      context.pushPage(QualityCheckPage(
                                                                                        commodityId: e.id,
                                                                                        orderId: e.id,
                                                                                        rate: int.parse(e.takeHomePrice ?? '0'),
                                                                                      ));
                                                                                    },
                                                                                    child: Text(
                                                                                      'Check quality',
                                                                                      style: TextStyle(color: Colors.white),
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                              error: (e, s) =>
                                                                  Container(),
                                                              loading: () =>
                                                                  loader()),
                                                    );
                                                  }),
                                                ))
                                        ],
                                      ),
                                    ),
                                  ),
                              body: GoogleMap(
                                myLocationButtonEnabled: true,
                                myLocationEnabled: true,
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      position.latitude, position.longitude),
                                  zoom: 14.4746,
                                ),
                                polylines: {
                                  Polyline(
                                    polylineId: const PolylineId("route"),
                                    points: ref.watch(polylineCoordinates),
                                    color: const Color(0xFF7B61FF),
                                    width: 6,
                                  )
                                },
                                onMapCreated: (GoogleMapController controller) {
                                  // _controller.complete(controller);
                                },
                                markers: {
                                  ref.watch(markerProvider(
                                      ref.watch(userLatProvider)))
                                },
                              ));
                        },
                        error: (e, s) => Container(),
                        loading: () => loader())
                  ],
                ),
            error: (e, s) => Container(
                  child: Text(e.toString() + s.toString()),
                ),
            loading: () => loader()));
  }

  Widget drawerLayout(BuildContext context, WidgetRef ref) {
    var sharedPrefData = ref.read(sharedPrefProvider);
    var user = sharedPrefData.getUserData().userDetails;
    return Drawer(
      child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: 10,
                  bottom: 20,
                  left: 10,
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 35,
                          minRadius: 10,
                          backgroundImage: imageBuilder(
                            "$IMAGE_BASE_URL${user!.imagePath}/${user.passportImage}",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                            visible: user.name != null,
                            child: Text(
                              ref
                                      .read(sharedPrefProvider)
                                      .getUserData()
                                      .userDetails
                                      ?.name ??
                                  user.phone ??
                                  "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "+91-${user.phone ?? ""}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Icon(
                      LineAwesome.language_solid,
                      color: Colors.green.shade800,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      translate('select_language'),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Expanded(child: SizedBox()),
                    Transform.scale(
                      scale: 0.7,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            translate('hindi'),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Switch(
                              thumbIcon: MaterialStateProperty.resolveWith(
                                  (states) => states
                                          .contains(MaterialState.selected)
                                      ? const Icon(LineAwesome.language_solid)
                                      : const Icon(Icons.language_rounded)),
                              value: ref.watch(languageChangeprovider),
                              overlayColor: MaterialStateProperty.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.selected)
                                          ? context.themeData.primaryColor
                                          : Colors.amberAccent),
                              inactiveThumbColor: Colors.white,
                              trackColor: MaterialStateProperty.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.selected)
                                          ? context.themeData.primaryColor
                                          : Colors.amberAccent),
                              onChanged: (value) async {
                                ref
                                    .watch(languageChangeprovider.notifier)
                                    .state = value;

                                await changeLocale(
                                    context, value == true ? 'en' : 'hi');

                                await ref
                                    .watch(sharedPrefProvider)
                                    .setLanguage(value == true ? 'en' : 'hi');
                              }),
                          Text(
                            translate('english'),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              drawerItem(() {
                ref.invalidate(runningOrdersServiceProvider);
              }, LineAwesome.air_freshener_solid, 'refresh'),
              const Divider(),
              drawerItem(() {
                context.pushPage(const AllBookingsPage());
              }, LineAwesome.calendar_check, 'bookings'),
              const Divider(),
              drawerItem(() {}, LineAwesome.user_plus_solid, 'vendor_add'),
              const Divider(),
              drawerItem(() {}, LineAwesome.truck_moving_solid, 'trip_start'),
              const Divider(),
              drawerItem(() {}, LineAwesome.clipboard_check_solid, 'order'),
              const Divider(),
              drawerItem(
                  () {}, LineAwesome.clipboard_list_solid, 'all_trip_list'),
              const Divider(),
              drawerItem(() {
                context.pushPage(const Profilepage());
              }, LineAwesome.user_circle, 'my_profile'),
              const Divider(),
              drawerItem(() async {
                await ref
                    .watch(authenticationServiceProvider(9001155788).notifier)
                    .logoutUser()
                    .then(
                        (value) => context.pAndRemoveUntil(const LoginPage()));
              }, LineAwesome.power_off_solid, 'logout'),
            ],
          )),
    );
  }
}

var dutyProvider = StateProvider((ref) => false);
var autoAccetpProvider = StateProvider((ref) => false);
var languageChangeprovider = StateProvider((ref) =>
    ref.watch(sharedPrefProvider).getLanguage() == 'en' ? true : false);

var panelController = StateProvider((ref) => PanelController());

var polylineCoordinates = StateProvider<List<LatLng>>((ref) => []);
var userLatProvider = StateProvider((ref) => const LatLng(0.000000, 0.000000));
var markerProvider = StateProvider.family((ref, LatLng latLng) => Marker(
    markerId:
        MarkerId(ref.watch(userLatProvider).latitude.toString() ?? "00000"),
    position: latLng));
