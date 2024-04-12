using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PiecePro : MonoBehaviour
{
    public int id = -1;
    [SerializeField]
    MeshRenderer meshRenderer;
    [SerializeField] private GameObject holder;
    public GameObject Holder => holder;

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
    public void SetLayer(int layer)
    {
        meshRenderer.gameObject.layer = layer;
    }
}
