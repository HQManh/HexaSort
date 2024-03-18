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
                var a = temp.transform.parent.parent;
                a.parent = container;
                //LeanTween.moveLocal(a.gameObject, transform.localPosition - new Vector3(0f, 0f, 0.15f * (1 + pieces.Count +stt)), 0.25f);
                a.transform.localPosition = transform.localPosition - new Vector3(0f, 0f, 0.15f * (pieces.Count));
            }
        }
        GetAmount();
        StartCoroutine(CheckAround());
    }

    public void GetAmount()
    {
        for(int i=0;i<pieces.Count;i++)
        {
            if (numOfColor.ContainsKey(pieces[i].id))
            {
                numOfColor[pieces[i].id]++;
                if(numOfColor[pieces[i].id] == 10)
                {
                    Break(pieces[i].id);
                    numOfColor[pieces[i].id] = 0;
                    break;
                }
            }
            else
            {
                numOfColor[pieces[i].id] = 1;
            }
        }

    }

    void Break(int id)
    {
        int score = 0;
        while (pieces[^1].id == id)
        {
            pieces.RemoveAt(pieces.Count - 1);
            Destroy(pieces[^1]);
            score++; 
        }
    }


    public IEnumerator CheckAround()
    {
        bool isContinue = false;
        foreach (var t in neighbor)
        {
            if (pieces.Count == 0) break;
            if (t.pieces.Count == 0)
            {
                continue;
            }
            if (t.pieces[^1].id == pieces[^1].id)
            {
                int amount = numOfColor[t.pieces[^1].id];
                for(int i = 0; i < amount; i++)
                {
                    pieces[^1].transform.parent.parent.parent = t.container;
                    pieces[^1].transform.parent.parent.localPosition = t.pieces[^1].transform.parent.parent.localPosition -  new Vector3(0f, 0f, 0.15f);
                    t.pieces.Add(pieces[^1]);
                    pieces.RemoveAt(pieces.Count - 1);
                }
                isContinue = true;
                yield return null;
                numOfColor[t.pieces[^1].id] = 0;
                StartCoroutine(t.CheckAround());
            }
            yield return null;
        }
        if (isContinue)
        {
            StartCoroutine(CheckAround());
        }
        yield return null;
    }



}
