using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pieces : MonoBehaviour
{
    public List<PiecePro> piecePros = new();
    Vector3 startPos;

    private void Start()
    {
        startPos = transform.localPosition;
    }

    private void OnMouseDown()
    {
        foreach (var p in piecePros)
        {
            p.gameObject.layer = 2;
        }
        CurrentData.isPick = true;
        CurrentData.currentPick = piecePros;
    }

    private void OnMouseDrag()
    {
        var t = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        transform.position = (Vector2)t;
    }

    private void OnMouseUp()
    {
        if(CurrentData.currenPlat == null)
        {
            foreach (var p in piecePros)
            {
                p.gameObject.layer = 0;
            }
            LeanTween.moveLocal(gameObject, startPos, 0.2f);
        }
        else
        {
            CurrentData.currenPlat.SetPos();
            CurrentData.Instance.CheckPiece();
            CurrentData.isPick = false;
            Destroy(this.transform.GetChild(0).gameObject);
            transform.localPosition = startPos;
        }
        
    }


}
