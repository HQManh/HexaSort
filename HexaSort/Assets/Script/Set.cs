using System.Collections;
using System.Collections.Generic;
using TreeEditor;
using UnityEngine;

public class Set : MonoBehaviour
{
    MeshRenderer mesh;
    [SerializeField]
    float max;
    [SerializeField]
    float min;
    [SerializeField]
    //[Range(min,max)]
    float currentProgress;

    void Start()
    {
        mesh = GetComponent<MeshRenderer>();
        max = mesh.bounds.size.y;
        min = 0;
    }
    

    public void SetProgress(float progress)
    {
        float dis = max - min;
        float value = min + dis * progress /100;
        mesh.material.SetFloat("_Fill",value);
    }


    private void Update()
    {
        SetProgress(currentProgress);
    }
}
