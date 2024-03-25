using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SplashControl : MonoBehaviour
{
    [SerializeField]
    string sceneToLoad = "Game";

    void Start()
    {
        GlobalControll.StartSceneName = "Splash";
        SceneManager.LoadScene(sceneToLoad);
    }

}
