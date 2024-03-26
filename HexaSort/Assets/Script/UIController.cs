using System;
using System.Collections.Generic;
using TMPro;
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
    public RectTransform beginCover;
    [Header("PlayUI")]
    public CanvasGroup playGroup;
    public Image progressPercen;
    public RectTransform settingContainer;
    public TextMeshProUGUI progressText;
    public TextMeshProUGUI coinText;
    bool isSettingOn = false;
    [Header("EndUI")]
    public CanvasGroup endGroup;
    public CanvasGroup lostGroup;
    public CanvasGroup winGroup;

    private void Awake()
    {
        Instance = this;
    }

    public void SwitchStageUI()
    {
        switch(GlobalControll.CurrentStage)
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

    public void ShowInGameUI(int id)
    {
        SwitchStageUI();
        levelText.text = "Level " + id.ToString();
    }

    public void SetProgress(float percen)
    {
        LeanTween.value(progressPercen.fillAmount, progressPercen.fillAmount + percen, 0.2f).setOnUpdate((float value) =>
        {
            progressPercen.fillAmount = value;
        });
        if(progressPercen.fillAmount >= 1)
        {
            ShowEndGame(true);
        }
    }

    public void UpdateCoin(int previousValue, int value, float duration = 1f)
    {
        LeanTween.cancel(coinText.gameObject);
        LeanTween.scale(coinText.gameObject, Vector3.one * 1.5f, 0.05f).setOnComplete(() =>
        {
            LeanTween.scale(coinText.gameObject, Vector3.one, 0.25f);
        });

        LeanTween.value(previousValue, value, duration).setOnUpdate((float value) =>
        {
            coinText.text = value.ToString();
        });
    }

    public void NextLevel()
    {

    }

    public void NextLevelAdsGetCoin()
    {
        NextLevel();
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

    public void ShowEndGame(bool isWin)
    {
        endGroup.alpha = 1f;
        endGroup.blocksRaycasts = true;
        if (isWin)
        {
            winGroup.alpha = 1f;
            winGroup.blocksRaycasts = true;
        }
        else
        {
            endGroup.alpha = 1f;
            endGroup.blocksRaycasts = true;
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




    public void ShowSettingInGame()
    {
        isSettingOn = !isSettingOn;
        if (isSettingOn)
        {
            for (int i = 0; i < 4; i++)
            {
                var t = settingContainer.transform.GetChild(i).GetComponent<RectTransform>();
                LeanTween.moveLocalX(t.gameObject, -140f, 0.1f).setEaseInBounce();
            }
        }
        else
        {
            for (int i=0; i < 4; i++)
            {
                var t = settingContainer.transform.GetChild(i).GetComponent<RectTransform>();
                LeanTween.moveLocalX(t.gameObject, 250f, 0.1f).setEaseInBounce();
            }
        }
    }

    public void OffSettingInGame()
    {

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
        CurrentData.isHammer = true;
    }

    public void HandBooster()
    {
        CurrentData.isHand = true;
    }

    public void SwapBooster()
    {
        CurrentData.Instance.SwapBooster();
    }

    public void EndGameUI(bool isWin)
    {
        LeanTween.alphaCanvas(endGroup, 1f, 0.2f);
        if (isWin)
        {

        }
    }
}
