import 'dart:async';

import 'package:ag_logistics_partner/Domain/providers/dio/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'location_state.dart';
part 'location_service.g.dart';

@riverpod
class LocationService extends _$LocationService {
  @override
  FutureOr<LocationState> build() async {
    ///listen to changes in location service, so we can react by getting location
    ref.listen(locationServiceStreamPod, (previous, next) {
      if (next is AsyncData) {
        getLocation();
      }
    });

    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    final permissionState = await Geolocator.checkPermission();

    return IntialLocationState(
      isServiceEnabled: isServiceEnabled,
      permissionState: permissionState,
    );
  }

  Future<void> getLocation() async {
    state = await AsyncValue.guard(() async {
      final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      final permissionState = await Geolocator.checkPermission();

      if (permissionState == LocationPermission.always ||
          permissionState == LocationPermission.whileInUse) {
        state = AsyncData(
          LoadingLocationState(
            isServiceEnabled: isServiceEnabled,
            permissionState: permissionState,
          ),
        );
      } else {
        final newPermissionState = await Geolocator.requestPermission();
        state = AsyncData(
          LoadingLocationState(
            isServiceEnabled: isServiceEnabled,
            permissionState: newPermissionState,
          ),
        );
      }

      /// When service enabled , check permission
      if (isServiceEnabled == true) {
        /// When permission enabled, get Location Position
        if (permissionState == LocationPermission.always ||
            permissionState == LocationPermission.whileInUse) {
          final position = await Geolocator.getCurrentPosition();

          DioInstance(ref: ref).updateDio(
              {"lat": position.latitude, 'long': position.longitude});
          ref.watch(latProvider.notifier).state = position.latitude;
          ref.watch(longProvider.notifier).state = position.longitude;

          return LoadedLocationState(
            isServiceEnabled: isServiceEnabled,
            permissionState: permissionState,
            position: position,
          );
        }

        /// When permission is not not enabled
        ///
        return LocationErrorState(
          isServiceEnabled: isServiceEnabled,
          permissionState: permissionState,
          errorMessage: "Permission not enabled",
        );
      }

      /// If service is disabled change state to LocationErrorState

      return LocationErrorState(
        isServiceEnabled: isServiceEnabled,
        permissionState: permissionState,
        errorMessage: "Service disabled",
      );
    });
  }
}

final locationServiceStreamPod = StreamProvider.autoDispose<ServiceStatus>(
  (ref) {
    final stream = Geolocator.getServiceStatusStream()..listen((event) {});
    return stream;
  },
  name: 'locationEnableStreamPod',
);

var positionStreamProvider = StreamProvider<Position>((ref) =>
    Geolocator.getPositionStream(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.best)));

var latProvider = StateProvider((ref) => 0.0);
var longProvider = StateProvider((ref) => 0.0);
