using System.Collections;
using System.Collections.Generic;
#if UNITY_EDITOR
using UnityEditor;
using UnityEditor.AI;
#endif
using UnityEngine;
using UnityEngine.AI;

public class LevelController : Singleton<LevelController>
{
    private string levelPrefabPath = "StageLevel/";
    private string levelPrefabBasePath = "Base/";
    private string prefabPath = "/HyperCore/Prefabs/Resources/";
    private const string levelPrefix = "Level_";
    public List<SingleLevelController> ListLevels = new List<SingleLevelController>();
    public int CurrentLevel = 0;
    public SingleLevelController LoadedLevel;
    public SingleLevelController Level;

    public int GetLevelsCount()
    {
        return Resources.LoadAll<SingleLevelController>(levelPrefabPath).Length;
    }

    /// <summary>
    /// Load a level map & return the map index
    /// </summary>
    /// <param name="level"></param>
    /// <param name="levelLimit"></param>
    /// <param name="forcedChange"></param>
    /// <returns></returns>
    public int LoadLevel(int level, int levelLimit, bool forcedChange = false)
    {
        Level = transform.GetComponentInChildren<SingleLevelController>();
        if (Level != null)
        {
            if (forcedChange)
            {
                Destroy(Level.gameObject);
            }
            else
            {
                CurrentLevel = int.Parse(Level.name.Split('_')[1]);
                LoadedLevel = Level;
                return CurrentLevel; // For GD Test
            }
        }
        int levelIndex = level % levelLimit;
        if(levelIndex == 0)
        {
            levelIndex = levelLimit;
        }
        LoadedLevel = Resources.Load<SingleLevelController>(levelPrefabPath + levelPrefix + levelIndex);
        CurrentLevel = level;
        return level;
    }

    public void SetUpLevel()
    {
        if (LoadedLevel != null && Level == null)
        {
            Level = Instantiate(LoadedLevel, transform);
        }
    }

#if UNITY_EDITOR
    public void EditorAddLevel()
    {
        Instance = this;
        Level = transform.GetComponentInChildren<SingleLevelController>();
        if (Level != null)
        {
            Object prefabParent = PrefabUtility.GetCorrespondingObjectFromSource(Level.gameObject);
            if (prefabParent != null)
            {
                PrefabUtility.SaveAsPrefabAsset(
                    Level.gameObject,
                    AssetDatabase.GetAssetPath(prefabParent));
            }
            DestroyImmediate(Level.gameObject);
            AssetDatabase.Refresh();
        }
        Level = Instantiate(Resources.Load<SingleLevelController>(levelPrefabBasePath + "Level"), transform);
        CurrentLevel = Resources.LoadAll<SingleLevelController>(levelPrefabPath).Length;
        CurrentLevel++;
        Level.name = levelPrefix + CurrentLevel;
        PrefabUtility.SaveAsPrefabAsset(
                    Level.gameObject,
                    Application.dataPath + prefabPath + levelPrefabPath + Level.name + ".prefab");
    }

    public void EditorLoadLevel(int level)
    {
        Instance = this;
        Level = transform.GetComponentInChildren<SingleLevelController>();
        if (Level != null)
        {
            Object prefabParent = PrefabUtility.GetCorrespondingObjectFromSource(Level.gameObject);
            if (prefabParent != null)
            {
                PrefabUtility.SaveAsPrefabAsset(
                    Level.gameObject,
                    AssetDatabase.GetAssetPath(prefabParent));
            }
            DestroyImmediate(Level.gameObject);
            AssetDatabase.Refresh();
        }
        GameObject g = PrefabUtility.InstantiatePrefab(Resources.Load(levelPrefabPath + levelPrefix + level), transform) as GameObject;
        if (g == null)
        {
            Debug.LogError("No prefabs found for level " + CurrentLevel + ". Switching back to Level 1.");
            CurrentLevel = 1;
            EditorLoadLevel(CurrentLevel);
            return;
        }
        Level = g.GetComponent<SingleLevelController>();
        Level.name = levelPrefix + level;
    }

    public void EditorLoadNextLevel()
    {
        CurrentLevel++;
        EditorLoadLevel(CurrentLevel);
    }

    public void EditorCloneLevel(int level)
    {
        Instance = this;
        Level = transform.GetComponentInChildren<SingleLevelController>();
        if (Level != null)
        {
            Object prefabParent = PrefabUtility.GetCorrespondingObjectFromSource(Level.gameObject);
            string basePath = AssetDatabase.GetAssetPath(prefabParent);
            basePath = basePath.Substring(0, basePath.Length - (levelPrefix + level).Length - ".prefab".Length);
            PrefabUtility.SaveAsPrefabAsset(
                Level.gameObject,
                AssetDatabase.GetAssetPath(prefabParent));
            SingleLevelController[] levels = Resources.LoadAll<SingleLevelController>(levelPrefabPath);
            CurrentLevel = levels.Length + 1;
            AssetDatabase.CopyAsset(AssetDatabase.GetAssetPath(prefabParent), basePath + (levelPrefix + CurrentLevel) + ".prefab");
            DestroyImmediate(Level.gameObject);
            AssetDatabase.Refresh();
            GameObject g = PrefabUtility.InstantiatePrefab(Resources.Load(levelPrefabPath + levelPrefix + CurrentLevel), transform) as GameObject;
            Level = g.GetComponent<SingleLevelController>();
            Level.name = levelPrefix + CurrentLevel;
        }
    }


    public void EditorSaveLevel()
    {
        Instance = this;
        if (Level == null)
        {
            Level = transform.GetComponentInChildren<SingleLevelController>();
        }
        if (Level != null)
        {
            GameObject prefabRoot = PrefabUtility.GetOutermostPrefabInstanceRoot(Level.gameObject);
            if (prefabRoot != null)
            {
                PrefabUtility.UnpackPrefabInstance(prefabRoot, PrefabUnpackMode.OutermostRoot, InteractionMode.AutomatedAction);
            }

            // Recheck all of level's objects

            DoSaveAssetDatabase();
        }
    }

    private void DoSaveAssetDatabase()
    {
        Object instanceRoot = PrefabUtility.GetCorrespondingObjectFromSource(Level.gameObject);
        GameObject prefabParent = PrefabUtility.GetOutermostPrefabInstanceRoot(Level.gameObject);
        if (instanceRoot == null)
        {
            PrefabUtility.SaveAsPrefabAssetAndConnect(
                Level.gameObject,
                Application.dataPath + prefabPath + levelPrefabPath + Level.name + ".prefab", InteractionMode.AutomatedAction);
        }
        else
        {
            PrefabUtility.SaveAsPrefabAsset(
                Level.gameObject,
                AssetDatabase.GetAssetPath(instanceRoot));
            PrefabUtility.RevertPrefabInstance(prefabParent, InteractionMode.AutomatedAction);
        }
        AssetDatabase.Refresh();
        EditorApplication.update -= DoSaveAssetDatabase;
    }

    public void EditorUpdateNumObstacle(int type)
    {
        Instance = this;

    }

    public void EditorUpdateNumFloor()
    {
        Instance = this;

    }

    public void EditorUpdateNumLoot(int type)
    {
        Instance = this;

    }

    public void EditorUpdateNumTrap(int type)
    {
        Instance = this;

    }

    public void EditorRelinkAllObstacles()
    {
        Instance = this;
        EditorUnpackPrefab(Level.gameObject, PrefabUnpackMode.OutermostRoot, InteractionMode.AutomatedAction);

    }

    public void EditorSaveAll()
    {
        Instance = this;

        int totalLevels = Resources.LoadAll<SingleLevelController>(levelPrefabPath).Length;
        for (int i = 1; i < totalLevels + 1; i++)
        {
            EditorLoadLevel(i);
            // DO SOMETHING WITH THE CURRENT LEVEL
            // -----------------------------------
            EditorSaveLevel();
        }
    }

    public void EditorUnpackPrefab(GameObject currentObject, PrefabUnpackMode unpackMode, InteractionMode interactionMode)
    {
        EditorSaveLevel();
        GameObject prefabRoot = PrefabUtility.GetOutermostPrefabInstanceRoot(currentObject);
        if (prefabRoot != null)
        {
            PrefabUtility.UnpackPrefabInstance(prefabRoot, unpackMode, interactionMode);
        }
    }
#endif
}
