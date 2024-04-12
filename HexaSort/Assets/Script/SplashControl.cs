using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SplashControl : MonoBehaviour
{
    [SerializeField]
    string sceneToLoad = "Game";
    [SerializeField]
    float timeLoad;
    [SerializeField]
    Slider slider;
    [SerializeField]
    TextMeshProUGUI text;


    void Start()
    {
        GlobalControll.StartSceneName = "Splash";
        LoadingBar();
    }

    void LoadingBar()
    {
        LeanTween.value(0f, 1f, timeLoad).setOnUpdate((float f) =>
        {
            slider.value = f;
            text.text = ((int)(f * 100)).ToString()+ "%";
        }).setOnComplete(() =>
        {
            SceneManager.LoadSceneAsync(sceneToLoad);
        });
    }

}
