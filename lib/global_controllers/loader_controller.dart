import 'package:get/get.dart';

/// Initialised in [MyApp]
class LoaderController extends GetxController {
  final _showLoader = false.obs;
  final _hideLoaderAnimationInProgress = false.obs;

  bool get shouldShowLoader => _showLoader.value;
  bool get hideLoaderAnimationInProgress =>
      _hideLoaderAnimationInProgress.value;

  void showLoader() {
    _showLoader.value = true;
  }

  void hideLoader() {
    if (_showLoader.value) {
      setHideLoaderAnimationInProgress(to: true);
      _showLoader.value = false;
    }
  }

  void setHideLoaderAnimationInProgress({required bool to}) {
    _hideLoaderAnimationInProgress.value = to;
  }
}
