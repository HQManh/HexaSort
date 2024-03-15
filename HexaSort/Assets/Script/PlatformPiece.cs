using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEditor.Experimental.GraphView;
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

    public IEnumerator SetPos()
    {
        if (CurrentData.isPick)
        {
            var t = CurrentData.currentPick;
            int stt = 0;
            foreach(var temp in t)
            {
                pieces.Add(temp);
                var a = temp.transform.parent.parent;
                a.parent = container;
                LeanTween.moveLocal(a.gameObject, transform.localPosition - new Vector3(0f, 0f, 0.15f * (1 + pieces.Count +stt)), 0.25f);
                yield return new WaitForSeconds(0.05f);
                stt++;
            }
        }
        GetAmount();
        CheckAround();
        yield return null;
    }

    void GetAmount()
    {
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


    void CheckAround()
    {
        foreach (var t in neighbor)
        {
            if(t.pieces.Count == 0)
            {
                continue;
            }
            if (t.pieces[^1].id == pieces[^1].id)
            {
                int amount = numOfColor[t.pieces[^1].id];
                for(int i = 0; i < amount; i++)
                {
                    pieces[^(i+1)].transform.parent.parent.parent = t.container;
                }
            }
            numOfColor[t.pieces[^1].id] = 0;
        }
    }
}
