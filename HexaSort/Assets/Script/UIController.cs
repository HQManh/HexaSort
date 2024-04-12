using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using static UnityEngine.Rendering.DebugUI;

public enum ScreenStage
{
    None,
    Home,
    InGame
}


public class UIController : MonoBehaviour
{
    public static UIController Instance;
    public Camera cameraUI;
    [Header("StartUI")]
    public CanvasGroup startGroup;
    public CanvasGroup settingGroup;
    public GameObject setting;
    public TextMeshProUGUI levelText;
    public TextMeshProUGUI coinTextMenu;
    public RectTransform beginCover;
    [Header("PlayUI")]
    public CanvasGroup playGroup;
    public CanvasGroup boosterGroups;
    public Image progressPercen;
    public Image breakImage;
    public Image startBanner;
    public RectTransform imageScore;
    public RectTransform progressBar;
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
    public TextMeshProUGUI ticketText;
    bool isSettingOn = false;
    [Header("EndUI")]
    public ParticleSystem confetti;
    public CanvasGroup endGroup;
    public CanvasGroup lostGroup;
    public CanvasGroup winGroup;
    public TextMeshProUGUI textLevelEndGame;
    public TextMeshProUGUI pieceGet;
    public TextMeshProUGUI coinGet;
    public TextMeshProUGUI pigGet;
    public TextMeshProUGUI needPieceText;
    public TextMeshProUGUI reviveCoinText;
    bool isWatchRevive = false;
    int numRevive = 0;

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
        StartGameAnim();
        levelIngame.text = "Level " + (id+1).ToString();
        coinText.text = GlobalControll.Coin.ToString();
        ticketText.text = GlobalControll.Ticket.ToString();
    }

    void StartGameAnim()
    {
        LeanTween.alpha(settingCover, 0.4f, 0f);
        LeanTween.alpha(progressBar, 0f,0f);
        LeanTween.alpha(imageScore,1f,0f);  
        var t = progressBar.sizeDelta.y;
        LeanTween.scale(imageScore, Vector3.one, 0.3f);
        LeanTween.scale(startBanner.gameObject, Vector3.one, 0.3f).setOnComplete(() =>
        {
            LeanTween.alpha(settingCover, 0f, 0.25f).setDelay(0.2f);
            LeanTween.move(startBanner.gameObject, progressText.transform.position + new Vector3(0f,1f), 0.5f).setDelay(0.45f);
            LeanTween.move(imageScore.gameObject, progressText.transform.position, 0.5f).setDelay(0.45f).setOnComplete(() =>
            {
                LeanTween.alpha(progressBar, 1f, 0.3f);
                var t2 = imageScore.position.y;
                LeanTween.value(0f, -250f, 0.3f).setOnUpdate((float f) =>
                {
                    imageScore.localPosition = new Vector2(f, t2);
                });
                LeanTween.value(0f, 500f, 0.3f).setOnUpdate((float f) =>
                {
                    progressBar.sizeDelta = new Vector2(f, t);
                });
            });
            LeanTween.alpha(startBanner.rectTransform, 0f, 0.1f).setDelay(0.75f);
        });
        
    }

    public void SetProgress(float percen, float time =0.2f)
    {
        LeanTween.value(progressPercen.fillAmount,percen, time).setOnUpdate((float value) =>
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
        TextMeshProUGUI t = new();
        switch (GlobalControll.CurrentStage)
        {
            case ScreenStage.Home:
                t = coinTextMenu;
                break;
            case ScreenStage.InGame:
                t = coinText;
                break;
        }

        LeanTween.cancel(t.gameObject);
        LeanTween.scale(t.gameObject, Vector3.one * 1.5f, 0.05f).setOnComplete(() =>
        {
            LeanTween.scale(t.gameObject, Vector3.one, 0.25f);
        });

        LeanTween.value(previousValue, previousValue + value, duration).setOnUpdate((float value) =>
        {
            int v = (int)value;
            t.text = v.ToString();
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
        confetti.Play();
    }

    public void ShowEndGame(bool isWin)
    {
        endGroup.alpha = 1f;
        endGroup.blocksRaycasts = true;
        if (isWin)
        {
            winGroup.alpha = 1f;
            winGroup.blocksRaycasts = true;
            LeanTween.scale(winGroup.gameObject, Vector3.one, 0.2f).setEaseOutBounce();
            SetEndGameText(true);
        }
        else
        {
            lostGroup.alpha = 1f;
            lostGroup.blocksRaycasts = true;
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

    public void BacktoGame()
    {
        lostGroup.alpha = 0;
        lostGroup.blocksRaycasts = false;
        endGroup.alpha = 0;
        endGroup.blocksRaycasts = false;
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

    public IEnumerator BreakPieces(int id, Vector3 des, int score)
    {
        des = cameraUI.ScreenToWorldPoint(des);
        var imageTemp = Instantiate(breakImage,des, Quaternion.identity,transform);
        yield return null;
        imageTemp.color = CurrentData.Instance.materialsColor[id].color;
        imageTemp.GetComponent<TrailRenderer>().startColor = CurrentData.Instance.materialsColor[id].color;
        List<Vector3> points = new();
        var t = des;
        points.Add(t);
        int r = UnityEngine.Random.Range(0, 2);
        if (r == 0)
        {
            r = -1;
        } else r = 1;
        t += new Vector3(1f * r , 0f, 0f);
        points.Add(t);
        t += new Vector3(0f, 1f, 0f);
        points.Add(t);
        points.Add(progressText.transform.position);
        yield return null;
        LeanTween.move(imageTemp.gameObject, points.ToArray(), .5f).setSpeed(175f).setOnComplete(() =>
        {
            CurrentData.Instance.UpdateScore(score);
        }).setDestroyOnComplete(true);
    }

    public void SetEndGameText(bool isWin)
    {
        if (isWin)
        {
            textLevelEndGame.text = "LEVEL " + (GlobalControll.CurrentLevelIndex + 1).ToString() + " COMPLETED";
            AnimateText(coinGet, 5f);
            AnimateText(pigGet, 15f);
            AnimateText(pieceGet, CurrentData.Instance.currentProgress);
        }
        else
        {
            numRevive++;
            if (numRevive >= 4)
            {
                reviveCoinText.text = "400";
            }
            else
            {
                reviveCoinText.text = (numRevive * 100).ToString();
            }
            needPieceText.text = (CurrentData.levelInfo.goalScore - CurrentData.Instance.currentProgress).ToString();
        }
    }


    public void Revive(bool isCoin)
    {
        if (isCoin)
        {
            int coinNeed;
            if (numRevive >= 4)
            {
                coinNeed = 400;
            }
            else
            {
                coinNeed = numRevive * 100;
            }
            if(GlobalControll.Coin < coinNeed)
            {

            }
            else
            {
                UpdateCoin(GlobalControll.Coin, - coinNeed);
                StartCoroutine(CurrentData.Instance.BreakPlat(4));
                BacktoGame();
            }
        }
        else
        {
            StartCoroutine(CurrentData.Instance.BreakPlat(2));
            BacktoGame();
        }
    }

    void AnimateText(TextMeshProUGUI text, float value)
    {
        LeanTween.value(0f, value, .5f).setOnUpdate((float f) =>
        {
            int t = (int)f;
            text.text = t.ToString();
        }).setOnComplete(() =>
        {
            LeanTween.scale(text.gameObject, Vector3.one * 1.2f, 0.2f).setOnComplete(() =>
            {
                LeanTween.scale(text.gameObject, Vector3.one, 0.2f).setOnComplete(() =>
                {
                    var t = text.gameObject.GetComponentInChildren<ParticleSystem>();
                    t.Play();
                });
            });
        });
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
        if (GlobalControll.Hammer == 0)
        {
            if(GlobalControll.Coin >= 25)
            {
                UpdateCoin(GlobalControll.Coin, -25);
                CurrentData.isHammer = true;
                hammer.SetActive(true);
                HideUIIngame(true);
            }
            else
            {
                return;
            }
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
        if (GlobalControll.Hand == 0)
        {
            if (GlobalControll.Coin >= 50)
            {
                UpdateCoin(GlobalControll.Coin, -50);
                CurrentData.isHand = true;
                swap.SetActive(true);
                HideUIIngame(true);
            }
            else
            {
                return;
            }
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
        if (GlobalControll.Swap == 0)
        {
            if(GlobalControll.Coin >= 10)
            {
                UpdateCoin(GlobalControll.Coin, -10);
                CurrentData.Instance.SwapBooster();
            }
            else
            {
                return;
            }
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
            boosterGroups.alpha = 1;
            boosterGroups.blocksRaycasts = true;
        }
        else
        {
            LeanTween.move(header.gameObject, header.position - new Vector3(0f, 2f, 0f), 0.2f);
            LeanTween.move(booster.gameObject, booster.position + new Vector3(0f, 2f, 0f), 0.2f);
            swap.SetActive(false);
            hammer.SetActive(false);
            boosterGroups.alpha = 0;
            boosterGroups.blocksRaycasts = false;
            CurrentData.isHammer = false;
            CurrentData.isHand = false;
        }
    }
}
