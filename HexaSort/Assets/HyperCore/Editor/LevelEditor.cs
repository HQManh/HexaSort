using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.SceneManagement;

[CustomEditor(typeof(LevelController))]
public class LevelEditor : Editor
{
    private LevelController levelController;
    private bool showResources = false;

    public override void OnInspectorGUI()
    {
        levelController = (LevelController)target;
        GUIStyle headerStyle = new GUIStyle();
        headerStyle.richText = true;
        headerStyle.fontStyle = FontStyle.Bold;

        GUILayout.BeginHorizontal("BOX");
        if (GUILayout.Button("SAVE ALL", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(40) }))
        {
            levelController.EditorSaveAll();
        }
        GUILayout.EndHorizontal();
        GUILayout.BeginHorizontal("BOX");
        if (GUILayout.Button((showResources ? "Hide" : "Show") + " Map Resources", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(40) }))
        {
            showResources = !showResources;
        }
        GUILayout.EndHorizontal();
        if (showResources)
        {
            //---- RESOURCES SETUP
            GUILayout.BeginVertical("BOX", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(30) });
            EditorGUILayout.LabelField("<color=cyan>MAP RESOURCES</color>", headerStyle, new GUILayoutOption[] { });

            // Floor
            //GUILayout.BeginVertical("BOX", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(30) });
            //EditorGUILayout.LabelField("<color=yellow>Floor</color>", headerStyle);
            //GUILayout.BeginHorizontal();
            //GUILayout.BeginVertical();
            //EditorGUILayout.LabelField("Floor", new GUILayoutOption[] { GUILayout.Width(100), GUILayout.Height(20) });
            //GUILayout.EndVertical();
            //GUILayout.BeginVertical();
            //levelController.FloorPrefab = (GameObject)EditorGUILayout.ObjectField(levelController.FloorPrefab,
            //    typeof(GameObject), allowSceneObjects: false);
            //GUILayout.EndVertical();
            //GUILayout.EndHorizontal();
            //GUILayout.EndVertical();
            // Obstacle
            //GUILayout.BeginVertical("BOX", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(30) });
            //EditorGUILayout.LabelField("<color=yellow>Obstacles</color>", headerStyle);
            //if (Utility.GetEnumLength<ObstacleType>() > levelController.ObstaclePrefabs.Length)
            //{
            //    Array.Resize(ref levelController.ObstaclePrefabs, Utility.GetEnumLength<ObstacleType>());
            //}
            //for (int i = 0; i < Utility.GetEnumLength<ObstacleType>(); i++)
            //{
            //    GUILayout.BeginHorizontal();
            //    GUILayout.BeginVertical();
            //    EditorGUILayout.LabelField(((ObstacleType)i).ToString(), new GUILayoutOption[] { GUILayout.Width(100), GUILayout.Height(20) });
            //    GUILayout.EndVertical();
            //    GUILayout.BeginVertical();
            //    levelController.ObstaclePrefabs[i] = (GameObject)EditorGUILayout.ObjectField(levelController.ObstaclePrefabs[i],
            //        typeof(GameObject), allowSceneObjects: false);
            //    GUILayout.EndVertical();
            //    GUILayout.EndHorizontal();
            //}
            //GUILayout.EndVertical();
            // Loot
            //GUILayout.BeginVertical("BOX", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(30) });
            //EditorGUILayout.LabelField("<color=yellow>Loots</color>", headerStyle);
            //if (Utility.GetEnumLength<LootType>() > levelController.LootPrefabs.Length)
            //{
            //    Array.Resize(ref levelController.LootPrefabs, Utility.GetEnumLength<LootType>());
            //}
            //for (int i = 0; i < Utility.GetEnumLength<LootType>(); i++)
            //{
            //    GUILayout.BeginHorizontal();
            //    GUILayout.BeginVertical();
            //    EditorGUILayout.LabelField(((LootType)i).ToString(), new GUILayoutOption[] { GUILayout.Width(100), GUILayout.Height(20) });
            //    GUILayout.EndVertical();
            //    GUILayout.BeginVertical();
            //    levelController.LootPrefabs[i] = (GameObject)EditorGUILayout.ObjectField(levelController.LootPrefabs[i],
            //        typeof(GameObject), allowSceneObjects: false);
            //    GUILayout.EndVertical();
            //    GUILayout.EndHorizontal();
            //}
            //GUILayout.EndVertical();
            // Trap
            //GUILayout.BeginVertical("BOX", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(30) });
            //EditorGUILayout.LabelField("<color=yellow>Traps</color>", headerStyle);
            //if (Utility.GetEnumLength<TrapType>() > levelController.TrapPrefabs.Length)
            //{
            //    Array.Resize(ref levelController.TrapPrefabs, Utility.GetEnumLength<TrapType>());
            //}
            //for (int i = 0; i < Utility.GetEnumLength<TrapType>(); i++)
            //{
            //    GUILayout.BeginHorizontal();
            //    GUILayout.BeginVertical();
            //    EditorGUILayout.LabelField(((TrapType)i).ToString(), new GUILayoutOption[] { GUILayout.Width(100), GUILayout.Height(20) });
            //    GUILayout.EndVertical();
            //    GUILayout.BeginVertical();
            //    levelController.TrapPrefabs[i] = (GameObject)EditorGUILayout.ObjectField(levelController.TrapPrefabs[i],
            //        typeof(GameObject), allowSceneObjects: false);
            //    GUILayout.EndVertical();
            //    GUILayout.EndHorizontal();
            //}
            //GUILayout.EndVertical();

            GUILayout.EndVertical();
            //---- END OF RESOURCES SETUP
        }

        EditorGUILayout.Space();
        GUILayout.BeginVertical();
        GUILayout.BeginHorizontal("BOX");
        if (GUILayout.Button("CREATE NEW LEVEL", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(40) }))
        {
            levelController.EditorAddLevel();
        }
        GUILayout.EndHorizontal();
        GUILayout.EndVertical();
        EditorGUILayout.Space();

        //---- LEVEL SETUP
        GUILayout.BeginVertical("BOX", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(30) });
        GUILayout.BeginVertical();
        EditorGUILayout.LabelField("<color=cyan>LEVEL</color>", headerStyle, new GUILayoutOption[] { GUILayout.Width(40), GUILayout.Height(20) });
        GUILayout.EndVertical();
        GUILayout.BeginHorizontal();
        GUILayout.BeginVertical();
        levelController.CurrentLevel = EditorGUILayout.IntField(levelController.CurrentLevel, new GUILayoutOption[] { GUILayout.Width(48), GUILayout.Height(20) });
        GUILayout.EndVertical();
        GUILayout.BeginVertical();
        GUILayout.FlexibleSpace();
        if (GUILayout.Button("LOAD", new GUILayoutOption[] { GUILayout.MaxWidth(80), GUILayout.Height(25) }))
        {
            levelController.EditorLoadLevel(levelController.CurrentLevel);
        }
        GUILayout.EndVertical();
        GUILayout.BeginVertical();
        GUILayout.FlexibleSpace();
        if (GUILayout.Button("LOAD NEXT", new GUILayoutOption[] { GUILayout.MaxWidth(80), GUILayout.Height(25) }))
        {
            levelController.EditorLoadNextLevel();
        }
        GUILayout.EndVertical();
        GUILayout.BeginVertical();
        GUILayout.FlexibleSpace();
        if (GUILayout.Button("CLONE", new GUILayoutOption[] { GUILayout.MaxWidth(80), GUILayout.Height(25) }))
        {
            levelController.EditorCloneLevel(levelController.CurrentLevel);
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        GUILayout.EndHorizontal();

        EditorGUILayout.Space();
        EditorGUILayout.Space();
        GUILayout.BeginHorizontal();
        if (GUILayout.Button("SAVE LEVEL", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(40) }))
        {
            levelController.EditorSaveLevel();
        }
        GUILayout.EndHorizontal();
        GUILayout.EndVertical();

        // Spawn Point


        // Floor
        //GUILayout.BeginVertical("BOX");
        //EditorGUILayout.LabelField("<color=yellow>Floors</color>", headerStyle);
        //GUILayout.BeginVertical("BOX");
        //GUILayout.BeginHorizontal();
        //GUILayout.BeginVertical();
        //EditorGUILayout.LabelField("Floor", new GUIStyle(GUI.skin.label) { alignment = TextAnchor.MiddleLeft },
        //    new GUILayoutOption[] { GUILayout.Width(80), GUILayout.Height(20) });
        //GUILayout.EndVertical();
        //GUILayout.BeginVertical();
        //levelController.NumFloors = EditorGUILayout.IntField(levelController.NumFloors,
        //    new GUIStyle(GUI.skin.textField) { alignment = TextAnchor.MiddleLeft },
        //    new GUILayoutOption[] { GUILayout.Width(48), GUILayout.Height(20) });
        //GUILayout.EndVertical();
        //EditorGUILayout.Space();
        //GUILayout.BeginVertical();
        //GUILayout.FlexibleSpace();
        //if (GUILayout.Button("SET", new GUILayoutOption[] { GUILayout.MaxWidth(60), GUILayout.Height(25) }))
        //{
        //    levelController.EditorUpdateNumFloor();
        //}
        //GUILayout.EndVertical();
        //GUILayout.EndHorizontal();
        //GUILayout.EndVertical();
        //GUILayout.EndVertical();

        // Obstacle
        //GUILayout.BeginVertical("BOX");
        //EditorGUILayout.LabelField("<color=yellow>Obstacles</color>", headerStyle);
        //if (Utility.GetEnumLength<ObstacleType>() > levelController.NumObstacles.Length)
        //{
        //    Array.Resize(ref levelController.NumObstacles, Utility.GetEnumLength<ObstacleType>());
        //}
        //if (GUILayout.Button("RELINK ALL OBSTACLES", new GUILayoutOption[] { GUILayout.MaxWidth(250), GUILayout.Height(25) }))
        //{
        //    levelController.EditorRelinkAllObstacles();
        //}
        //for (int i = 0; i < Utility.GetEnumLength<ObstacleType>(); i++)
        //{
        //    GUILayout.BeginVertical("BOX");
        //    GUILayout.BeginHorizontal();
        //    GUILayout.BeginVertical();
        //    EditorGUILayout.LabelField(((ObstacleType)i).ToString(), new GUIStyle(GUI.skin.label) { alignment = TextAnchor.MiddleLeft },
        //        new GUILayoutOption[] { GUILayout.Width(80), GUILayout.Height(20) });
        //    GUILayout.EndVertical();
        //    GUILayout.BeginVertical();
        //    levelController.NumObstacles[i] = EditorGUILayout.IntField(levelController.NumObstacles[i], new GUIStyle(GUI.skin.textField) { alignment = TextAnchor.MiddleLeft },
        //        new GUILayoutOption[] { GUILayout.Width(48), GUILayout.Height(20) });
        //    GUILayout.EndVertical();
        //    EditorGUILayout.Space();
        //    GUILayout.BeginVertical();
        //    GUILayout.FlexibleSpace();
        //    if (GUILayout.Button("SET", new GUILayoutOption[] { GUILayout.MaxWidth(60), GUILayout.Height(25) }))
        //    {
        //        levelController.EditorUpdateNumObstacle(i);
        //    }
        //    GUILayout.EndVertical();
        //    GUILayout.EndHorizontal();
        //    GUILayout.EndVertical();
        //}
        //GUILayout.EndVertical();

        // Loot
        //GUILayout.BeginVertical("BOX");
        //EditorGUILayout.LabelField("<color=yellow>Loots</color>", headerStyle);
        //if (Utility.GetEnumLength<LootType>() > levelController.NumLoots.Length)
        //{
        //    Array.Resize(ref levelController.NumLoots, Utility.GetEnumLength<LootType>());
        //}
        //for (int i = 0; i < Utility.GetEnumLength<LootType>(); i++)
        //{
        //    GUILayout.BeginVertical("BOX");
        //    GUILayout.BeginHorizontal();
        //    GUILayout.BeginVertical();
        //    EditorGUILayout.LabelField(((LootType)i).ToString(), new GUIStyle(GUI.skin.label) { alignment = TextAnchor.MiddleLeft },
        //        new GUILayoutOption[] { GUILayout.Width(80), GUILayout.Height(20) });
        //    GUILayout.EndVertical();
        //    GUILayout.BeginVertical();
        //    levelController.NumLoots[i] = EditorGUILayout.IntField(levelController.NumLoots[i], new GUIStyle(GUI.skin.textField) { alignment = TextAnchor.MiddleLeft },
        //        new GUILayoutOption[] { GUILayout.Width(48), GUILayout.Height(20) });
        //    GUILayout.EndVertical();
        //    EditorGUILayout.Space();
        //    GUILayout.BeginVertical();
        //    GUILayout.FlexibleSpace();
        //    if (GUILayout.Button("SET", new GUILayoutOption[] { GUILayout.MaxWidth(60), GUILayout.Height(25) }))
        //    {
        //        levelController.EditorUpdateNumLoot(i);
        //    }
        //    GUILayout.EndVertical();
        //    GUILayout.EndHorizontal();
        //    GUILayout.EndVertical();
        //}
        //GUILayout.EndVertical();

        // Trap
        //GUILayout.BeginVertical("BOX");
        //EditorGUILayout.LabelField("<color=yellow>Traps</color>", headerStyle);
        //if (Utility.GetEnumLength<TrapType>() > levelController.NumTraps.Length)
        //{
        //    Array.Resize(ref levelController.NumTraps, Utility.GetEnumLength<TrapType>());
        //}
        //for (int i = 0; i < Utility.GetEnumLength<TrapType>(); i++)
        //{
        //    GUILayout.BeginVertical("BOX");
        //    GUILayout.BeginHorizontal();
        //    GUILayout.BeginVertical();
        //    EditorGUILayout.LabelField(((TrapType)i).ToString(), new GUIStyle(GUI.skin.label) { alignment = TextAnchor.MiddleLeft },
        //        new GUILayoutOption[] { GUILayout.Width(80), GUILayout.Height(20) });
        //    GUILayout.EndVertical();
        //    GUILayout.BeginVertical();
        //    levelController.NumTraps[i] = EditorGUILayout.IntField(levelController.NumTraps[i], new GUIStyle(GUI.skin.textField) { alignment = TextAnchor.MiddleLeft },
        //        new GUILayoutOption[] { GUILayout.Width(48), GUILayout.Height(20) });
        //    GUILayout.EndVertical();
        //    EditorGUILayout.Space();
        //    GUILayout.BeginVertical();
        //    GUILayout.FlexibleSpace();
        //    if (GUILayout.Button("SET", new GUILayoutOption[] { GUILayout.MaxWidth(60), GUILayout.Height(25) }))
        //    {
        //        levelController.EditorUpdateNumTrap(i);
        //    }
        //    GUILayout.EndVertical();
        //    GUILayout.EndHorizontal();
        //    GUILayout.EndVertical();
        //}
        //GUILayout.EndVertical();


        GUILayout.BeginVertical("BOX");
        GUILayout.BeginHorizontal();
        if (GUILayout.Button("SAVE LEVEL", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(40) }))
        {
            levelController.EditorSaveLevel();
        }
        GUILayout.EndHorizontal();
        GUILayout.EndVertical();

        if (GUI.changed)
        {
            EditorUtility.SetDirty(levelController);
            EditorSceneManager.MarkSceneDirty(SceneManager.GetActiveScene());
        }
    }
}
