
import 'package:flutter/cupertino.dart';
import 'package:gc3bapp/config/locator.dart';
import 'package:gc3bapp/services/dialog_service.dart';
import 'package:gc3bapp/services/local_storage_service.dart';
import 'package:gc3bapp/services/router_service.dart';

enum UIState {idle, loading, done, error}
class BaseProvider with ChangeNotifier{

  final storage = locator<LocalStorageService>();
  final router = locator<RouterService>();
  final dialog = locator<DialogService>();


  UIState uiState = UIState.idle;

  get isLoading => uiState == UIState.loading;

  get done => uiState == UIState.done;

  get error => uiState == UIState.error;


  setUiState(UIState _uiState) {
    uiState = _uiState;
    notifyListeners();
  }


  updateUi(func) {
    func();
    notifyListeners();
  }
}