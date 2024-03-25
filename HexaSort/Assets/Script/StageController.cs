using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;
using Random = UnityEngine.Random;

public class StageController : MonoBehaviour
{
    public static StageController Instance { get; set; }
    public LevelController Level { get; set; }
    public int CurrentLevel { get; set; }
    public bool IsOver { get; set; }
    private float playTimeInSeconds;

    [SerializeField] private Camera cameraGame;
    [SerializeField] private bool noHomeScreen;
    [SerializeField] private bool useSavedLevel;
    [SerializeField] private AudioClip sfxWin;
    public int LevelLimit;
    private int mapIndex;
    private int numGoalsDone;
    private int numTotalGoals;

    public bool IsWaitingForSkinOptions;

    private void Awake()
    {
        if (GlobalController.StartSceneName == SceneManager.GetActiveScene().name)
        {
            SceneManager.LoadScene("Splash");
            return;
        }
        Instance = this;
    }

    private void Start()
    {
        IsOver = false;
        if (!noHomeScreen)
        {
            if (GlobalController.CurrentStage == StageScreen.InGame)
            {
                StartLevel();
            }
            else
            {
                GlobalController.CurrentStage = StageScreen.Home;
            }
            GameUIController.Instance.SwitchStageUI(true);
        }
        else
        {
            GlobalController.CurrentStage = StageScreen.InGame;
            GameUIController.Instance.SwitchStageUI(true);
            StartLevel();
        }
        StartCoroutine("CoStart");
    }

    IEnumerator CoStart()
    {
        yield return new WaitForSeconds(0);
        GlobalController.Instance.ShowBanner();
    }

    private void StartLevel()
    {
        if (useSavedLevel)
        {
            if (DataController.Instance != null)
            {
                if (GlobalController.ReplayingLevel > 0)
                {
                    GlobalController.CurrentLevelIndex = GlobalController.ReplayingLevel;
                }
            }
            else
            {
                GlobalController.CurrentLevelIndex = 1;
            }
        }
        mapIndex = LevelController.Instance.LoadLevel(GlobalController.CurrentLevelIndex, LevelLimit);
        StartCoroutine(CoStartLevel());
    }

    IEnumerator CoStartLevel()
    {
        // Setup level
        LevelController.Instance.SetUpLevel();
        yield return new WaitForSeconds(0.02f);
        if (LevelController.Instance.Level != null)
        {
            LevelController.Instance.Level.SetUp();
            numGoalsDone = 0;
            GameUIController.Instance.UpdateLevelProgress(0);
            GameUIController.Instance.ShowInGameUI(GlobalController.CurrentLevelIndex);
            LevelController.Instance.Level.StartLevel();
            playTimeInSeconds = Time.realtimeSinceStartup;
        }
    }

    public void StartGame()
    {
        GlobalController.CurrentStage = StageScreen.InGame;
        GameUIController.Instance.ShowLevelBreak(StartLevel);
    }

    public void GetBackToLevelSelector()
    {
        GlobalController.CurrentStage = StageScreen.LevelSelector;
        GameUIController.Instance.ShowLevelBreak(() =>
        {
            if (LevelController.Instance.Level != null)
            {
                Destroy(LevelController.Instance.Level.gameObject);
            }
            GameUIController.Instance.SwitchStageUI(false);
            GameUIController.Instance.ShowLevelSelector();
        });
    }

    public void GetBackHome()
    {
        GlobalController.CurrentStage = StageScreen.Home;
        ReloadScene();
    }

    public void UpdateScore()
    {
        numGoalsDone++;
        GameUIController.Instance.UpdateLevelProgress(numGoalsDone / (float)numTotalGoals);
        if (numGoalsDone == numTotalGoals)
        {
            End(true);
        }
    }

    public void End(bool win)
    {
        if (IsOver) return;
        IsOver = true;
        StartCoroutine(CoEnd(win));
    }

    IEnumerator CoEnd(bool win)
    {
        if (win)
        {
            yield return new WaitForSeconds(2f);
            GlobalController.CurrentLevelIndex++;
            if (GlobalController.CurrentLevelIndex > DataController.Instance.Data.LevelIndex)
            {
                //AnalyticsController.Instance.LogLevelComplete(GlobalController.CurrentLevelIndex - 1, (int)(Time.realtimeSinceStartup - playTimeInSeconds), GlobalController.ReplayCount);
                //AnalyticsController.Instance.LogCustomEvent("checkpoint_" + (GlobalController.CurrentLevelIndex - 1).ToString("000"), "", "");
                //AppsflyerController.Instance.LogCustomEvent(AFInAppEvents.LEVEL_ACHIEVED, AFInAppEvents.LEVEL, (GlobalController.CurrentLevelIndex - 1).ToString("000"));

                DataController.Instance.Data.LevelIndex = GlobalController.CurrentLevelIndex;
            }
            DataController.Instance.SaveData();
            StartCoroutine(CoShowEndGameUI(true));
            GlobalController.ReplayCount = 0;
        }
        else
        {
            yield return new WaitForSeconds(1f);
            //AnalyticsController.Instance.LogLevelFail(GlobalController.CurrentLevelIndex, (int)(Time.realtimeSinceStartup - playTimeInSeconds), GlobalController.ReplayCount);
            StartCoroutine(CoShowEndGameUI(false));
        }
    }

    int earning;
    int earningX;
    public bool showingInter = true;

    public int BonusEarning;

    public void WatchAdsEarnX()
    {
        GlobalController.Instance.ShowRewardedVideo(EarnRewardX);
    }

    private void EarnRewardX()
    {
        //AnalyticsController.Instance.LogEarnCurrency("cash", earningX, "x5watchads");
        DataController.Instance.SaveData();
        showingInter = false;
    }

    IEnumerator CoShowEndGameUI(bool win)
    {
        //GameUIController.Instance.SetEndResultLabelActive(win, true);
        if (win)
        {
            SoundController.Instance.PlaySingle(sfxWin);
            GameUIController.Instance.ShowConfetti();
            yield return new WaitForSeconds(0.5f);
            GameUIController.Instance.ShowGameEnd(win);
        }
        else
        {
            yield return new WaitForSeconds(0.5f);
            GameUIController.Instance.ShowGameEnd(win);
        }
        GlobalController.Instance.ShowInterstitial();
        CameraController.Instance.EndCam(GlobalController.Instance.ShowMREC);
    }

    public void WatchAdsSkipLevel()
    {
        GlobalController.Instance.ShowRewardedVideo(SkipLevel);
    }

    private void SkipLevel()
    {
        showingInter = false;
        //AnalyticsController.Instance.LogLevelSkip(DataController.Instance.Data.LevelIndex, (int)(Time.realtimeSinceStartup - playTimeInSeconds), GlobalController.ReplayCount);
        GlobalController.ReplayCount = 0;
        GlobalController.CurrentLevelIndex++;

        if (GlobalController.CurrentLevelIndex > DataController.Instance.Data.LevelIndex)
        {
            DataController.Instance.Data.LevelIndex = GlobalController.CurrentLevelIndex;
        }
        DataController.Instance.SaveData();
        NextLevel();
    }

    public void Next()
    {
        DataController.Instance.Data.Coin += earning;
        DataController.Instance.SaveData();
        if (DataController.Instance.Data.LevelIndex % 4 == 0 && !GlobalController.IsRated)
        {
            GameUIController.Instance.ShowRateUs(NextLevel, NextLevelAfterRate);
        }
        else
        {
            NextLevel();
        }
    }

    private void NextLevelAfterRate()
    {
        showingInter = false;
        NextLevel();
    }

    public void NextLevel()
    {
        GlobalController.ReplayingLevel = 0;
        GameUIController.Instance.ShowLevelBreak(ReloadScene, 0.3f, 0, false);
    }

    public void ForceStartLevel(int level)
    {
        GameUIController.Instance.HideLevelSelector();
        GlobalController.CurrentStage = StageScreen.InGame;
        GlobalController.ReplayingLevel = 0;
        GlobalController.CurrentLevelIndex = level;
        NextLevel();
    }

    public void Restart()
    {
        GlobalController.ReplayingLevel = mapIndex;
        GlobalController.ReplayCount++;
        GameUIController.Instance.ClearResultScreen(ReloadScene);
    }

    private void ReloadScene()
    {
        if (showingInter)
        {
        }
        SceneManager.LoadSceneAsync(SceneManager.GetActiveScene().name);
    }
}
