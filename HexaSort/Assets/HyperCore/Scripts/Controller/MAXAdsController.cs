//using AppsFlyerSDK;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class MAXAdsController : Singleton<MAXAdsController>
{
    //[SerializeField] private string sdkKey;
    //[SerializeField] string adUnitIdBanner = "";
    //[SerializeField] string adUnitIdInter = "";
    //[SerializeField] string adUnitIdReward = "";
    //[SerializeField] string adUnitIdMREC = "";
    //public bool UseAOA;
    //[SerializeField] string adUnitIdAOA = "";
    //public float TimeShowAds = 20f;
    //private int interShowTime = 0;

    //int retryAttemptInter;
    //int retryAttemptReward;
    //private UnityEvent onRewarded;
    //private float lastTimeShowAd;
    //private Action onAOADismissed;
    //public bool isShowingAOA = false;

    //private void Start()
    //{
    //    MaxSdkCallbacks.Interstitial.OnAdRevenuePaidEvent += OnAdRevenuePaidEvent;
    //    MaxSdkCallbacks.Rewarded.OnAdRevenuePaidEvent += OnAdRevenuePaidEvent;
    //    MaxSdkCallbacks.Banner.OnAdRevenuePaidEvent += OnAdRevenuePaidEvent;
    //    MaxSdkCallbacks.MRec.OnAdRevenuePaidEvent += OnAdRevenuePaidEvent;
    //    MaxSdkCallbacks.OnSdkInitializedEvent += (MaxSdkBase.SdkConfiguration sdkConfiguration) =>
    //    {
    //        // AppLovin SDK is initialized, start loading ads
    //        if (!GlobalController.Instance.ForTesting)
    //        {
    //            LoadAds();
    //        }
    //        MaxSdkCallbacks.AppOpen.OnAdHiddenEvent += OnAppOpenDismissedEvent;
    //    };

    //    MaxSdk.SetSdkKey(sdkKey);
    //    MaxSdk.InitializeSdk();
    //}

    //public void OnAppOpenDismissedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    MaxSdk.LoadAppOpenAd(adUnitIdAOA);
    //    onAOADismissed?.Invoke();
    //    isShowingAOA = false;
    //}

    //public void InitializeMRecAds()
    //{
    //    // MRECs are sized to 300x250 on phones and tablets
    //    MaxSdk.CreateMRec(adUnitIdMREC, MaxSdkBase.AdViewPosition.BottomCenter);

    //    MaxSdkCallbacks.MRec.OnAdLoadedEvent += OnMRecAdLoadedEvent;
    //    MaxSdkCallbacks.MRec.OnAdLoadFailedEvent += OnMRecAdLoadFailedEvent;
    //    MaxSdkCallbacks.MRec.OnAdClickedEvent += OnMRecAdClickedEvent;
    //    MaxSdkCallbacks.MRec.OnAdRevenuePaidEvent += OnMRecAdRevenuePaidEvent;
    //    MaxSdkCallbacks.MRec.OnAdExpandedEvent += OnMRecAdExpandedEvent;
    //    MaxSdkCallbacks.MRec.OnAdCollapsedEvent += OnMRecAdCollapsedEvent;
    //}

    //public void OnMRecAdLoadedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    AppsflyerController.Instance.LogEvent("af_mrec_successfullyloaded");
    //    AnalyticsController.Instance.LogCustomEvent("ad_mrec_load", "placement", adInfo.Placement);
    //}

    //public void OnMRecAdLoadFailedEvent(string adUnitId, MaxSdkBase.ErrorInfo error) { }

    //public void OnMRecAdClickedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo) { }

    //public void OnMRecAdRevenuePaidEvent(string adUnitId, MaxSdkBase.AdInfo adInfo) { }

    //public void OnMRecAdExpandedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    AppsflyerController.Instance.LogEvent("af_mrec_displayed");
    //    AnalyticsController.Instance.LogCustomEvent("ad_mrec_show", "placement", adInfo.Placement);
    //}

    //public void OnMRecAdCollapsedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo) { }

    //public bool IsRewardReady()
    //{
    //    return MaxSdk.IsRewardedAdReady(adUnitIdReward);
    //}

    //public void ShowMREC()
    //{
    //    HideBanner();
    //    AppsflyerController.Instance.LogEvent("af_mrec_logicgame");
    //    MaxSdk.ShowMRec(adUnitIdMREC);
    //}

    //public void HideMREC()
    //{
    //    MaxSdk.HideMRec(adUnitIdMREC);
    //}

    //public void OnApplicationPause(bool paused)
    //{
    //    // Display the app open ad when the app is foregrounded
    //    if (!paused && UseAOA)
    //    {
    //        ShowAOA(null);
    //    }
    //}

    //public bool ShowAOA(Action onClose)
    //{
    //    if (GlobalController.Instance.ForTesting || !MaxSdk.IsAppOpenAdReady(adUnitIdAOA) || isShowingAOA || !UseAOA || IsShowingFullscreenAds())
    //    {
    //        return false;
    //    }
    //    if (MaxSdk.IsAppOpenAdReady(adUnitIdAOA))
    //    {
    //        MaxSdk.ShowAppOpenAd(adUnitIdAOA);
    //        isShowingAOA = true;
    //        onAOADismissed = onClose;
    //    }
    //    else
    //    {
    //        MaxSdk.LoadAppOpenAd(adUnitIdAOA);
    //    }
    //    return true;
    //}

    //private void OnAdRevenuePaidEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    if (adInfo != null)
    //    {
    //        double revenue = adInfo.Revenue;
    //        string countryCode = MaxSdk.GetSdkConfiguration().CountryCode; // "US" for the United States, etc - Note: Do not confuse this with currency code which is "USD" in most cases!
    //        string networkName = adInfo.NetworkName; // Display name of the network that showed the ad (e.g. "AdColony")
    //        string adUnitIdentifier = adInfo.AdUnitIdentifier; // The MAX Ad Unit ID
    //        string placement = adInfo.Placement; // The placement this ad's postbacks are tied to
    //        Firebase.Analytics.Parameter[] AdParameters = {
    //          new Firebase.Analytics.Parameter("ad_platform", "max"),
    //          new Firebase.Analytics.Parameter("ad_source", networkName),
    //          new Firebase.Analytics.Parameter("ad_unit_name", adUnitIdentifier),
    //          new Firebase.Analytics.Parameter("ad_format", placement),
    //          new Firebase.Analytics.Parameter("currency","USD"),
    //          new Firebase.Analytics.Parameter("country", countryCode),
    //          new Firebase.Analytics.Parameter("value", revenue)
    //        };
    //        Firebase.Analytics.FirebaseAnalytics.LogEvent("ad_impression", AdParameters);
    //        Firebase.Analytics.FirebaseAnalytics.LogEvent("ad_impression_abi", AdParameters);

    //        Dictionary<string, string> dic = new Dictionary<string, string>();
    //        dic.Add(AFAdRevenueEvent.COUNTRY, countryCode);
    //        dic.Add(AFAdRevenueEvent.AD_UNIT, adUnitIdentifier);
    //        dic.Add(AFAdRevenueEvent.AD_TYPE, adInfo.AdFormat);
    //        dic.Add(AFAdRevenueEvent.PLACEMENT, placement);
    //        AppsFlyerAdRevenue.logAdRevenue("max", AppsFlyerAdRevenueMediationNetworkType.AppsFlyerAdRevenueMediationNetworkTypeApplovinMax, revenue, "USD", dic);
    //    }
    //}

    //public void ShowInter()
    //{
    //    //if (GoogleAdsController.Instance != null && GoogleAdsController.Instance.isShowingAOAAd)
    //    //{
    //    //    return;
    //    //}
    //    if (isShowingAOA)
    //    {
    //        return;
    //    }
    //    interShowTime++;
    //    if (Time.time - lastTimeShowAd >= TimeShowAds || interShowTime == 2)
    //    {
    //        interShowTime = 3;
    //        AppsflyerController.Instance.LogEvent("af_inters_logicgame");
    //        if (MaxSdk.IsInterstitialReady(adUnitIdInter))
    //        {
    //            lastTimeShowAd = Time.time;
    //            MaxSdk.ShowInterstitial(adUnitIdInter);
    //            isInterShowing = true;
    //        }
    //        else
    //        {
    //            LoadInterstitial();
    //        }
    //    }
    //    HideMREC();
    //}

    //public void ShowRewarded(UnityEvent callback)
    //{
    //    AppsflyerController.Instance.LogEvent("af_rewarded_logicgame");
    //    if (MaxSdk.IsRewardedAdReady(adUnitIdReward))
    //    {
    //        onRewarded = callback;
    //        MaxSdk.ShowRewardedAd(adUnitIdReward);
    //        isRewardShowing = true;
    //    }
    //}

    //public void ShowBanner()
    //{
    //    HideMREC();
    //    MaxSdk.ShowBanner(adUnitIdBanner);
    //}

    //public void HideBanner()
    //{
    //    MaxSdk.HideBanner(adUnitIdBanner);
    //}

    //private void LoadAds()
    //{
    //    InitializeInterstitialAds();
    //    InitializeRewardedAds();
    //    InitializeBannerAds();
    //    InitializeMRecAds();
    //    if (UseAOA)
    //    {
    //        MaxSdk.LoadAppOpenAd(adUnitIdAOA);
    //    }
    //}

    //[SerializeField] private float adHiddenDelay = 3f;
    //private bool isInterShowing;
    //public void InitializeInterstitialAds()
    //{
    //    // Attach callback
    //    MaxSdkCallbacks.Interstitial.OnAdLoadedEvent += OnInterstitialLoadedEvent;
    //    MaxSdkCallbacks.Interstitial.OnAdLoadFailedEvent += OnInterstitialLoadFailedEvent;
    //    MaxSdkCallbacks.Interstitial.OnAdDisplayedEvent += OnInterstitialDisplayedEvent;
    //    MaxSdkCallbacks.Interstitial.OnAdClickedEvent += OnInterstitialClickedEvent;
    //    MaxSdkCallbacks.Interstitial.OnAdHiddenEvent += OnInterstitialHiddenEvent;
    //    MaxSdkCallbacks.Interstitial.OnAdDisplayFailedEvent += OnInterstitialAdFailedToDisplayEvent;

    //    // Load the first interstitial
    //    LoadInterstitial();
    //}

    //private void LoadInterstitial()
    //{
    //    MaxSdk.LoadInterstitial(adUnitIdInter);
    //}

    //public bool IsShowingFullscreenAds()
    //{
    //    return isRewardShowing || isInterShowing;
    //}

    //private void OnInterstitialLoadedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    // Interstitial ad is ready for you to show. MaxSdk.IsInterstitialReady(adUnitId) now returns 'true'
    //    AppsflyerController.Instance.LogEvent("af_inters_successfullyloaded");
    //    AnalyticsController.Instance.LogCustomEvent("ad_inter_load", "placement", adInfo.Placement);

    //    // Reset retry attempt
    //    retryAttemptInter = 0;
    //}

    //private void OnInterstitialLoadFailedEvent(string adUnitId, MaxSdkBase.ErrorInfo errorInfo)
    //{
    //    // Interstitial ad failed to load 
    //    // AppLovin recommends that you retry with exponentially higher delays, up to a maximum delay (in this case 64 seconds)

    //    retryAttemptInter++;
    //    double retryDelay = Mathf.Pow(2, Mathf.Min(6, retryAttemptInter));

    //    AnalyticsController.Instance.LogCustomEvent("ad_inter_fail", "placement", errorInfo.Message);
    //    Invoke("LoadInterstitial", (float)retryDelay);
    //}

    //private void OnInterstitialDisplayedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    AppsflyerController.Instance.LogEvent("af_inters_displayed");
    //    AnalyticsController.Instance.LogCustomEvent("ad_inter_show", "placement", adInfo.Placement);
    //    isInterShowing = true;
    //}

    //private void OnInterstitialAdFailedToDisplayEvent(string adUnitId, MaxSdkBase.ErrorInfo errorInfo, MaxSdkBase.AdInfo adInfo)
    //{
    //    // Interstitial ad failed to display. AppLovin recommends that you load the next ad.
    //    LoadInterstitial();
    //    isInterShowing = false;
    //}

    //private void OnInterstitialClickedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    AnalyticsController.Instance.LogCustomEvent("ad_inter_click", "placement", adInfo.Placement);

    //}

    //private void OnInterstitialHiddenEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    // Interstitial ad is hidden. Pre-load the next ad.
    //    LoadInterstitial();
    //    StartCoroutine(CoFlagInterHidden());
    //}

    //IEnumerator CoFlagInterHidden()
    //{
    //    yield return new WaitForSeconds(adHiddenDelay);
    //    isInterShowing = false;
    //}

    ///// ------------------- REWARDED VIDEOS --------------------
    //private bool isRewardShowing;
    //public void InitializeRewardedAds()
    //{
    //    // Attach callback
    //    MaxSdkCallbacks.Rewarded.OnAdLoadedEvent += OnRewardedAdLoadedEvent;
    //    MaxSdkCallbacks.Rewarded.OnAdLoadFailedEvent += OnRewardedAdLoadFailedEvent;
    //    MaxSdkCallbacks.Rewarded.OnAdDisplayedEvent += OnRewardedAdDisplayedEvent;
    //    MaxSdkCallbacks.Rewarded.OnAdClickedEvent += OnRewardedAdClickedEvent;
    //    MaxSdkCallbacks.Rewarded.OnAdHiddenEvent += OnRewardedAdHiddenEvent;
    //    MaxSdkCallbacks.Rewarded.OnAdDisplayFailedEvent += OnRewardedAdFailedToDisplayEvent;
    //    MaxSdkCallbacks.Rewarded.OnAdReceivedRewardEvent += OnRewardedAdReceivedRewardEvent;

    //    // Load the first rewarded ad
    //    LoadRewardedAd();
    //}

    //private void LoadRewardedAd()
    //{
    //    MaxSdk.LoadRewardedAd(adUnitIdReward);
    //}

    //private void OnRewardedAdLoadedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    // Rewarded ad is ready for you to show. MaxSdk.IsRewardedAdReady(adUnitId) now returns 'true'.
    //    AppsflyerController.Instance.LogEvent("af_rewarded_successfullyloaded");

    //    // Reset retry attempt
    //    retryAttemptReward = 0;
    //}

    //private void OnRewardedAdLoadFailedEvent(string adUnitId, MaxSdkBase.ErrorInfo errorInfo)
    //{
    //    // Rewarded ad failed to load 
    //    // AppLovin recommends that you retry with exponentially higher delays, up to a maximum delay (in this case 64 seconds).

    //    retryAttemptReward++;
    //    double retryDelay = Mathf.Pow(2, Mathf.Min(6, retryAttemptReward));
    //    AnalyticsController.Instance.LogCustomEvent("ad_reward_failed", "errormsg", errorInfo.Message);

    //    Invoke("LoadRewardedAd", (float)retryDelay);
    //}

    //private void OnRewardedAdDisplayedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    AppsflyerController.Instance.LogEvent("af_rewarded_displayed");
    //    AnalyticsController.Instance.LogCustomEvent("ad_reward_show", "placement", adInfo.Placement);
    //    isRewardShowing = true;
    //}

    //private void OnRewardedAdFailedToDisplayEvent(string adUnitId, MaxSdkBase.ErrorInfo errorInfo, MaxSdkBase.AdInfo adInfo)
    //{
    //    // Rewarded ad failed to display. AppLovin recommends that you load the next ad.
    //    LoadRewardedAd();
    //    isRewardShowing = false;
    //}

    //private void OnRewardedAdClickedEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    AnalyticsController.Instance.LogCustomEvent("ad_reward_click", "placement", adInfo.Placement);
    //}

    //private void OnRewardedAdHiddenEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    // Rewarded ad is hidden. Pre-load the next ad
    //    LoadRewardedAd();
    //    StartCoroutine(CoFlagRewardHidden());
    //}

    //IEnumerator CoFlagRewardHidden()
    //{
    //    yield return new WaitForSeconds(adHiddenDelay);
    //    isRewardShowing = false;
    //}

    //private void OnRewardedAdReceivedRewardEvent(string adUnitId, MaxSdk.Reward reward, MaxSdkBase.AdInfo adInfo)
    //{
    //    // The rewarded ad displayed and the user should receive the reward.
    //    onRewarded?.Invoke();
    //    AnalyticsController.Instance.LogCustomEvent("ad_reward_complete", "placement", adInfo.Placement);

    //}

    //private void OnRewardedAdRevenuePaidEvent(string adUnitId, MaxSdkBase.AdInfo adInfo)
    //{
    //    // Ad revenue paid. Use this callback to track user revenue.
    //}

    ///// ---------------------- BANNER -------------------------


    //public void InitializeBannerAds()
    //{
    //    // Banners are automatically sized to 320×50 on phones and 728×90 on tablets
    //    // You may call the utility method MaxSdkUtils.isTablet() to help with view sizing adjustments
    //    MaxSdk.CreateBanner(adUnitIdBanner, MaxSdkBase.BannerPosition.BottomCenter);
    //    MaxSdk.SetBannerWidth(adUnitIdBanner, 320);
    //    //MaxSdk.SetBannerExtraParameter(adUnitIdBanner, "adaptive_banner", "false");
    //    // Set background or background color for banners to be fully functional
    //    MaxSdk.SetBannerBackgroundColor(adUnitIdBanner, Color.white);
    //}
}
