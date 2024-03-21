//using UnityEngine;
//using System.Collections;
//using GoogleMobileAds.Api;
//using System;
//using UnityEngine.Advertisements;
//using UnityEngine.Events;

//public class AdsController : MonoBehaviour
//{
//#if UNITY_ANDROID
//    private string adUnitBannerID = "ca-app-pub-9795669842658571/7304172892";
//    private string adUnitInterstitialID = "ca-app-pub-9795669842658571/3911722799";
//    private string adUnitRewardID = "ca-app-pub-9795669842658571/6785298145";
//#elif UNITY_IPHONE
//    private string adUnitBannerID = "ca-app-pub-9795669842658571/4474783787";
//    private string adUnitInterstitialID = "ca-app-pub-9795669842658571/5266843470";
//    private string adUnitRewardID = "ca-app-pub-9795669842658571/5596293769";
//#else
//    private string adUnitBannerID = "";
//    private string adUnitInterstitialID = "";
//#endif
//    private BannerView banner { get; set; }
//    private InterstitialAd interstitial { get; set; }
//    private RewardBasedVideoAd rewardVideo { get; set; }
//    private bool isBannerLoaded { get; set; }
//    public static AdsController Instance { get; set; }
//    public bool InterstitialLoaded { get; set; }
//    public bool BannerLoaded { get; set; }
//    private RewardBasedVideoAd rewardBasedVideo;

//    void Awake()
//    {
//        Instance = this;
//    }

//    void Start()
//    {
//        MobileAds.Initialize("ca-app-pub-9795669842658571~4322786339");
//        RequestRewardBasedVideo();
//        if (DataController.Instance.Stats.NoAds) return;
//        //LoadBanner();
//        LoadInterstitial();
//    }

//    public void LoadBanner()
//    {
//        // Create a 320x50 banner at the top of the screen.
//        banner = new BannerView(adUnitBannerID, AdSize.Banner, AdPosition.Bottom);
//        // Create an empty ad request.
//        AdRequest request = new AdRequest.Builder().Build();
//        // Load the banner with the request.
//        banner.LoadAd(request);

//        // Called when an ad request has successfully loaded.
//        banner.OnAdLoaded += HandleOnAdLoaded;
//        // Called when an ad request failed to load.
//        banner.OnAdFailedToLoad += HandleOnAdFailedToLoad;

//    }

//    public void HandleOnAdLoaded(object sender, EventArgs args)
//    {
//        // Handle the ad loaded event.
//        isBannerLoaded = true;
//        //HideBanner();
//    }


//    public void HandleOnAdFailedToLoad(object sender, AdFailedToLoadEventArgs args)
//    {
//        // Handle the ad failed to load event.
//        Debug.LogError("Ads failed to load");
//    }

//    public void ShowBanner()
//    {
//        if (!DataController.Instance.Stats.NoAds)
//        {
//            if (banner != null)
//            {
//                banner.Show();
//            }
//            else
//            {
//                LoadBanner();
//            }
//        }
//    }

//    public void HideBanner()
//    {
//        if (banner != null)
//        {
//            banner.Hide();
//        }
//    }

//    public void LoadInterstitial(bool showRightAway = false)
//    {
//        // Initialize an InterstitialAd.
//        interstitial = new InterstitialAd(adUnitInterstitialID);
//        // Create an empty ad request.
//        AdRequest request = new AdRequest.Builder().Build();
//        // Load the interstitial with the request.
//        interstitial.LoadAd(request);
//        interstitial.OnAdLoaded += HandleOnInterstitalLoaded;
//        interstitial.OnAdFailedToLoad += HandleOnInterstitalFailedToLoad;
//    }

//    public void HandleOnInterstitalLoaded(object sender, EventArgs args)
//    {
//        // Handle the ad loaded event.
//        InterstitialLoaded = true;
//    }

//    public void HandleOnInterstitalFailedToLoad(object sender, EventArgs args)
//    {
//        // Handle the ad loaded event.
//        InterstitialLoaded = false;
//    }

//    public void ShowInterstitial(float delay = 0)
//    {
//        if (!DataController.Instance.Stats.NoAds)
//        {
//            if (InterstitialLoaded)
//            {
//                StartCoroutine(cShowInterstitial(delay));
//            }
//            else
//            {
//                LoadInterstitial();
//            }
//        }
//    }

//    IEnumerator cShowInterstitial(float delay)
//    {
//        yield return new WaitForSeconds(delay);
//        interstitial.Show();
//    }

//    public void RequestRewardBasedVideo()
//    {
//        rewardBasedVideo = RewardBasedVideoAd.Instance;

//        AdRequest request = new AdRequest.Builder().Build();
//        rewardBasedVideo.LoadAd(request, adUnitRewardID);
//    }

//    EventHandler<Reward> onRewardHandler;
//    EventHandler<EventArgs> onCloseHandler;

//    public void ShowRewardAd(UnityEvent onComplete)
//    {
//        if (rewardBasedVideo.IsLoaded())
//        {
//            onRewardHandler = new EventHandler<Reward>((object sender, Reward target) =>
//            {
//                onComplete.Invoke();
//                RequestRewardBasedVideo();
//            });
//            onCloseHandler = new EventHandler<EventArgs>((object sender, EventArgs target) =>
//            {
//                RequestRewardBasedVideo();
//            });
//            //Subscribe to Ad event
//            rewardBasedVideo.OnAdRewarded -= onRewardHandler;
//            rewardBasedVideo.OnAdRewarded += onRewardHandler;
//            rewardBasedVideo.OnAdClosed -= onCloseHandler;
//            rewardBasedVideo.OnAdClosed += onCloseHandler;
//            rewardBasedVideo.Show();
//        }
//    }
//}
