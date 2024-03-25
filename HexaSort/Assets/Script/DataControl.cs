using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DataControl : MonoBehaviour
{
    public static DataControl Instance;
    private void Awake()
    {
        Instance = this;
    }
}
