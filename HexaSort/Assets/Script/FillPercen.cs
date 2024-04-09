using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FillPercen : MonoBehaviour
{
    [SerializeField]
    float percen;
    MeshRenderer mesh;


    // Start is called before the first frame update
    void Start()
    {
        GetInfo();
    }

    void GetInfo()
    {
        mesh = GetComponent<MeshRenderer>();
        Debug.Log("Max Height " + (transform.position.y + mesh.bounds.size.y));
        Debug.Log("Min Height " + (transform.position.y - mesh.bounds.size.y));
    }
}
