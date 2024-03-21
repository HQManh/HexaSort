using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class LevelEditor : MonoBehaviour
{
    public class PlatPro
    {
        public PlatType type;
        public int scoreOpen;
    }

    public Vector2 size;
    public List<List<PlatPro>> platList=new();

    public void CreateList()
    {
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
        Debug.Log("Created");
    }
   
    public void CreateGrid()
    {

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
        srcollPosition = EditorGUILayout.BeginScrollView(srcollPosition);

        GUILayout.BeginHorizontal(GUILayout.ExpandWidth(true));
        GUILayout.BeginVertical(GUILayout.ExpandHeight(true));

        for(int i = 0; i < levelEditor.platList.Count; i++)
        {
            GUILayout.BeginHorizontal("BOX");
            for(int j=0; j < levelEditor.platList[0].Count ; j++)
            {
                GUILayout.BeginVertical("BOX", GUILayout.Width(250), GUILayout.ExpandHeight(true));
                levelEditor.platList[i][j].type =  (PlatType)EditorGUILayout.EnumPopup("Type",levelEditor.platList[i][j].type);
                if (levelEditor.platList[i][j].type == PlatType.Lock)
                {
                    EditorGUILayout.Space();
                    levelEditor.platList[i][j].scoreOpen = EditorGUILayout.IntField("Score to Open", levelEditor.platList[i][j].scoreOpen);
                }
                GUILayout.EndVertical();
            }
            GUILayout.EndHorizontal();
        }
        GUILayout.EndHorizontal();
        GUILayout.EndVertical();
        EditorGUILayout.EndScrollView();
    }
}