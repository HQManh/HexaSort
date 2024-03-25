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
        GlobalControll.CurrentStage = ScreenStage.Home;
        UIController.Instance.SwitchStageUI();
        StartLevel();
    }

    public void StartGame()
    {
        GlobalControll.CurrentStage = ScreenStage.InGame;
        UIController.Instance.ShowLevelBreak(StartLevel);
    }


    void StartLevel()
    {
        if(DataControl.Instance != null)
        {

        }
        int currentLevel = PlayerPrefs.GetInt("CurrentLevel", 0);
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
}
