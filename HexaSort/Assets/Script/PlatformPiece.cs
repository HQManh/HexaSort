using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class PlatformPiece : MonoBehaviour
{
    public List<PiecePro> pieces = new();
    public Dictionary<int, int> numOfColor = new();
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
        if (pieces.Count == 0 || numOfColor[pieces[^1].id] < 10)
        {
            CurrentData.numOfCheck--;
            return;
        }
        StartCoroutine(BreakPiece());
    }


    IEnumerator BreakPiece()
    {
        int id = pieces[^1].id;
        GetAmount();
        int a = numOfColor[id];
        for(int i = 0; i < a; i++)
        {
            var t = pieces[^1];
            pieces.RemoveAt(pieces.Count - 1);
            CurrentData.lastTween = LeanTween.scale(t.gameObject, Vector3.zero, 0.2f).setDestroyOnComplete(true).id;
            yield return new WaitForSeconds(0.08f);
        }
        numOfColor[id] = 0;
        CurrentData.Instance.UpdateScore(a);
        CurrentData.numOfCheck--;
        CheckAround();
        yield return null;
    }


    public void CheckAround()
    {
        if (pieces.Count == 0) return;
        List<PlatformPiece> nextPieces = LookAround(pieces[^1].id);
        if (nextPieces.Count != 0)
        {
            switch (nextPieces.Count)
            {
                case 1:
                    MoveSingle(nextPieces);
                    break;
                case 2:
                    MoveDouble(nextPieces);
                    break;
                case 3:
                    MoveTripple(nextPieces);
                    break;
            }
        }
    }

    List<PlatformPiece> LookAround(int id)
    {
        GetAmount();
        var  platPieces = new List<PlatformPiece>();
        foreach(var t in neighbor)
        {
            if(t.pieces.Count == 0)
            {
                continue;
            }
            if(t.pieces[^1].id == id)
            {
                platPieces.Add(t); 
            }
        }
        return platPieces;
    }
    
    void MoveSingle(List<PlatformPiece> nextPieces)
    {
        var next = nextPieces[0];
        var head = pieces[^1].id;
        if (numOfColor.Count > 1)
        {
            var nextHead = pieces[^numOfColor[head]];
            if(LookAround(nextHead.id).Count > 0)
            {
                MovingPiece m = new()
                {
                    from = this,
                    to = next,
                    amount = numOfColor[head]
                };
                CurrentData.movingStack.Push(m);
                return;
            }
        }
            if (numOfColor.Count > next.numOfColor.Count)
            {
                MovingPiece m = new()
                {
                    from = this,
                    to = next,
                    amount = numOfColor[head]
                };
                CurrentData.movingStack.Push(m);
                return;
            }
            else
            {
                MovingPiece m = new()
                {
                    from = next,
                    to = this,
                    amount = next.numOfColor[next.pieces[^1].id]
                };
                CurrentData.movingStack.Push(m);
                return;
            }
    }

    void MoveDouble(List<PlatformPiece> nextPieces)
    {
        int min = Mathf.Min(numOfColor.Count, nextPieces[0].numOfColor.Count, nextPieces[1].numOfColor.Count);
        if(min == numOfColor.Count)
        {
            foreach(PlatformPiece piece in nextPieces)
            {
                MovingPiece m = new()
                {
                    from = piece,
                    to = this,
                    amount = piece.numOfColor[piece.pieces[^1].id]
                };
                CurrentData.movingStack.Push(m);
            }
            return;
        }

        if(min == nextPieces[0].numOfColor.Count)
        {
            MovingPiece m = new()
            {
                from = nextPieces[1],
                to = this,
                amount = nextPieces[1].numOfColor[nextPieces[1].pieces[^1].id]
            };
            CurrentData.movingStack.Push(m);

            m = new()
            {
                from = this,
                to = nextPieces[0],
                amount = nextPieces[0].numOfColor[nextPieces[0].pieces[^1].id]
            };
            CurrentData.movingStack.Push(m);
            return;
        }

        if(min == nextPieces[1].numOfColor.Count)
        {
            MovingPiece m = new()
            {
                from = nextPieces[0],
                to = this,
                amount = nextPieces[0].numOfColor[nextPieces[0].pieces[^1].id]
            };
            CurrentData.movingStack.Push(m);

            m = new()
            {
                from = this,
                to = nextPieces[1],
                amount = nextPieces[1].numOfColor[nextPieces[1].pieces[^1].id]
            };
            CurrentData.movingStack.Push(m);
            return;
        }

    }

    void MoveTripple(List<PlatformPiece> nextPieces)
    {
        foreach(PlatformPiece piece in nextPieces)
        {
            MovingPiece m = new()
            {
                from = piece,
                to = this,
                amount = piece.numOfColor[piece.pieces[^1].id]
            };
            CurrentData.movingStack.Push(m);
        }
    }
}
