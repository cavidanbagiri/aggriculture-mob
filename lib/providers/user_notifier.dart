
import 'package:client_mob/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserModel>{
  UserNotifier():super(UserModel(id: 0, username: 'unknown', email: 'unknown'));

  void updateUser(id, username, email){
    state = UserModel(id: id, username: username, email: email);
  }

}