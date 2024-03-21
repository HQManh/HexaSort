using UnityEngine;
using UnityEngine.Events;
//using MoreMountains.NiceVibrations;

#if UNITY_IOS
using UnityEngine.iOS;
#elif UNITY_ANDROID
//using Google.Play.Review;
#endif

public class MissionSuccessEvent : UnityEvent<int> { }

public class GlobalController : MonoBehaviour
{
    public static GlobalController Instance { get; set; }
    public static Vector2 ScreenResolution = new Vector2(1080, 1920);
    public static float StageCameraSize = 5;
    public static Vector2 FixedStageResolution = new Vector2(1080, 1920);
    public static float ScreenRatio { get { return Screen.width / (float)Screen.height; } }

    public static bool IsTutDone { get; set; }
    public static bool IsHapticOn { get; set; }
    public static bool IsSoundOn { get; set; }
    public static bool IsMusicOn { get; set; }
    public static bool IsDailyShown { get; set; }
    public static int LoginDay { get; set; }
    public static bool IsRated { get; set; }
    public static int PlayTimes { get; set; }
    public static Vector2 ScreenSize
    {
        get
        {
            return new Vector2(Screen.width * StageCameraSize * 2 / Screen.height, StageCameraSize * 2);
        }
    }
    public static int TotalLoseTimes;
    public static int TotalDistance;
    public static int CurrentLevelIndex;
    public static int CurrentLevelInGame;
    public static string StartSceneName = "Game";
    public static int ReplayingLevel;
    public static int ReplayCount { get; internal set; }
    public static StageScreen CurrentStage { get; internal set; }

    public bool ForTesting = false;

    private void Awake()
    {
        Instance = this;
        // Re-adjust stage camera
        LeanTween.init(2000);
        Application.targetFrameRate = 60;
        //MMNViOS.iOSInitializeHaptics();
        StartSceneName = "Game";
        CurrentStage = StageScreen.Home;
    }

    private void Start()
    {
        if (DataController.Instance.Data.LevelIndex <= 0)
        {
            DataController.Instance.Data.LevelIndex = 1;
        }
        CurrentLevelIndex = DataController.Instance.Data.LevelIndex;
    }

    // Ads
    public void ShowBanner()
    {
        if (!DataController.Instance.Stats.NoAds && !ForTesting)
        {
            //MAXAdsController.Instance.ShowBanner();
        }
    }

    public void HideBanner()
    {
        //MAXAdsController.Instance.HideBanner();
    }

    public void ShowMREC()
    {
        if (!DataController.Instance.Stats.NoAds && !ForTesting)
        {
            //MAXAdsController.Instance.ShowMREC();
        }
    }

    public void ShowInterstitial()
    {
        if (!DataController.Instance.Stats.NoAds && !ForTesting)
        {
            //MAXAdsController.Instance.ShowInter();
        }
    }

    public void ShowRewardedVideo(UnityAction callback)
    {
        UnityEvent e = new UnityEvent();
        e.AddListener(callback);
#if UNITY_EDITOR || UNITY_STANDALONE
        e.Invoke();
#else
        if (ForTesting)
        {
            e.Invoke();
        }
        else
        {
            //MAXAdsController.Instance.ShowRewarded(e);
        }
#endif
    }

    // Social
    public void ShareScore(UnityEvent e)
    {
        //FacebookController.Instance.Share();
    }

    public void RateGame()
    {
        IsRated = true;
        PlayerPrefs.SetInt("RateGame", 1);
#if UNITY_IOS
        if (Device.RequestStoreReview())
        {
        }
        else
        {
        }
#elif UNITY_ANDROID
        //ReviewManager reviewManager = new ReviewManager();
        //var playReviewInfoAsyncOperation = reviewManager.RequestReviewFlow();

        //// define a callback after the preloading is done
        //playReviewInfoAsyncOperation.Completed += playReviewInfoAsync =>
        //{
        //    if (playReviewInfoAsync.Error == ReviewErrorCode.NoError)
        //    {
        //        // display the review prompt
        //        var playReviewInfo = playReviewInfoAsync.GetResult();
        //        reviewManager.LaunchReviewFlow(playReviewInfo);
        //    }
        //    else
        //    {
        //        // handle error when loading review prompt
        //    }
        //};
#endif
    }

    public void MoreGames()
    {
    }

    public void ShowLeaderboard()
    {
        if (Social.localUser.authenticated)
        {
            Social.ShowLeaderboardUI();
        }
        else
        {
            //GoogleServiceController.Instance.SignIn(Social.ShowLeaderboardUI);
        }
    }

    public static void LikePageInstagram(MissionSuccessEvent e)
    {
        // on success
        if (e != null)
        {
            e.Invoke(0);
        }
    }

    public static void FollowTwitter(MissionSuccessEvent e)
    {
        // on success
        if (e != null)
        {
            e.Invoke(1);
        }
    }

    public static void SubscribeYoutube(MissionSuccessEvent e)
    {
        // on success
        if (e != null)
        {
            e.Invoke(2);
        }
    }

    public static void LikePageFacebook(MissionSuccessEvent e)
    {
        // on success
        if (e != null)
        {
            e.Invoke(3);
        }
    }

    // IAP
    //    public void PurchaseDiamond(DiamondPackID value, IAPDiamondPackEvent e)
    //    {

    //#if UNITY_EDITOR || UNITY_STANDALONE
    //        e.Invoke(value);
    //#else
    //        IAPController.Instance.BuyDiamondPack(value, e);
    //#endif
    //    }

    public void PurchaseNoAds(UnityEvent e)
    {
#if UNITY_EDITOR || UNITY_STANDALONE
        e.Invoke();
#else

        //IAPController.Instance.BuyNoAds(e);
#endif
    }

    public void RestorePurchase(UnityEvent e)
    {
        //IAPController.Instance.RestorePurchases();
    }
}
