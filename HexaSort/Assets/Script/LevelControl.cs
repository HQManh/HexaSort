using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
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
        level = transform.GetComponentInChildren<LevelInfo>();
        if(level != null)
        {
            Destroy(level.gameObject);
        }
        var t = Resources.Load<GameObject>(levelPath + levelPrefix + (id + 1));
        loadedLevel = t.GetComponentInChildren<LevelInfo>();
        currentLevel = id;
    }

    public void SetUpLevel()
    {
        Debug.Log("?");
        if(loadedLevel != null && level == null)
        {
            level = Instantiate(loadedLevel, transform);
        }
    }
}
