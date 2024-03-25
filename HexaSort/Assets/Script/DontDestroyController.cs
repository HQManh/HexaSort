using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DontDestroyController : MonoBehaviour
{
    public static DontDestroyController Instance { get; set; }

    private void Awake()
    {
        DontDestroyOnLoad(gameObject);
        if (Instance != null)
        {
            Destroy(gameObject);
        }
        else
        {
            Instance = this;
        }
#if UNITY_IOS
        Application.targetFrameRate = 60;
#endif
    }
}
