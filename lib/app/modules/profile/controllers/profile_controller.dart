// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:hamzah_wallet/app/helpers/endpoint.dart';
import 'package:hamzah_wallet/app/models/user_model.dart';
import 'package:hamzah_wallet/app/services/firebase_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var dataUser = UserModel().obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void init() {
    fetchDataUser();
  }

  void fetchDataUser() async {
    isLoading.value = true;
    SharedPreferences storage = await SharedPreferences.getInstance();
    if (storage.getString('idUser') != null) {
      var idUser = storage.getString('idUser');
      FirebaseServices()
          .fetchDataById(endpoint: EndpointFirebase.USER, id: idUser!)
          .then((value) {
        UserModel data =
            UserModel.fromJson(value!.id, value.data() as Map<String, dynamic>);
        dataUser.value = data;
        isLoading.value = false;
      });
    }
  }
}
