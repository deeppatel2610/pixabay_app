import 'package:flutter/material.dart';
import 'package:pixabay_app/helper/api_helper.dart';

import '../model/pixabay_model.dart';

class HomeProvider extends ChangeNotifier {
  PixabayModel? pixabayModel;

  Future<void> fetchPhoto() async {
    var json = await ApiHelper.apiHelper.fetchApiData();
    pixabayModel = PixabayModel.fromJson(json);
    notifyListeners();
  }

  Future<void> fetchSearch(String search)
  async {
    Map json = await ApiHelper.apiHelper.searchApi(search);
    pixabayModel = PixabayModel.fromJson(json);
    notifyListeners();
  }


  HomeProvider() {
    fetchPhoto();
  }
}
