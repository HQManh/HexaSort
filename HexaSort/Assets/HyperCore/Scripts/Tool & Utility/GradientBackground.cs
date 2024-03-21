using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GradientBackground : MonoBehaviour
{
    [Serializable]
    private struct ColorPair
    {
        public Color CameraColor;
        [HideInInspector] public Color SkylineColor;
    }

    [SerializeField]
    private ColorPair[] colorPairs;
    [SerializeField]
    private Camera bgCamera;
    [SerializeField]
    private SpriteRenderer skyline;

    public static GradientBackground Instance { get; set; }

    private void Awake()
    {
        Instance = this;
    }

    private void Start()
    {
        ChangeColor();
    }

    public void ChangeColor()
    {
        if (colorPairs == null || colorPairs.Length == 0) return;
        int rand = UnityEngine.Random.Range(0, colorPairs.Length);
        bgCamera.backgroundColor = colorPairs[rand].CameraColor;
        skyline.color = colorPairs[rand].SkylineColor;
    }
}
