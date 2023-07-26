import 'package:flutter/material.dart';
import 'package:google_ads_aso/helper/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AdHelper.adHelper.loadIntertitialAd();
    AdHelper.adHelper.loadBannerAd();
    AdHelper.adHelper.loadAppOpen();
    AdHelper.adHelper.loadRewardedAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Ads"),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: AdWidget(ad: AdHelper.adHelper.bannerAd!),
          ),
          ElevatedButton(
            onPressed: () {
              if (AdHelper.adHelper.interstitialAd != null) {
                AdHelper.adHelper.interstitialAd!.show();
                AdHelper.adHelper.loadIntertitialAd();
              }
            },
            child: const Text("Interstitial Ad"),
          ),
          ElevatedButton(
            onPressed: () {
              if (AdHelper.adHelper.appOpenAd != null) {
                AdHelper.adHelper.appOpenAd!.show();
                AdHelper.adHelper.loadAppOpen();
              }
            },
            child: const Text("App Open Ad"),
          ),
          ElevatedButton(
            onPressed: () {
              if (AdHelper.adHelper.rewardedAd != null) {
                AdHelper.adHelper.rewardedAd!.show(
                    onUserEarnedReward:
                        (AdWithoutView ad, RewardItem reward) {});
                AdHelper.adHelper.loadRewardedAd();
              }
            },
            child: const Text("Reward Ad"),
          )
        ],
      ),
    );
  }
}
