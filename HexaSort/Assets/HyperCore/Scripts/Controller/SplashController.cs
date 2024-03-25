using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SplashController : MonoBehaviour
{
    [SerializeField]
    private string sceneToLoad = "Game";
    // Use this for initialization
    void Start()
    {
        SceneManager.LoadScene(sceneToLoad);
        GlobalController.StartSceneName = "Game";
    }

}
