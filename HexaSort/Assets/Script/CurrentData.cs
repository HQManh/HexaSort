using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CurrentData : MonoBehaviour
{
    public static CurrentData Instance;
    public int maxColorID = 0;
    public List<Material> materials = new();
    public static bool isPick= false;
    public static List<PiecePro> currentPick;
    public static PlatformPiece currenPlat;
    [SerializeField]
    Material defaultMaterial;

    private void Awake()
    {
        Instance = this;
        materials.Add(defaultMaterial);
        SetMaterial();
    }


    void SetMaterial()
    {
        var t = Instantiate(defaultMaterial);
        t.color = Color.white;
        materials.Add(t);
    }

    public void Shuffle(Transform from, Transform to)
    {

    }
}
