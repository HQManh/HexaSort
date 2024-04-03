using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIRateUs : MonoBehaviour
{
    [SerializeField] private CanvasGroup canvas;
    [SerializeField] private GameObject content;
    [SerializeField] private Text txtSay;
    [SerializeField] private GameObject[] stars;
    public Action OnClose;
    public Action OnRatePositive;

    public void Show()
    {
        if (GlobalController.IsRated) return;
        content.transform.localScale = Vector3.one * 0.6f;
        LeanTween.alphaCanvas(canvas, 1, 0.2f).setOnComplete(() =>
        {
            canvas.blocksRaycasts = true;
        });
        LeanTween.scale(content, Vector3.one, 0.2f);
    }

    public void OnStarChosen(int rate)
    {
        if (rate > 3)
        {
            Close(true);
            GlobalController.Instance.RateGame();
        }
        else
        {
            txtSay.text = "Thank you for your rating!";
            canvas.blocksRaycasts = false;
            Close(false);
        }
        for (int i = 0; i < stars.Length; i++)
        {
            stars[i].SetActive(i < rate);
        }
    }

    public void Close(bool positive)
    {
        GlobalController.IsRated = true;
        PlayerPrefs.SetInt("RateUs", 1);
        LeanTween.alphaCanvas(canvas, 0, 0.2f).setDelay(positive ? 0 : 1f).setOnComplete(() =>
        {
            gameObject.SetActive(false);
            if (positive)
            {
                OnRatePositive?.Invoke();
            }
            else
            {
                OnClose?.Invoke();
            }
        });
    }
}
