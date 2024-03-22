using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class PlatPro
{
    public PlatType type;
    public int scoreOpen;
    public string preList;
}

public class LevelEditor : MonoBehaviour
{
    public Vector2 size;
    public List<List<PlatPro>> platList=new();
    PlatformGenerator platform;


    public void CreateList()
    {
        platform = GetComponent<PlatformGenerator>();
        platList.Clear();  
        for(int i=0; i < size.x; i++)
        {
            List<PlatPro> platProList = new();
            for(int j=0;j < size.y; j++)
            {
                var t = new PlatPro();
                platProList.Add(t);
            }
            platList.Add(platProList);
        }
    }
   
    public void CreateGrid()
    {
        platform.SetUp(size, platList);
    }

    public void DestroyChild()
    {
        platform.DestroyChild();
    }
}


[CustomEditor(typeof(LevelEditor))]
public class LevelEditorMain: Editor
{
    public LevelEditor levelEditor;
    private Vector2 srcollPosition;

    public override void OnInspectorGUI()
    {
        levelEditor = (LevelEditor)target;
        levelEditor.size = EditorGUILayout.Vector2Field("Size", levelEditor.size);
        if(GUILayout.Button("Create List"))
        {
            levelEditor.CreateList();
        }

        if (GUILayout.Button("Create Grid"))
        {
            levelEditor.CreateGrid();
        }

        if (GUILayout.Button("Destroy Child"))
        {
            levelEditor.DestroyChild();
        }
        srcollPosition = EditorGUILayout.BeginScrollView(srcollPosition);

        GUILayout.BeginHorizontal(GUILayout.ExpandWidth(true));
        GUILayout.BeginVertical(GUILayout.ExpandHeight(true));

        for(int i = 0; i < levelEditor.platList.Count; i++)
        {
            float xOffset = i % 2 == 0 ? 0 : 400;
            GUILayout.BeginHorizontal("BOX");
            for(int j=0; j < levelEditor.platList[0].Count ; j++)
            {
                EditorGUILayout.BeginHorizontal();
                GUILayout.Space(xOffset);
                GUILayout.BeginHorizontal("BOX", GUILayout.Width(64));
                GUILayout.BeginVertical("BOX", GUILayout.ExpandHeight(true));

                levelEditor.platList[i][j].type =  (PlatType)EditorGUILayout.EnumPopup("Type",levelEditor.platList[i][j].type);
                if (levelEditor.platList[i][j].type == PlatType.Lock)
                {
                    EditorGUILayout.Space();
                    levelEditor.platList[i][j].scoreOpen = EditorGUILayout.IntField("Score to Open", levelEditor.platList[i][j].scoreOpen);
                }
                if (levelEditor.platList[i][j].type == PlatType.Open)
                {
                    levelEditor.platList[i][j].preList = EditorGUILayout.TextField("Pre List", levelEditor.platList[i][j].preList);
                }
                GUILayout.EndVertical();
                GUILayout.EndHorizontal();
                EditorGUILayout.EndHorizontal();
            }
            GUILayout.EndHorizontal();
        }
        GUILayout.EndHorizontal();
        GUILayout.EndVertical();
        EditorGUILayout.EndScrollView();
    }
}