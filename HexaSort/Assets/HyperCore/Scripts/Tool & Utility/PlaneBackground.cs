using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlaneBackground : MonoBehaviour
{
    [Serializable]
    public struct BackgroundColorSpritePair
    {
        public Sprite Sprite;
        public Color PlaneColor;
    }

    [SerializeField]
    private BackgroundColorSpritePair[] colorSpritePairs;
    [SerializeField]
    private MeshRenderer planeMesh;
    [SerializeField]
    private SpriteRenderer background;
    [SerializeField]
    private bool autoStart;

    public static PlaneBackground Instance { get; set; }

    private void Awake()
    {
        Instance = this;
    }

    private void Start()
    {
        if (autoStart)
        {
            ChangeColor();
        }
    }

    public void ChangeColor()
    {
        if (colorSpritePairs == null || colorSpritePairs.Length == 0) return;
        int rand = UnityEngine.Random.Range(0, colorSpritePairs.Length);
        planeMesh.material.SetColor("_Color", colorSpritePairs[rand].PlaneColor);
        background.sprite = colorSpritePairs[rand].Sprite;
    }
}
