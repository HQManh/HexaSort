
using System.Collections.Generic;
using UnityEngine;

public class LevelControl : Singleton<LevelControl>
{
    private string levelPath = "Level/";
    private string levelPrefix = "Lv_";
    public List<LevelInfo> listLevels = new();
    public int currentLevel = 0;
    public LevelInfo loadedLevel;
    public LevelInfo level;

    public int GetLevelCounts()
    {
        return Resources.LoadAll<GameObject>(levelPath).Length;
    }

    public void LoadLevel(int id)
    {
        if (level != null)
        {
            Destroy(level.gameObject);
        }
        if (id >= GetLevelCounts())
        {
            id = 0;
            GlobalControll.CurrentLevelIndex = 0;
        }
        var t = Resources.Load<GameObject>(levelPath + levelPrefix + (id + 1));
        PlayerPrefs.SetInt("CurrentLevelIndex", GlobalControll.CurrentLevelIndex);
        loadedLevel = t.GetComponentInChildren<LevelInfo>();
        currentLevel = id;
        level = transform.GetComponentInChildren<LevelInfo>();
        LevelData data = DataControl.Instance.LoadData();
        if(data == null)
        {
            CurrentData.Instance.StartGame();
            return;
        }
        if (data.level == GlobalControll.CurrentLevelIndex)
        {
            CurrentData.Instance.StartGame(data);
        }
        else
        {
            CurrentData.Instance.StartGame();
        }
    }

    public void SetUpLevel()
    {
        if(loadedLevel != null && level == null)
        {
            level = Instantiate(loadedLevel, transform);
        }
    }
}
