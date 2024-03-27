using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GlobalControll : MonoBehaviour
{
    public static GlobalControll Instance;

    public static bool isSound;
    public static bool isHaptic;
    public static string StartSceneName = "Game";
    public static ScreenStage CurrentStage;
    public static int CurrentLevelIndex;

    private void Awake()
    {
        Instance = this;
        LeanTween.init(1000);
        Application.targetFrameRate = 60;
        CurrentStage = ScreenStage.None;
        CurrentLevelIndex = PlayerPrefs.GetInt("CurrentLevelIndex", 0);
    }
}

