using System;
using System.Text;
using UnityEngine;
using UnityEngine.SocialPlatforms;

public class LeaderboardController : MonoBehaviour
{
    public static LeaderboardController Instance { get; set; }

    GameData globalData
    {
        get
        {
            if (DataController.Instance != null)
            {
                return DataController.Instance.Data;
            }
            return null;
        }
        set
        {
            if (DataController.Instance != null)
            {
                DataController.Instance.Data = value;
            }
        }
    }

    public Action OnDataLoaded { get; set; }

    bool isSaving;
    bool isCloudDataLoaded = false;

    private void Awake()
    {
        Instance = this;
    }

#if UNITY_ANDROID || UNITY_IOS
    private void Start()
    {
        SignIn(null);
    }

    public void SignIn(Action callback)
    {
        Social.localUser.Authenticate((bool success) =>
        {
            if (success)
            {
                if (callback != null)
                {
                    // Successful sign in!
                    callback();
                }
                PlayerPrefs.SetInt("Logged", 1);
            }
        });
    }
#endif
}