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
    public static ScreenStage CurrentStage;
    public static int CurrentLevelIndex;
    public static int Hammer;
    public static int Hand;
    public static int Swap;

    private void Awake()
    {
        Coin = PlayerPrefs.GetInt("Coin", 0);
        Hammer = PlayerPrefs.GetInt("Hammer", 0);
        Hand = PlayerPrefs.GetInt("Hand", 0);
        Swap = PlayerPrefs.GetInt("Swap", 0);
        Instance = this;
        LeanTween.init(1000);
        Application.targetFrameRate = 60;
        CurrentStage = ScreenStage.None;
        CurrentLevelIndex = PlayerPrefs.GetInt("CurrentLevelIndex", 0);
    }
}

