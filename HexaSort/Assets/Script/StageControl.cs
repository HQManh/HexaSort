using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.SceneManagement;

public class StageControl : MonoBehaviour
{
    public static StageControl Instance;

    private void Awake()
    {
        if(GlobalControll.StartSceneName == SceneManager.GetActiveScene().name)
        {
            SceneManager.LoadScene("Splash");
            return;
        }
        Instance = this;
    }

    private void Start()
    {
        if(GlobalControll.CurrentStage == ScreenStage.InGame)
        {
            UIController.Instance.SwitchStageUI();
            StartGame();
        }
        else
        {
            GlobalControll.CurrentStage = ScreenStage.Home;
            UIController.Instance.SwitchStageUI();
        }
    }

    public void StartGame()
    {
        GlobalControll.CurrentStage = ScreenStage.InGame;
        UIController.Instance.ShowLevelBreak(StartLevel);     
        CurrentData.Instance.StartGame();
    }


    void StartLevel()
    {
        if(DataControl.Instance != null)
        {

        }
        int currentLevel = GlobalControll.CurrentLevelIndex;
        LevelControl.Instance.LoadLevel(currentLevel);
        StartCoroutine(CoStartLevel());
    }

    IEnumerator CoStartLevel()
    {
        LevelControl.Instance.SetUpLevel();
        yield return null;
        if(LevelControl.Instance.level != null)
        {
            UIController.Instance.SetProgress(0);
            UIController.Instance.ShowInGameUI(GlobalControll.CurrentLevelIndex);
        }
    }

    public void End(bool isWin)
    {
        StartCoroutine(CoEnd(isWin));
    }

    IEnumerator CoEnd(bool isWin)
    {
        if (isWin)
        {
            yield return new WaitForSeconds(2f);
            GlobalControll.CurrentLevelIndex++;
            //PlayerPrefs.SetInt("CurrentLevelIndex", GlobalControll.CurrentLevelIndex);
            StartCoroutine(CoEndUI(isWin));
        }
        else
        {
            yield return new WaitForSeconds(1f);
            StartCoroutine(CoEndUI(isWin));
        }
    }

    IEnumerator CoEndUI(bool  isWin)
    {
        if (isWin)
        {
            UIController.Instance.ShowConfetti();
            yield return new WaitForSeconds(0.5f);
            UIController.Instance.ShowEndGame(true);
        }else
        {
            yield return new WaitForSeconds(0.5f);
            UIController.Instance.ShowEndGame(false);
        }
    }


    public void NextLevel()
    {
        UIController.Instance.ShowLevelBreak(ReloadScence);
    }

    public void NextLevelAdsCoin()
    {
        NextLevel();
    }

    public void ReStart()
    {
        ReloadScence();
    }

    void ReloadScence()
    {
        SceneManager.LoadSceneAsync(SceneManager.GetActiveScene().name);
    }
}
