import 'package:flutter/cupertino.dart';

abstract class AsyncChangeNotifier extends ChangeNotifier {
  bool _isLoading = false;
  bool _hasError = false;
  bool _disposed = false;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  /// Reset both hasError and error variable, then set the loading to true
  void startLoading() {
    _hasError = false;
    _isLoading = true;
    notifyListeners();
  }

  /// Stop loading and set isLoading variable to false
  void stopLoading(){
    _isLoading = false;
    notifyListeners();
  }

  /// Stop loading and set error state to true
  void setErrorState(String error) {
    _isLoading = false;
    _hasError = true;
    notifyListeners();
  }

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  void setError(bool value) {
    _hasError = value;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
