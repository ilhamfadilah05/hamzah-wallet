// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:get/get.dart';
import 'package:hamzah_wallet/app/helpers/endpoint.dart';
import 'package:hamzah_wallet/app/models/user_model.dart';
import 'package:hamzah_wallet/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:hamzah_wallet/app/services/firebase_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var dataUser = UserModel().obs;
  var isLoading = true.obs;

  void fetchDataUser() async {
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

  void init() {
    fetchDataUser();
    Get.put(TransactionsController().fetchDataTransaction());
  }
}
