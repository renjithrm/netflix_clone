import 'package:get/get.dart';
import 'package:netflix_clone/model/model.dart';
import 'package:netflix_clone/services/api_manager.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class TrendingController extends GetxController {
  var trendingMovies = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      var movies = await ApiManager.getJson(ConstantString.topRatedUrl);
      if (movies != null) {
        trendingMovies.value = movies;
        print(trendingMovies.value.isEmpty);
      }
    } catch (e) {
      print(e);
    }
  }
}
