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

    private void OnMouseDrag()
    {
        var t = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        transform.position = (Vector2)t;
        foreach (var p in piecePros)
        {
            p.gameObject.layer = 2;
        }
        CurrentData.isPick = true;
        CurrentData.currentPick = this;
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
            CurrentData.currenPlat.SetPos();
            CurrentData.Instance.CheckPiece();
            CurrentData.isPick = false;
            Destroy(this.transform.GetChild(0).gameObject);
        }
        transform.localPosition = startPos;

    }


}
