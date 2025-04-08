import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../constants_and_extensions/assets.dart';
import '../../../global_controllers/google_ads_controller.dart';
import '../../../global_controllers/loader_controller.dart';
import '../../../global_controllers/theme_controller.dart';
import '../../widgets/app_bar_icon_widget.dart';
import '../../widgets/asset_image_widget.dart';
import '../../widgets/circle_widget.dart';
import '../connect_vpn_screen/connect_vpn_controller.dart';

class ServerLocationsScreen extends StatelessWidget {
  ServerLocationsScreen({super.key});

  final ThemeController _themeController = Get.find();
  final GoogleAdsController _googleAdsController = Get.find();
  final LoaderController _loaderController = Get.find();
  final ConnectVpnController _connectVpnController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            AppLocalizations.of(context)!.serverLocations,
            style: _themeController.headlineBoldTS,
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => _serverItem(
            context: context,
            index: index,
          ),
        ),
      );
    });
  }

  Widget _serverItem({
    required BuildContext context,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: GestureDetector(
        onTap: () {
          if (index == 0) {
            Get.back();
          } else {
            _loaderController.showLoader();
            _googleAdsController.loadRewardAd(onAdLoaded: (rewardedAd) {
              _loaderController.hideLoader();
              _googleAdsController.showRewardedAd(
                rewardedAd: rewardedAd,
                onUserEarnedReward: (_, __) {
                  _connectVpnController.setSelectedCountry(at: index);
                  Get.back();
                },
              );
            }, onAdFailedToLoad: (error) {
              _loaderController.hideLoader();
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: _themeController.backgroundColor3,
            boxShadow: [
              BoxShadow(
                color: _themeController.shadowColor,
                spreadRadius: 2,
                blurRadius: 6,
              )
            ],
          ),
          child: Row(
            children: [
              CircleWidget(
                size: 30,
                child: AssetImageWidget(
                  assetName: Assets().imageAssets.dummyCountryIcon2,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New York",
                      style: _themeController.captionMediumTS,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: AssetImageWidget(
                        assetName: Assets().imageAssets.signalIcon,
                        width: 10,
                        height: 10,
                        color: _themeController.themeBasedWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              AppBarIconWidget(
                iconSize: 20,
                internalPadding: 8,
                isTappable: false,
                child: AssetImageWidget(
                  assetName: Assets().imageAssets.switchIcon,
                  width: 10,
                  height: 10,
                  color: _themeController.themeBasedWhiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
