import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  AdHelper._();

  static final AdHelper adHelper = AdHelper._();

  InterstitialAd? interstitialAd;

  void loadIntertitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (val) {
          interstitialAd = val;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  BannerAd? bannerAd;

  void loadBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(),
      request: AdRequest(),
    );

    bannerAd!.load();
  }

  AppOpenAd? appOpenAd;

  void loadAppOpen() {
    AppOpenAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/3419835294',
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (val) {
            appOpenAd = val;
          },
          onAdFailedToLoad: (error) {}),
      orientation: AppOpenAd.orientationPortrait,
    );
  }

  RewardedAd? rewardedAd;

  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (val) {
          rewardedAd = val;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }
}
