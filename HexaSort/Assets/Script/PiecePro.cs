using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PiecePro : MonoBehaviour
{
    public int id = -1;
    [SerializeField]
    MeshRenderer meshRenderer;

    private void Start()
    {
        if(id != -1)
        {
            SetColor();
        }
    }

    public void SetColor()
    {
        meshRenderer.material = CurrentData.Instance.materialsColor[id];
    }
}
