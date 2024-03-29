using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class LevelData
{
    public List<List<PiecePro>> platInfo = new();
    public Dictionary<int,List<PiecePro>> pieces = new();
}

public class DataControl : MonoBehaviour
{
    public static DataControl Instance;
    private void Awake()
    {
        Instance = this;
    }

    public void SaveData()
    {

    }
}
