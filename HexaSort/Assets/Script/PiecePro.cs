using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PiecePro : MonoBehaviour
{
    public int id;
    [SerializeField]
    MeshRenderer meshRenderer;

    public void SetColor()
    {
        meshRenderer.material = CurrentData.Instance.materials[id];
    }
}
