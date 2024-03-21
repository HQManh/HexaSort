using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Threading.Tasks;
//using Firebase.Analytics;
//using Firebase.RemoteConfig;
//using GameAnalyticsSDK;
using System;

public class AnalyticsController : Singleton<AnalyticsController>
{

    //Firebase.DependencyStatus dependencyStatus = Firebase.DependencyStatus.UnavailableOther;
    //bool fetchDone = false;


    //void Start()
    //{
    //    Firebase.FirebaseApp.CheckAndFixDependenciesAsync().ContinueWith(task =>
    //    {
    //        dependencyStatus = task.Result;
    //        if (dependencyStatus == Firebase.DependencyStatus.Available)
    //        {
    //            FirebaseAnalytics.LogEvent(FirebaseAnalytics.EventAppOpen);
    //            FetchDataAsync();
    //        }
    //        else
    //        {
    //            Debug.LogError(
    //              "Could not resolve all Firebase dependencies: " + dependencyStatus);
    //        }
    //    });
    //    GameAnalytics.Initialize();
    //}

    //private void Update()
    //{
    //    if (fetchDone)
    //    {
    //        GetData();
    //        fetchDone = false;
    //    }
    //}

    //public void LogLevelStart(int level)
    //{
    //    GameAnalytics.NewProgressionEvent(GAProgressionStatus.Start, "level" + level.ToString("000"));
    //    FirebaseAnalytics.LogEvent(
    //        "level_start",
    //        new Parameter[] { new Parameter("level", level.ToString("000")) });
    //}

    //public void LogLevelSkip(int level, int playtime, int numAttempts)
    //{
    //    FirebaseAnalytics.LogEvent(
    //        "skip_" + level.ToString("000"),
    //        new Parameter[] { new Parameter("playtime", playtime), new Parameter("attempts", numAttempts) });
    //}

    //public void LogLevelComplete(int level, int playtime, int numAttempts)
    //{
    //    FirebaseAnalytics.LogEvent(
    //        "level_complete",
    //        new Parameter[] { new Parameter("level", level.ToString("000")), new Parameter("timeplayed", playtime) });
    //    FirebaseAnalytics.LogEvent(
    //        "complete_level_" + level.ToString("000"),
    //        new Parameter[] { new Parameter("level", level.ToString("000")), new Parameter("timeplayed", playtime) });
    //    GameAnalytics.NewProgressionEvent(GAProgressionStatus.Complete, "level" + level.ToString("000"));
    //}

    //public void LogLevelFail(int level, int playtime, int numAttempts)
    //{
    //    FirebaseAnalytics.LogEvent(
    //        "level_fail",
    //        new Parameter[] { new Parameter("level", level.ToString("000")), new Parameter("failcount", numAttempts) });
    //    FirebaseAnalytics.LogEvent(
    //        "fail_level_" + level.ToString("000"),
    //        new Parameter[] { new Parameter("level", level.ToString("000")), new Parameter("timeplayed", playtime) });
    //    GameAnalytics.NewProgressionEvent(GAProgressionStatus.Fail, "level" + level.ToString("000"));
    //}

    //public void LogUnlock(string name, int level)
    //{
    //    FirebaseAnalytics.LogEvent(
    //        name + level.ToString("000"));

    //    GameAnalytics.NewDesignEvent(name + level.ToString("000"));
    //}

    //public void LogCustomEvent(string name, string param, string value)
    //{
    //    FirebaseAnalytics.LogEvent(
    //        name,
    //        new Parameter[] { new Parameter(param, value) });
    //}

    //public void LogEarnCurrency(string currencyName, long value, string source)
    //{
    //    FirebaseAnalytics.LogEvent(
    //        "earn_virtual_currency",
    //        new Parameter[] {
    //            new Parameter("virtual_currency_name", currencyName),
    //            new Parameter("value", value),
    //            new Parameter("source", source)});
    //}

    //public void LogSpendCurrency(string currencyName, long value, string itemName)
    //{
    //    FirebaseAnalytics.LogEvent(
    //        "spend_virtual_currency",
    //        new Parameter[] {
    //            new Parameter("virtual_currency_name", currencyName),
    //            new Parameter("value", value),
    //            new Parameter("item_name", itemName)});
    //}

    //// Firebase
    //// Start a fetch request.
    //public Task FetchDataAsync()
    //{
    //    Debug.Log("Fetching data...");
    //    // FetchAsync only fetches new data if the current data is older than the provided
    //    // timespan.  Otherwise it assumes the data is "recent enough", and does nothing.
    //    // By default the timespan is 12 hours, and for production apps, this is a good
    //    // number.  For this example though, it's set to a timespan of zero, so that
    //    // changes in the console will always show up immediately.
    //    System.Threading.Tasks.Task fetchTask = Firebase.RemoteConfig.FirebaseRemoteConfig.DefaultInstance.FetchAsync(
    //        TimeSpan.Zero);
    //    return fetchTask.ContinueWith(FetchComplete);
    //}

    //void FetchComplete(Task fetchTask)
    //{
    //    if (fetchTask.IsCanceled)
    //    {
    //        Debug.Log("Fetch canceled.");
    //    }
    //    else if (fetchTask.IsFaulted)
    //    {
    //        Debug.Log("Fetch encountered an error.");
    //    }
    //    else if (fetchTask.IsCompleted)
    //    {
    //        Debug.Log("Fetch completed successfully!");
    //    }

    //    var info = Firebase.RemoteConfig.FirebaseRemoteConfig.DefaultInstance.Info;
    //    switch (info.LastFetchStatus)
    //    {
    //        case Firebase.RemoteConfig.LastFetchStatus.Success:
    //            Firebase.RemoteConfig.FirebaseRemoteConfig.DefaultInstance.FetchAndActivateAsync();
    //            fetchDone = true;
    //            Debug.Log("Call fetch done");
    //            break;
    //        case Firebase.RemoteConfig.LastFetchStatus.Failure:
    //            switch (info.LastFetchFailureReason)
    //            {
    //                case Firebase.RemoteConfig.FetchFailureReason.Error:
    //                    Debug.Log("Fetch failed for unknown reason");
    //                    break;
    //                case Firebase.RemoteConfig.FetchFailureReason.Throttled:
    //                    Debug.Log("Fetch throttled until " + info.ThrottledEndTime);
    //                    break;
    //            }
    //            break;
    //        case Firebase.RemoteConfig.LastFetchStatus.Pending:
    //            Debug.Log("Latest Fetch call still pending.");
    //            break;
    //    }
    //}

    //private void GetData()
    //{
    //    Dictionary<string, object> defaults = new Dictionary<string, object>();
    //    defaults.Add("inter_ads_interval", 30);
    //    FirebaseRemoteConfig.DefaultInstance.SetDefaultsAsync(defaults);
    //    MAXAdsController.Instance.TimeShowAds = FirebaseRemoteConfig.DefaultInstance.GetValue("inter_ads_interval").LongValue;
    //    //if (!GoogleAdsController.Instance.OverrideAOARemoteSetting)
    //    //{
    //    //    GoogleAdsController.Instance.AOAEnable = FirebaseRemoteConfig.DefaultInstance.GetValue("aoa_enable").BooleanValue;
    //    //    Debug.Log("Remote Config: aoa_enable is " + GoogleAdsController.Instance.AOAEnable);
    //    //    if (GoogleAdsController.Instance.IsInitialized && GoogleAdsController.Instance.AOAEnable)
    //    //    {
    //    //        GoogleAdsController.Instance.LoadAOAAd();
    //    //    }
    //    //}
    //}
}
