#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.IO;

public class AnimationPathReplacer : EditorWindow
{
	private static int columnWidth = 300;

	private List<AnimationClip> animationClips;
	private ArrayList pathsKeys;
	private Hashtable paths;

	private Vector2 scrollPos = Vector2.zero;

	[MenuItem("Window/Animation Path Replacer")]
	static void ShowWindow()
	{
		EditorWindow.GetWindow<AnimationPathReplacer>();
	}

	public AnimationPathReplacer()
	{
		animationClips = new List<AnimationClip>();
	}

	void OnSelectionChange()
	{
		refreshSelection();
	}

	private void refreshSelection()
	{
		if (Selection.objects.Length > 1)
		{
			animationClips.Clear();
			foreach (Object o in Selection.objects)
			{
				if (o is AnimationClip) animationClips.Add((AnimationClip)o);
			}
			FillModel();
		}
		else if (Selection.activeObject is AnimationClip)
		{
			animationClips.Clear();
			animationClips.Add((AnimationClip)Selection.activeObject);
			FillModel();
		}
		else
		{
			animationClips.Clear();
		}

		this.Repaint();
	}

	private string sOriginalRoot = "OldPath/Old";
	private string sNewRoot = "NewPath/New";

	void OnGUI()
	{
		if (Event.current.type == EventType.ValidateCommand)
		{
			switch (Event.current.commandName)
			{
				case "UndoRedoPerformed":
					FillModel();
					break;
			}
		}

		if (animationClips.Count > 0)
		{
			scrollPos = GUILayout.BeginScrollView(scrollPos, GUIStyle.none);

			EditorGUILayout.BeginHorizontal();
			GUILayout.Label("Animation Clip:", GUILayout.Width(columnWidth));

			if (animationClips.Count == 1)
			{
				animationClips[0] = ((AnimationClip)EditorGUILayout.ObjectField(
					animationClips[0],
					typeof(AnimationClip),
					true,
					GUILayout.Width(columnWidth))
									 );
			}
			else
			{
				GUILayout.Label("Multiple Anim Clips: " + animationClips.Count, GUILayout.Width(columnWidth));
			}
			EditorGUILayout.EndHorizontal();

			GUILayout.Space(20);

			EditorGUILayout.BeginHorizontal();

			sOriginalRoot = EditorGUILayout.TextField(sOriginalRoot, GUILayout.Width(columnWidth));
			sNewRoot = EditorGUILayout.TextField(sNewRoot, GUILayout.Width(columnWidth));

			EditorGUILayout.EndHorizontal();
			EditorGUILayout.BeginHorizontal();

			if (GUILayout.Button("Replace Path"))
			{
				ReplacePath(sOriginalRoot, sNewRoot);
			}
			EditorGUILayout.EndHorizontal();



			EditorGUILayout.BeginHorizontal();
			GUILayout.Label("Paths in Clip:", GUILayout.Width(columnWidth));
			GUILayout.Label("Animated properties:", GUILayout.Width(columnWidth * 0.5f));
			EditorGUILayout.EndHorizontal();

			if (paths != null)
			{
				foreach (string path in pathsKeys)
				{
					GUICreatePathItem(path);
				}
			}

			GUILayout.Space(40);
			GUILayout.EndScrollView();
		}
		else
		{
			GUILayout.Label("Please select an Animation Clip");
		}
	}


	void GUICreatePathItem(string path)
	{

		ArrayList properties = (ArrayList)paths[path];

		EditorGUILayout.BeginHorizontal();

		EditorGUILayout.LabelField(path, GUILayout.Width(columnWidth));

		EditorGUILayout.LabelField(
			properties != null ? properties.Count.ToString() : "0",
			GUILayout.Width(60)
			);

		EditorGUILayout.EndHorizontal();
	}

	void OnInspectorUpdate()
	{
		this.Repaint();
	}

	void FillModel()
	{
		paths = new Hashtable();
		pathsKeys = new ArrayList();

		foreach (AnimationClip animationClip in animationClips)
		{
			FillModelWithCurves(AnimationUtility.GetCurveBindings(animationClip));
			FillModelWithCurves(AnimationUtility.GetObjectReferenceCurveBindings(animationClip));
		}
	}

	private void FillModelWithCurves(EditorCurveBinding[] curves)
	{
		foreach (EditorCurveBinding curveData in curves)
		{
			string key = curveData.path;

			if (paths.ContainsKey(key))
			{
				((ArrayList)paths[key]).Add(curveData);
			}
			else
			{
				ArrayList newProperties = new ArrayList();
				newProperties.Add(curveData);
				paths.Add(key, newProperties);
				pathsKeys.Add(key);
			}
		}
	}

	void ReplacePath(string oldPath, string newPath)
	{
		AssetDatabase.StartAssetEditing();

		for (int iCurrentClip = 0; iCurrentClip < animationClips.Count; iCurrentClip++)
		{
			AnimationClip animationClip = animationClips[iCurrentClip];
			Undo.RecordObject(animationClip, "Animation Path Replacement");

			string assetPath = AssetDatabase.GetAssetPath(animationClip);

			string fileContents = File.ReadAllText(assetPath);
			string newFileContents = "";

			int replacementCount = 0;
			string[] allLines = fileContents.Split("\r\n".ToCharArray());
			for (int i = 0; i < allLines.Length; ++i)
			{
				if (allLines[i].Contains("path: "))
				{
					string replacedLine = allLines[i].Replace(oldPath, newPath);
					if (allLines[i] != replacedLine)
					{
						allLines[i] = replacedLine;
						replacementCount++;
					}
				}
				newFileContents += allLines[i] + "\r\n";
			}

			if (replacementCount > 0)
			{
				File.WriteAllText(assetPath, newFileContents);
			}

			Debug.Log("Replaced " + replacementCount + " paths in " + assetPath);
		}
		AssetDatabase.StopAssetEditing();
		EditorUtility.ClearProgressBar();

		AssetDatabase.Refresh();

		refreshSelection();
	}
}
#endif