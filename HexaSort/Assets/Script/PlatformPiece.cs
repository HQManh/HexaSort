using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlatformPiece : MonoBehaviour
{
    List<Pieces> pieces = new();
    public List<PlatformPiece> neighbor = new();
    MeshRenderer meshRenderer;

    private void Start()
    {
        meshRenderer = GetComponent<MeshRenderer>();
        if(CurrentData.Instance != null )
        {
            meshRenderer.material = CurrentData.Instance.materials[0];
        }
    }


    private void OnMouseEnter()
    {
        meshRenderer.material = CurrentData.Instance.materials[1];
    }

    private void OnMouseExit()
    {
        meshRenderer.material = CurrentData.Instance.materials[0];
    }
}
