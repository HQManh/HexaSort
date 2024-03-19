using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlatformPiece : MonoBehaviour
{
    public List<PiecePro> pieces = new();
    Dictionary<int, int> numOfColor = new();
    public List<PlatformPiece> neighbor = new();
    public Transform container;
    MeshRenderer meshRenderer;

    private void Start()
    {
        meshRenderer = GetComponent<MeshRenderer>();
        if(CurrentData.Instance != null )
        {
            CurrentData.freePieces++;
            meshRenderer.material = CurrentData.Instance.materials[0];
        }
    }


    private void OnMouseEnter()
    {
        if(pieces.Count != 0)
        {
            return;
        }
        meshRenderer.material = CurrentData.Instance.materials[1];
        CurrentData.currenPlat = this;
    }

    private void OnMouseExit()
    {
        meshRenderer.material = CurrentData.Instance.materials[0];
        CurrentData.currenPlat = null;
    }

    public void SetPos()
    {
        if (CurrentData.isPick)
        {
            var t = CurrentData.currentPick.piecePros;
            foreach(var temp in t)
            {
                pieces.Add(temp);
                var a = temp.transform;
                a.parent = container;
                //LeanTween.moveLocal(a.gameObject, transform.localPosition - new Vector3(0f, 0f, 0.15f * (1 + pieces.Count +stt)), 0.25f);
                a.transform.localPosition = transform.localPosition - new Vector3(0f, 0f, 0.35f * (pieces.Count));
            }
            GetAmount();
            CheckAround();
        }

    }

    public void GetAmount()
    {
        numOfColor.Clear();
        for(int i=0;i<pieces.Count;i++)
        {
            if (numOfColor.ContainsKey(pieces[i].id))
            {
                numOfColor[pieces[i].id]++;
            }
            else
            {
                numOfColor[pieces[i].id] = 1;
            }
        }

    }

    public void CheckBreak()
    {
        GetAmount();
        if (pieces.Count == 0) return;
        if (numOfColor[pieces[^1].id] >= 10)
        {
            int id = pieces[^1].id;
            int a = numOfColor[pieces[^1].id];
            for(int i=0; i< a; i++)
            {
                var t = pieces[^1];
                Destroy(t.gameObject);
                pieces.RemoveAt(pieces.Count -1);
            }
            numOfColor[id] = 0;
            CurrentData.Instance.UpdateScore(a);
            CheckAround();
        }

    }


    public void CheckAround()
    {
        GetAmount();
        int count = 0;
        //int id = pieces[^1].id;
        List<PlatformPiece> platformPieces = new();
        foreach (var t in neighbor)
        {
            if (pieces.Count == 0) break;
            if (t.pieces.Count == 0)
            {
                continue;
            }
            if (t.pieces[^1].id == pieces[^1].id)
            {
                count++;
                platformPieces.Add(t);
                int amount = numOfColor[t.pieces[^1].id];
                MovingPiece m = new()
                {
                    from = this,
                    to = t,
                    amount = amount,
                };
                CurrentData.movingStack.Push(m);
                //for(int i = 0; i < amount; i++)
                //{
                //    pieces[^1].transform.parent.parent.parent = t.container;
                //    pieces[^1].transform.parent.parent.localPosition = t.pieces[^1].transform.parent.parent.localPosition -  new Vector3(0f, 0f, 0.15f);
                //    t.pieces.Add(pieces[^1]);
                //    pieces.RemoveAt(pieces.Count - 1);
                //}
                //isContinue = true;
                //yield return null;
                //numOfColor[t.pieces[^1].id] = 0;
                //StartCoroutine(t.CheckAround());
                //CurrentData.desPiece.Add(t);
            }
            //if(count != 0)
            //{
            //    switch (count)
            //    {
            //        case 1:

            //            break;
            //        case 2:

            //            break;
            //        default:
                        
            //            break;
            //    }
            //}

        }
    }



}
