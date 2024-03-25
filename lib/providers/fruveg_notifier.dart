
import 'package:client_mob/models/fruveg_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FruVegNotifier extends StateNotifier<FruVegModel>{
  FruVegNotifier():super(FruVegModel(id: 0, name: 'Unknown'));

  

}