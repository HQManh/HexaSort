using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public enum StageScreen
{
    None,
    Home,
    InGame,
    LevelSelector
}

public class GameUIController : MonoBehaviour
{
    public static GameUIController Instance { get; set; }
    [SerializeField] private CanvasScaler[] canvasScalers;
    [SerializeField] private Image cover;
    [SerializeField] private UIRateUs rateUI;
    [SerializeField] private GameObject btnToggleUI;
    [SerializeField] private GameObject[] uiToToggles;
    [Header("Start UI")]
    [SerializeField] private GameObject shopNoti;
    [SerializeField] private CanvasGroup startUI;
    [Header("In Game UI")]
    [SerializeField] private Text[] txtProgress;
    [SerializeField] private Text txtCoin;
    [SerializeField] private CanvasGroup inGameUI;
    [Header("End UI")]
    [SerializeField] private Image resultCover;
    [SerializeField] private GameObject resultLabel;
    [SerializeField] private CanvasGroup resultButtons;
    [SerializeField] private GameObject btnNext;
    [SerializeField] private GameObject btnReplay;
    [SerializeField] private GameObject btnNextByAds;
    [SerializeField] private CanvasGroup resultWin;
    [SerializeField] private CanvasGroup resultFail;
    [SerializeField] private ParticleSystem eVictory;

    [SerializeField] private TMPro.TMP_Text levelCurrent;
    [SerializeField] private Button btnSettings;
    [SerializeField] private UIToggleSpriteSwap btnSound, btnMusic, btnHaptic;

    [Header("Setting")]
    [SerializeField] private CanvasGroup settingUI;

    private bool isUION;

    public static bool IsUIMatchWidth
    {
        get
        {
            return GlobalController.ScreenRatio < GlobalController.FixedStageResolution.x / GlobalController.FixedStageResolution.y;
        }
    }


    private void Awake()
    {
        Instance = this;
    }

    private void Start()
    {
        isUION = !GlobalController.Instance.ForTesting;
        btnToggleUI.SetActive(GlobalController.Instance.ForTesting);
        for (int i = 0; i < canvasScalers.Length; i++)
        {
            canvasScalers[i].matchWidthOrHeight = IsUIMatchWidth ? 0 : 1;
        }
        //btnSound.OnValueChange.RemoveListener(ButtonSound);
        //btnHaptic.OnValueChange.RemoveListener(ButtonShake);
        //btnMusic.OnValueChange.RemoveListener(ButtonMusic);
        //btnSound.OnValueChange.AddListener(ButtonSound);
        //btnHaptic.OnValueChange.AddListener(ButtonShake);
        //btnMusic.OnValueChange.AddListener(ButtonMusic);
        //btnSound.IsOn = GlobalController.IsSoundOn;
        //btnHaptic.IsOn = GlobalController.IsHapticOn;
        //btnMusic.IsOn = GlobalController.IsMusicOn;
    }

    public void ToggleUI()
    {
        isUION = !isUION;
        for (int i = 0; i < uiToToggles.Length; i++)
        {
            uiToToggles[i].SetActive(isUION);
        }
    }

    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            if (set == 2)
                SettingOff();
        }

    }

    public void SwitchStageUI(bool willFadeCover)
    {
        switch (GlobalController.CurrentStage)
        {
            case StageScreen.None:
                break;
            case StageScreen.Home:
                inGameUI.alpha = 0;
                inGameUI.blocksRaycasts = false;
                startUI.alpha = 1;
                startUI.blocksRaycasts = true;
                break;
            case StageScreen.InGame:
                inGameUI.alpha = 1;
                inGameUI.blocksRaycasts = true;
                startUI.alpha = 0;
                startUI.blocksRaycasts = false;
                break;
            case StageScreen.LevelSelector:
                inGameUI.alpha = 0;
                inGameUI.blocksRaycasts = false;
                startUI.alpha = 0;
                startUI.blocksRaycasts = false;
                break;
            default:
                break;
        }
        if (willFadeCover)
        {
            LeanTween.alpha(cover.rectTransform, 0, 0.4f).setOnComplete(() =>
            {
                cover.raycastTarget = false;
            });
        }
        resultLabel.SetActive(false);
        eVictory.Stop();
        resultButtons.blocksRaycasts = false;
        resultButtons.alpha = 0;
    }

    public void ShowInGameUI(int level)
    {
        SwitchStageUI(false);
        levelCurrent.text = "Level " + level.ToString();
        if (btnHint != null)
        {
            StartCoroutine(SetAnimButtonHint());
        }
    }

    public void UpdateCoin(int previousValue, int value, float duration = 1f, Action callback = null)
    {
        // Effects
        LeanTween.cancel(txtCoin.gameObject);
        LeanTween.scale(txtCoin.gameObject, Vector3.one * 1.5f, 0.05f).setOnComplete(() =>
        {
            LeanTween.scale(txtCoin.gameObject, Vector3.one, 0.25f);
        });
        LeanTween.value(previousValue, value, duration).setOnUpdate((float f) =>
        {
            txtCoin.text = f.ToString("0");
            //txtCoinCollected.text = (f - previousValue).ToString("0");
        }).setOnComplete(callback);
    }

    public void UpdateShopNoti()
    {
        for (int i = 0; i < AssetController.Instance.ListSkinItemData.Count; i++)
        {
            if (AssetController.Instance.ListSkinItemData[i].IsUnlocked &&
                !DataController.Instance.Data.SkinIDs.Contains(AssetController.Instance.ListSkinItemData[i].ID))
            {
                shopNoti.SetActive(true);
                return;
            }
        }
        for (int i = 0; i < AssetController.Instance.ListHeadsetItemData.Count; i++)
        {
            if (AssetController.Instance.ListHeadsetItemData[i].IsUnlocked &&
                !DataController.Instance.Data.HeadsetIDs.Contains(AssetController.Instance.ListHeadsetItemData[i].ID))
            {
                shopNoti.SetActive(true);
                return;
            }
        }
        shopNoti.SetActive(false);
    }

    public void UpdateLevelProgress(float progress)
    {
    }

    public void ShowConfetti()
    {
        if (eVictory != null)
        {
            eVictory.Play();
        }
    }

    public void ToggleSound(bool isOn)
    {
        GlobalController.IsSoundOn = !GlobalController.IsSoundOn;
        if (GlobalController.IsSoundOn)
        {
            SoundController.Instance.Unmute();
        }
        else
        {
            SoundController.Instance.Mute();
        }
        PlayerPrefs.SetInt("IsSoundOn", GlobalController.IsSoundOn ? 1 : 0);
    }

    public void SetEndResultLabelActive(bool win, bool isActive)
    {
        resultLabel.SetActive(isActive);
        if (win)
        {
            LeanTween.alphaCanvas(resultWin, 1, isActive ? 0.2f : 0);
        }
        else
        {
            LeanTween.alphaCanvas(resultFail, 1, isActive ? 0.2f : 0);
        }
    }

    public void ShowLevelBreak(Action callback, float duration = 0.3f, float delay = 0f, bool hideCover = true)
    {
        cover.raycastTarget = true;
        LeanTween.alpha(cover.rectTransform, 1, duration).setOnComplete(() =>
        {
            levelCurrent.text = "";
            if (hideCover)
            {
                LeanTween.alpha(cover.rectTransform, 0, duration).setOnComplete(() =>
                {
                    cover.raycastTarget = false;
                }).setDelay(delay);
            }
            callback?.Invoke();
        });
    }

    public void ShowRateUs(Action onClose, Action onRatePositive)
    {
        rateUI.OnClose = onClose;
        rateUI.OnRatePositive = onRatePositive;
        rateUI.Show();
    }

    public void ShowGameEnd(bool win)
    {
        resultLabel.SetActive(true);
        LeanTween.alpha(resultCover.rectTransform, 0.5f, 0.2f);
        inGameUI.blocksRaycasts = false;
        LeanTween.alphaCanvas(inGameUI, 0, 0.1f);
        if (win)
        {
            LeanTween.alphaCanvas(resultWin, 1, 0.2f);
        }
        else
        {
            LeanTween.alphaCanvas(resultFail, 1, 0.2f);
        }
        btnNext.SetActive(win);
        btnReplay.SetActive(!win);
        btnNextByAds.SetActive(!win);
        LeanTween.alphaCanvas(resultButtons, 1, 0.2f).setOnComplete(() =>
        {
            resultButtons.blocksRaycasts = true;
        });
    }

    public void ClearResultScreen(Action callback)
    {
        LeanTween.alpha(resultCover.rectTransform, 0, 0.2f);
        //LeanTween.scale(resultLabel, Vector2.zero, 0.2f).setOnComplete(() =>
        //{
        resultLabel.SetActive(false);
        //});
        eVictory.Stop(true, ParticleSystemStopBehavior.StopEmittingAndClear);
        LeanTween.alphaCanvas(resultButtons, 0, 0.2f).setDelay(0.2f);
        resultButtons.blocksRaycasts = false;
        LeanTween.scale(resultButtons.gameObject, Vector3.zero, 0.4f);
        //resultButtonsFail.blocksRaycasts = false;
        //LeanTween.scale(resultButtonsFail.gameObject, Vector3.zero, 0.4f);
        cover.raycastTarget = true;
        LeanTween.alpha(cover.rectTransform, 1, 0.5f).setOnComplete(callback);
    }

    public void ShowLevelSelector()
    {
        levelSelectorUI.Show();
        GlobalController.Instance.ShowMREC();
    }

    public void HideLevelSelector()
    {
        GlobalController.CurrentStage = StageScreen.Home;
        ShowLevelBreak(() =>
        {
            levelSelectorUI.Hide();
            SwitchStageUI(false);
        });
        GlobalController.Instance.ShowBanner();
    }

    int set = 0;
    [SerializeField] private GameObject btnHint;
    public LevelSelectorUI levelSelectorUI;

    public void ShowSetting()
    {
        //SoundManager.Instance.ButtonClick();
        if (set == 2)
        {
            SettingOff();
        }
        else
        {

            settingUI.alpha = 1;
            GlobalController.Instance.ShowMREC();
            LeanTween.scale(btnHaptic.gameObject, Vector3.one, 0.2f).setEase(LeanTweenType.linear);
            LeanTween.scale(btnSound.gameObject, Vector3.one, 0.2f).setEase(LeanTweenType.linear).setDelay(0.06f);
            LeanTween.scale(btnMusic.gameObject, Vector3.one, 0.2f).setEase(LeanTweenType.linear).setDelay(0.12f).setOnComplete(() =>
            {
                set = 2;
                settingUI.blocksRaycasts = true;
            });
        }
    }

    public void SettingOff()
    {

        settingUI.alpha = 0;
        GlobalController.Instance.ShowBanner();
        LeanTween.scale(btnMusic.gameObject, Vector3.zero, 0.2f).setEase(LeanTweenType.linear);
        LeanTween.scale(btnSound.gameObject, Vector3.zero, 0.2f).setEase(LeanTweenType.linear).setDelay(0.06f);
        LeanTween.scale(btnHaptic.gameObject, Vector3.zero, 0.2f).setEase(LeanTweenType.linear).setDelay(0.12f).setOnComplete(() =>
        {
            set = 0;
            settingUI.blocksRaycasts = false;
        });
    }

    public void ButtonSound(bool on)
    {
        // SoundManager.Instance.ButtonClick();
        GlobalController.IsSoundOn = !GlobalController.IsSoundOn;
        if (GlobalController.IsSoundOn)
        {
            //SoundController.Instance.UnmuteSound();
        }
        else
        {
            //SoundController.Instance.MuteSound();
        }
        PlayerPrefs.SetInt("IsSoundOn", GlobalController.IsSoundOn ? 1 : 0);
        SettingOff();
    }

    public void ButtonMusic(bool on)
    {
        //SoundManager.Instance.ButtonClick();
        GlobalController.IsMusicOn = !GlobalController.IsMusicOn;
        if (GlobalController.IsMusicOn)
        {
            SoundController.Instance.Unmute();
        }
        else
        {
            SoundController.Instance.Mute();
        }
        PlayerPrefs.SetInt("IsMusicOn", GlobalController.IsMusicOn ? 1 : 0);
        SettingOff();
    }


    public void ButtonHaptic(bool on)
    {
        //SoundManager.Instance.ButtonClick();
        GlobalController.IsHapticOn = !GlobalController.IsHapticOn;
        if (GlobalController.IsHapticOn)
        {
        }
        else
        {
        }
        PlayerPrefs.SetInt("IsHapticOn", GlobalController.IsHapticOn ? 1 : 0);
        SettingOff();
    }

    public void SetBtnHintActive(bool isActive)
    {
        btnHint.SetActive(isActive);
    }

    [SerializeField] private float animateButtonHintDelay = 4f;
    private IEnumerator SetAnimButtonHint()
    {
        yield return new WaitForSeconds(animateButtonHintDelay);
        btnHint.GetComponent<Animator>().Play("ButtonHint");
    }
}
