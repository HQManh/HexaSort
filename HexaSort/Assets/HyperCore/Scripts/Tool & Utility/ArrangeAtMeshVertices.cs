using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class ArrangeAtMeshVertices : MonoBehaviour
{
    [SerializeField] private Mesh mesh;
    [SerializeField] private Transform childPrefab;
    [SerializeField] private Vector3 angleOffset;
    [SerializeField] private float sizeScale = 1f;
    [SerializeField] private bool update;

#if UNITY_EDITOR
    private void OnValidate()
    {
        if (update)
        {
            update = false;
            for (int i = 0; i < mesh.vertices.Length; i++)
            {
                Transform p = (Transform)PrefabUtility.InstantiatePrefab(childPrefab, transform);
                p.position = mesh.vertices[i] + transform.position;
                p.localScale = Vector3.one * sizeScale;
                //p.transform.rotation = Quaternion.identity;
                p.LookAt(transform);
                p.localEulerAngles += angleOffset;
            }
        }
    }
#endif
}
