using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class PopUp : MonoBehaviour
{
    [SerializeField]
    private Image bg;
    [SerializeField]
    private CanvasGroup content;
    [SerializeField]
    private Text txtContent;
    [SerializeField]
    private UIButton callButton;
    [SerializeField]
    private UIButton yesButton;
    [SerializeField]
    private UnityEvent onShown;
    protected Action onYesCallback;

    public virtual void Show()
    {
        if (callButton != null)
        {
            callButton.enabled = false;
        }
        bg.gameObject.SetActive(true);
        bg.color = new Color(0, 0, 0, 0.8f);
        content.blocksRaycasts = true;
        content.transform.localScale = Vector3.one / 1.1f;
        if (onShown != null)
        {
            onShown.Invoke();
        }
        LeanTween.scale(content.gameObject, Vector3.one, 0.1f).setEase(LeanTweenType.easeOutQuad).setOnComplete(() =>
        {
        }).setIgnoreTimeScale(true);
        LeanTween.alphaCanvas(content, 1, 0.05f).setIgnoreTimeScale(true);
        //transform.SetAsLastSibling();
        GlobalController.Instance.HideBanner();
    }

    public void SetContent(string content)
    {
        txtContent.text = content;
    }

    public virtual void Hide()
    {
        LeanTween.scale(content.gameObject, Vector3.one / 1.1f, 0.1f).setEase(LeanTweenType.easeOutQuad).setIgnoreTimeScale(true);
        content.blocksRaycasts = false;
        bg.color = new Color(0, 0, 0, 0);
        LeanTween.alphaCanvas(content, 0, 0.1f).setOnComplete(() =>
        {
            bg.gameObject.SetActive(false);
            if (callButton != null)
            {
                callButton.enabled = true;
            }
            GlobalController.Instance.ShowBanner();
        }).setIgnoreTimeScale(true);
    }

    public void SetCallback(Action callback)
    {
        onYesCallback = callback;
    }

    public void OnCallback()
    {
        if (onYesCallback != null)
        {
            onYesCallback();
            onYesCallback = null;
        }
    }
}
