using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;


public class LevelData
{
    public int level;
    public int currentProcess;
    public List<string> platInfo = new();
    public List<string> pieces = new();
}

public class DataControl : MonoBehaviour
{
    public static DataControl Instance;
    private void Awake()
    {
        Instance = this;
    }

    public void SaveData(LevelData data)
    {
        File.WriteAllText("Assets/Resources/Json/Data.txt",JsonUtility.ToJson(data));
    }

    public LevelData LoadData()
    {
        string jsonData = File.ReadAllText("Assets/Resources/Json/Data.txt");
        LevelData data = JsonUtility.FromJson<LevelData>(jsonData);
        return data;
    }
}
