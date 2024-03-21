using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.SceneManagement;

[CustomEditor(typeof(AssetController))]
public class AssetControllerEditor : Editor
{
    public AssetController AssetController;

    public override void OnInspectorGUI()
    {
        AssetController = (AssetController)target;

        GUILayout.BeginVertical("BOX", new GUILayoutOption[] { GUILayout.Width(250), GUILayout.Height(30) });
        GUILayout.BeginHorizontal();
        GUILayout.BeginVertical();
        EditorGUILayout.LabelField("SKINS", EditorStyles.boldLabel, new GUILayoutOption[] { GUILayout.Width(40), GUILayout.Height(20) });

        for (int i = 0; i < AssetController.ListSkinItemData.Count; i++)
        {
            GUILayout.BeginHorizontal("BOX", new GUILayoutOption[] { GUILayout.Width(16) });

            GUILayout.BeginVertical("BOX");
            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Avatar", new GUILayoutOption[] { GUILayout.Width(128), GUILayout.Height(20) });
            AssetController.ListSkinSprites[i] = AssetController.ListSkinItemData[i].AvatarSprite =
                (Sprite)EditorGUILayout.ObjectField(AssetController.ListSkinSprites[i] == null ? AssetController.ListSkinItemData[i].AvatarSprite : AssetController.ListSkinSprites[i],
                typeof(Sprite), allowSceneObjects: true);
            if (AssetController.ListSkinItemData[i].AvatarSprite != null)
            {
                GUILayout.Label(AssetController.ListSkinItemData[i].AvatarSprite.texture,
                    new GUILayoutOption[] { GUILayout.Width(64), GUILayout.Height(64) });
            }
            EditorGUILayout.Space();

            EditorGUILayout.Space();

            GUILayout.EndVertical();

            GUILayout.BeginVertical("BOX", new GUILayoutOption[] { GUILayout.Width(64) });
            EditorGUILayout.Space();

            GUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("ID: ");
            AssetController.ListSkinItemData[i].ID = EditorGUILayout.IntField(AssetController.ListSkinItemData[i].ID,
                new GUILayoutOption[] { GUILayout.Width(128), GUILayout.Height(20) });
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            AssetController.ListSkinItemData[i].UnlockBy = (UnlockConditions)EditorGUILayout.EnumPopup("Unlock By: ",
                AssetController.ListSkinItemData[i].UnlockBy);
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Unlock Total: ");
            AssetController.ListSkinItemData[i].UCTotal = EditorGUILayout.IntField(AssetController.ListSkinItemData[i].UCTotal,
                new GUILayoutOption[] { GUILayout.Width(128), GUILayout.Height(20) });
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Mission: ");
            AssetController.ListSkinItemData[i].UCDesc = EditorGUILayout.TextArea(AssetController.ListSkinItemData[i].UCDesc,
                new GUILayoutOption[] { GUILayout.Width(128), GUILayout.Height(64) });
            GUILayout.EndHorizontal();

            //EditorGUILayout.LabelField("Model", new GUILayoutOption[] { GUILayout.Width(128), GUILayout.Height(20) });
            //AssetController.ListItemData[i].Model = 
            //    (Mesh)EditorGUILayout.ObjectField(AssetController.ListItemData[i].Model == null ? DefaultModel : AssetController.ListItemData[i].Model, 
            //    typeof(Mesh), allowSceneObjects: true);

            EditorGUILayout.Space(); EditorGUILayout.Space(); EditorGUILayout.Space(); EditorGUILayout.Space();

            GUILayout.BeginHorizontal("BOX");
            if (GUILayout.Button("Remove", new GUILayoutOption[] { GUILayout.Width(100), GUILayout.Height(30) }))
            {
                AssetController.RemoveSkin(i);
            }
            GUILayout.EndHorizontal();

            GUILayout.EndVertical();
            GUILayout.EndHorizontal();
            EditorGUILayout.Space(); EditorGUILayout.Space(); EditorGUILayout.Space(); EditorGUILayout.Space();
        }

        GUILayout.BeginHorizontal("BOX");
        if (GUILayout.Button("Add Skin", new GUILayoutOption[] { GUILayout.Width(200), GUILayout.Height(40) }))
        {
            AssetController.AddSkin();
        }
        GUILayout.EndHorizontal();
        GUILayout.EndHorizontal();
        GUILayout.EndVertical();
        GUILayout.EndVertical();

        if (GUI.changed)
        {
            EditorUtility.SetDirty(AssetController);
            EditorSceneManager.MarkSceneDirty(SceneManager.GetActiveScene());
        }
    }
}
