import 'package:get/get.dart';
import 'package:readsphere/helper/api.dart';

class MyController extends GetxController {
  final Api _api = Api();
  var data = [].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  void fetchData(String url) async {
    try {
      isLoading.value = true;
      data.value = await _api.getService(url: url);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void addItem(String url, Map<String, dynamic> body) async {
    try {
      isLoading.value = true;
      await _api.postService(url: url, body: body);
      fetchData(url);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void updateItem(String url, Map<String, dynamic> body) async {
    try {
      isLoading.value = true;
      await _api.putService(url: url, body: body);
      fetchData(url);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void deleteItem(String url) async {
    try {
      isLoading.value = true;
      await _api.deleteService(url: url);
      fetchData(url);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
