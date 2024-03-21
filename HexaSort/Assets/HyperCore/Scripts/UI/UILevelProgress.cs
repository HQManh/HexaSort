using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UILevelProgress : MonoBehaviour
{
    [SerializeField] private Image fill;
    [SerializeField] private GameObject[] starsPass;

    public void SetProgress(float amount, int starPass, float duration = 0f)
    {
        if (duration > 0)
        {
            LeanTween.value(fill.fillAmount, amount, duration).setOnUpdate((float f)=> {
                fill.fillAmount = f;
            });
        }
        else
        {
            fill.fillAmount = amount;
        }
        for (int i = 0; i < starPass; i++)
        {
            starsPass[i].SetActive(true);
        }
        for (int i = starPass; i < starsPass.Length; i++)
        {
            starsPass[i].SetActive(false);
        }
    }
}
