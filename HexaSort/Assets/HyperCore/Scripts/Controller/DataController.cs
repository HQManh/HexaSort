using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DataController : MonoBehaviour
{
    public static DataController Instance { get; set; }
    public GameData Data { get; set; }
    public GameStats Stats { get; set; }
    public int RateCancel { get; set; }
    public string LastLogin { get; set; }
    private string dataName = Constants.PackageName + ".gamedata";
    private string statsName = Constants.PackageName + ".gamestats";

    private void Awake()
    {
        Instance = this;
        LoadData();
    }

    public void LoadData()
    {
        // Data
        bool resetData = PlayerPrefs.GetInt("Data163920210421", 1) == 1;
        PlayerPrefs.SetInt("Data163920210421", 0);
        string data = resetData ? "" : PlayerPrefs.GetString(dataName, "");

        if (string.IsNullOrEmpty(data))
        {
            Data = new GameData()
            {
                SkinIDs = new List<int> { 0 },
                BestScore = 0,
                LevelIndex = 0,
                Coin = 0,
                SkinID = 0,
                SkinUnlockProgress = new List<int>(new int[AssetController.Instance.ListSkinSprites.Count]),
                ChestKey = 0,
                HeadsetID = 0,
                LastUnlockItemByLevel = -1,
                HeadsetIDs = new List<int>(),
                HeadsetUnlockProgress = new List<int>(new int[AssetController.Instance.ListHeadsetSprites.Count])
            };
        }
        else
        {
            Data = JsonUtility.FromJson<GameData>(data);
        }
        if (Data.SkinUnlockProgress.Count < AssetController.Instance.ListSkinSprites.Count)
        {
            Data.SkinUnlockProgress.AddRange(new List<int>(new int[AssetController.Instance.ListSkinSprites.Count - Data.SkinUnlockProgress.Count]));
        }
        for (int i = 0; i < Data.SkinUnlockProgress.Count; i++)
        {
            AssetController.Instance.UpdateSkinItemUC(i, Data.SkinUnlockProgress[i], false);
        }
        if (Data.HeadsetUnlockProgress.Count < AssetController.Instance.ListHeadsetSprites.Count)
        {
            Data.HeadsetUnlockProgress.AddRange(new List<int>(new int[AssetController.Instance.ListHeadsetSprites.Count - Data.HeadsetUnlockProgress.Count]));
        }
        for (int i = 0; i < Data.HeadsetUnlockProgress.Count; i++)
        {
            AssetController.Instance.UpdateWeaponItemUC(i, Data.HeadsetUnlockProgress[i], false);
        }
        // Stats
        string stats = PlayerPrefs.GetString(statsName, "");

        if (string.IsNullOrEmpty(stats))
        {
            Stats = new GameStats();
        }
        else
        {
            Stats = JsonUtility.FromJson<GameStats>(stats);
        }

        // Game settings
        RateCancel = PlayerPrefs.GetInt("CancelRateUs", 0);
        GlobalController.IsRated = PlayerPrefs.GetInt("RateUs", 0) == 1;
        GlobalController.IsTutDone = PlayerPrefs.GetInt("TutDone", 0) == 1;
        GlobalController.IsHapticOn = PlayerPrefs.GetInt("IsHapticOn", 1) == 1;
        GlobalController.IsSoundOn = PlayerPrefs.GetInt("IsSoundOn", 1) == 1;
        GlobalController.LoginDay = PlayerPrefs.GetInt("LoginDay", -1);
        LastLogin = PlayerPrefs.GetString("LastLogin", "");
        if (!string.IsNullOrEmpty(LastLogin))
        {
            if ((DateTime.Today - DateTime.Parse(LastLogin)).Days > 0)
            {
                GlobalController.IsDailyShown = false;
                PlayerPrefs.SetInt("LoginDay", (GlobalController.LoginDay + 1) % 7);
                PlayerPrefs.SetString("LastLogin", DateTime.Today.ToString());
            }
            else
            {
                GlobalController.IsDailyShown = true;
            }
        }
        else
        {
            PlayerPrefs.SetString("LastLogin", DateTime.Today.ToString());
        }

        // test
        //Data.Coin = 10000;
    }

    public void SaveData()
    {
        PlayerPrefs.SetString(dataName, JsonUtility.ToJson(Data));
        PlayerPrefs.Save();
    }

    public void SaveStats()
    {
        PlayerPrefs.SetString(statsName, JsonUtility.ToJson(Stats));
        PlayerPrefs.Save();
    }
}
