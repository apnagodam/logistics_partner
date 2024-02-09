import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoAcceptNotifier extends StateNotifier<bool> {
  AutoAcceptNotifier() : super(false);
   getStatus()=>state;
   setStatus(bool status){
  state = status;
  }
}
var autoAcceptProvider = StateProvider((ref) => AutoAcceptNotifier());