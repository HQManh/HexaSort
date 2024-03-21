//using System.Collections;
//using System.Collections.Generic;
//using UnityEngine;
//using Facebook.Unity;
//using System;

//public class FacebookController : MonoBehaviour
//{
//    public static FacebookController Instance { get; set; }
//    private WWWForm wwwForm;
//    private FacebookDelegate<IGraphResult> shareScreenShotCallback;
//    private string appUrl;
//    private string appName;
//    private string sharingContent;

//    // Awake function from Unity's MonoBehavior
//    void Start()
//    {
//        Instance = this;
//        if (!FB.IsInitialized)
//        {
//            // Initialize the Facebook SDK
//            FB.Init(InitCallback, OnHideUnity);
//        }
//        else
//        {
//            // Already initialized, signal an app activation App Event
//            FB.ActivateApp();
//        }
//    }

//    public void Login()
//    {
//        var perms = new List<string>() { "public_profile", "email", "user_friends" };
//        FB.LogInWithReadPermissions(perms, AuthCallback);
//    }

//    public void Share()
//    {
//        FB.ShareLink(
//            new Uri(appUrl),
//            contentTitle: appName,
//            contentDescription: sharingContent,
//            callback: ShareCallback
//        );
//    }

//    public void LogAchieveLevelEvent(string level)
//    {
//        var parameters = new Dictionary<string, object>();
//        parameters[AppEventParameterName.Level] = level;
//        FB.LogAppEvent(
//            AppEventName.AchievedLevel,
//            parameters: parameters
//        );
//    }

//    public void LogCustomizedEvent(string eventName, string eventParam, string eventValue)
//    {
//        var parameters = new Dictionary<string, object>();
//        parameters[eventParam] = eventValue;
//        FB.LogAppEvent(
//            eventName,
//            parameters: parameters
//        );
//    }

//    public void ShareScreenShot(byte[] data, FacebookDelegate<IGraphResult> callback)
//    {
//        shareScreenShotCallback = callback;
//        wwwForm = new WWWForm();
//        wwwForm.AddBinaryData("image", data, "InteractiveConsole.png");
//        //if (FB.IsLoggedIn)
//        //{
//        //    FB.API("me/photos", HttpMethod.POST, callback, wwwForm);
//        //}
//        //else
//        //{
//        FB.LogInWithPublishPermissions(new List<string>() { "publish_actions" }, LoginCallback);
//        //var perms = new List<string>() { "public_profile", "email", "user_friends" };
//        //FB.LogInWithReadPermissions(perms, LoginCallback);
//        //}
//    }

//    private void LoginCallback(ILoginResult result)
//    {
//        FB.API("me/photos", HttpMethod.POST, shareScreenShotCallback, wwwForm);
//    }

//    private void ShareCallback(IShareResult result)
//    {
//        if (result.Cancelled || !String.IsNullOrEmpty(result.Error))
//        {
//            Debug.Log("ShareLink Error: " + result.Error);
//        }
//        else if (!String.IsNullOrEmpty(result.PostId))
//        {
//            // Print post identifier of the shared content
//            Debug.Log(result.PostId);
//        }
//        else
//        {
//            // Share succeeded without postID
//            Debug.Log("ShareLink success!");
//        }
//    }

//    private void AuthCallback(ILoginResult result)
//    {
//        if (FB.IsLoggedIn)
//        {
//            // AccessToken class will have session details
//            var aToken = Facebook.Unity.AccessToken.CurrentAccessToken;
//            // Print current access token's User ID
//            Debug.Log(aToken.UserId);
//            // Print current access token's granted permissions
//            foreach (string perm in aToken.Permissions)
//            {
//                Debug.Log(perm);
//            }
//        }
//        else
//        {
//            Debug.Log("User cancelled login");
//        }
//    }

//    private void InitCallback()
//    {
//        if (FB.IsInitialized)
//        {
//            // Signal an app activation App Event
//            FB.ActivateApp();
//            // Continue with Facebook SDK
//            // ....
//        }
//        else
//        {
//            Debug.LogWarning("Failed to Initialize the Facebook SDK");
//        }
//    }

//    private void OnHideUnity(bool isGameShown)
//    {
//        if (!isGameShown)
//        {
//            // Pause the game - we will need to hide
//            Time.timeScale = 0;
//        }
//        else
//        {
//            // Resume the game - we're getting focus again
//            Time.timeScale = 1;
//        }
//    }
//}
