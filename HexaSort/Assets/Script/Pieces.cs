using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pieces : MonoBehaviour
{
    public List<PiecePro> piecePros = new();

    private void OnMouseDrag()
    {
        var t = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        transform.position = (Vector2)t;
        foreach (var p in piecePros)
        {
            p.gameObject.layer = 2;
        }
        CurrentData.isPick = true;
        CurrentData.currentPick = piecePros;
    }

    private void OnMouseUp()
    {
        if(CurrentData.currenPlat == null)
        {
            foreach (var p in piecePros)
            {
                p.gameObject.layer = 0;
            }
        }
        else
        {
            StartCoroutine(CurrentData.currenPlat.SetPos());
            CurrentData.isPick = false;
        }

    }

}
