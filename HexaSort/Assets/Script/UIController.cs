using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEditor.Experimental.GraphView;
using UnityEngine;
using UnityEngine.UI;

public enum ScreenStage
{
    None,
    Home,
    InGame
}


public class UIController : MonoBehaviour
{
    public static UIController Instance;
    [Header("StartUI")]
    public CanvasGroup startGroup;
    public CanvasGroup settingGroup;
    public GameObject setting;
    public TextMeshProUGUI levelText;
    public TextMeshProUGUI coinTextMenu;
    public RectTransform beginCover;
    [Header("PlayUI")]
    public CanvasGroup playGroup;
    public Image progressPercen;
    public RectTransform settingContainer;
    public RectTransform settingCover;
    public RectTransform header;
    public RectTransform booster;
    public GameObject hammer;
    public GameObject swap;
    public TextMeshProUGUI progressText;
    public TextMeshProUGUI levelIngame;
    public BoosterControl boosterControl;
    public TextMeshProUGUI coinText;
    bool isSettingOn = false;
    [Header("EndUI")]
    public CanvasGroup endGroup;
    public CanvasGroup lostGroup;
    public CanvasGroup winGroup;
    public TextMeshProUGUI textLevelEndGame;
    public TextMeshProUGUI pieceGet;

    private void Awake()
    {
        Instance = this;
    }

    private void Start()
    {
        SetUpMenu();
    }

    public void SwitchStageUI()
    {
        switch (GlobalControll.CurrentStage)
        {
            case ScreenStage.None:
                break;
            case ScreenStage.Home:
                playGroup.alpha = 0;
                playGroup.blocksRaycasts = false;
                startGroup.alpha = 1;
                startGroup.blocksRaycasts = true;
                break;
            case ScreenStage.InGame:
                playGroup.alpha = 1;
                playGroup.blocksRaycasts = true;
                startGroup.alpha = 0;
                startGroup.blocksRaycasts = false;
                break;
            default:
                break;
        }
    }

    void SetUpMenu()
    {
        levelText.text = "Level " + (GlobalControll.CurrentLevelIndex + 1).ToString();
        coinTextMenu.text = GlobalControll.Coin.ToString(); 
    }


    public void ShowInGameUI(int id)
    {
        SwitchStageUI();
        boosterControl.SetUpBooster();
        levelIngame.text = "Level " + (id+1).ToString();
        coinText.text = GlobalControll.Coin.ToString();
    }

    public void SetProgress(float percen)
    {
        LeanTween.value(progressPercen.fillAmount,percen, 0.2f).setOnUpdate((float value) =>
        {
            progressPercen.fillAmount = value;
        }).setOnComplete(() =>
        {
            if (progressPercen.fillAmount >= 1)
            {
                StageControl.Instance.End(true);
            }
        });
    }

    public void UpdateCoin(int previousValue, int value, float duration = 1f)
    {
        LeanTween.cancel(coinText.gameObject);
        LeanTween.scale(coinText.gameObject, Vector3.one * 1.5f, 0.05f).setOnComplete(() =>
        {
            LeanTween.scale(coinText.gameObject, Vector3.one, 0.25f);
        });

        LeanTween.value(previousValue, previousValue + value, duration).setOnUpdate((float value) =>
        {
            coinText.text = value.ToString();
        });

        GlobalControll.Coin = previousValue + value;
        PlayerPrefs.SetInt("Coin", GlobalControll.Coin);
    }

    public void ShowLevelBreak(Action callback, float duration = 0.3f, float delay = 0f)
    {
        beginCover.GetComponent<Image>().raycastTarget = true;
        LeanTween.alpha(beginCover, 1, duration).setOnComplete(() =>
        {
            LeanTween.alpha(beginCover, 0f, duration).setOnComplete(() =>
            {
                beginCover.GetComponent<Image>().raycastTarget = false;
            }).setDelay(delay);
        });
        callback?.Invoke();
    }

    public void ShowConfetti()
    {

    }

    public void ShowEndGame(bool isWin)
    {
        endGroup.alpha = 1f;
        endGroup.blocksRaycasts = true;
        if (isWin)
        {
            winGroup.alpha = 1f;
            winGroup.blocksRaycasts = true;
            SetEndGameText(true);
        }
        else
        {
            endGroup.alpha = 1f;
            endGroup.blocksRaycasts = true;
            SetEndGameText(false);
        }
    }

    public void ShowSettingMenu()
    {
        settingGroup.alpha = 1f;
        settingGroup.blocksRaycasts = true;
        LeanTween.scale(setting, Vector3.one, 0.3f).setEaseOutBounce();
    }

    public void OffSettingMenu()
    {
        settingGroup.alpha = 0f;
        settingGroup.blocksRaycasts = false;
        setting.transform.localScale = Vector3.zero;
    }

    public void ReStartLevel()
    {
        StageControl.Instance.ReStart();
    }

    public void BackMainMenu()
    {

    }

    public void ShowSettingInGame()
    {
        StartCoroutine(ShowSettingInGameAnim());    
    }

    IEnumerator ShowSettingInGameAnim()
    {
        isSettingOn = !isSettingOn;      
        float pos = settingContainer.transform.GetChild(0).localPosition.x;
        if (isSettingOn)
        {
            Time.timeScale = 0f;
            LeanTween.alpha(settingCover, .4f, 0.3f).setIgnoreTimeScale(true);
            settingCover.GetComponent<Image>().raycastTarget = true;
            for (int i = 1; i < 5; i++)
            {
                var t = settingContainer.transform.GetChild(i);
                LeanTween.moveLocalX(t.gameObject, pos, 0.2f).setEaseOutBack().setIgnoreTimeScale(true);
                yield return new WaitForSecondsRealtime(0.04f);
            }
        }
        else
        {
            Time.timeScale = 1f;
            LeanTween.alpha(settingCover, 0f, 0.3f).setIgnoreTimeScale(true);
            settingCover.GetComponent<Image>().raycastTarget = false;
            for (int i=4; i > 0; i--)
            {
                var t = settingContainer.transform.GetChild(i);
                LeanTween.moveLocalX(t.gameObject, 250f, 0.2f).setIgnoreTimeScale(true);
                yield return new WaitForSecondsRealtime(0.04f);
            }           
        }
    }

    public void SetEndGameText(bool isWin)
    {
        if (isWin)
        {
            textLevelEndGame.text = "LEVEL " + (GlobalControll.CurrentLevelIndex + 1).ToString() + " COMPLETED";
            pieceGet.text = CurrentData.Instance.currentProgress.ToString();
        }
        else
        {

        }
    }

    public void FadeHoldCover(bool isFade)
    {
        if (isFade)
        {
            LeanTween.alphaCanvas(lostGroup, 0f, 0.25f);
        }
        else
        {
            LeanTween.alphaCanvas(lostGroup, 1f, .25f);
        }
    }

    public void HammerBooster()
    {
        if(GlobalControll.Hammer == 0)
        {

        }
        else
        {
            CurrentData.isHammer = true;
            hammer.SetActive(true);
            HideUIIngame(true);
        }
    }

    public void HandBooster()
    {
        if(GlobalControll.Hand == 0)
        {

        }
        else
        {
            CurrentData.isHand = true;
            swap.SetActive(true);
            HideUIIngame(true);
        }
    }

    public void SwapBooster()
    {
        if(GlobalControll.Swap ==0)
        {

        }
        else
        {
            CurrentData.Instance.SwapBooster();
        }
    }

    public void HideUIIngame(bool isHide)
    {
        if (isHide)
        {
            LeanTween.move(header.gameObject, header.position +new Vector3(0f,2f,0f), 0.2f);
            LeanTween.move(booster.gameObject, booster.position - new Vector3(0f, 2f, 0f), 0.2f);
        }
        else
        {
            LeanTween.move(header.gameObject, header.position - new Vector3(0f, 2f, 0f), 0.2f);
            LeanTween.move(booster.gameObject, booster.position + new Vector3(0f, 2f, 0f), 0.2f);
            swap.SetActive(false);
            hammer.SetActive(false);
            CurrentData.isHammer = false;
            CurrentData.isHand = false;
        }
    }


    public void EndGameUI(bool isWin)
    {
        LeanTween.alphaCanvas(endGroup, 1f, 0.2f);
        if (isWin)
        {

        }
    }
}
