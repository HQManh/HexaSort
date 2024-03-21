using UnityEngine;
using UnityEditor;

public class MaterialGenerator
{
#if UNITY_EDITOR
    [MenuItem("AP/Create Materials From Sample")]
    private static void CreateMaterialsFromSample()
    {
        if (Application.isPlaying) return;
        Material sample = null;
        foreach (Object o in Selection.objects)
        {
            if (o.GetType() == typeof(Material))
            {
                sample = o as Material;
                break;
            }
        }
        if(sample == null)
        {
            Debug.LogError("Please also select a sample material to start.");
            return;
        }
        foreach (Object o in Selection.objects)
        {

            if (o.GetType() != typeof(Texture2D))
            {
                Debug.LogWarning("Skipping this since it isn't a texture: " + o);
                continue;
            }

            Debug.Log("Creating material from: " + o);

            Texture2D selected = o as Texture2D;

            Material material = new Material(sample);
            material.mainTexture = (Texture)o;

            string savePath = AssetDatabase.GetAssetPath(selected);
            savePath = savePath.Substring(0, savePath.LastIndexOf('/') + 1);

            string newAssetName = savePath + selected.name + ".mat";

            AssetDatabase.CreateAsset(material, newAssetName);

            AssetDatabase.SaveAssets();

        }
        Debug.Log("Done!");
    }
#endif
}