using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GlobalControll : MonoBehaviour
{
    public static GlobalControll Instance;

    public static bool isSound;
    public static bool isHaptic;
    public static string StartSceneName = "Game";
    public static int Coin;
    public static int Ticket;
    public static ScreenStage CurrentStage;
    public static int CurrentLevelIndex;
    public static int Hammer;
    public static int Hand;
    public static int Swap;

    private void Awake()
    {
        PlayerPrefs.SetInt("Coin", 1000);
        Coin = PlayerPrefs.GetInt("Coin", 0);
        Hammer = PlayerPrefs.GetInt("Hammer", 0);
        Hand = PlayerPrefs.GetInt("Hand", 0);
        Swap = PlayerPrefs.GetInt("Swap", 0);
        Ticket = PlayerPrefs.GetInt("Ticket", 0);
        int i = PlayerPrefs.GetInt("IsSoundOn", 1);
        if (i == 1)
            isSound = true;
        else isSound = false;
        i = PlayerPrefs.GetInt("isHapticOn", 1);
        if (i == 1)
            isHaptic = true;
        else isHaptic = false;
        Instance = this;
        LeanTween.init(1000);
        Application.targetFrameRate = 60;
        CurrentStage = ScreenStage.None;
        CurrentLevelIndex = PlayerPrefs.GetInt("CurrentLevelIndex", 0);
    }
}

