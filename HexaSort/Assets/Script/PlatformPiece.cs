using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class PlatformPiece : MonoBehaviour
{
    [SerializeField]
    GameObject lockState;
    [SerializeField]
    GameObject adsState;
    public PlatType platType = PlatType.Open;
    public int lockNumber;
    public List<PiecePro> pieces = new();
    public Dictionary<int, int> numOfColor = new();
    public List<PlatformPiece> neighbor = new();
    public Transform container;
    bool currentPick = false;
    MeshRenderer meshRenderer;

    private void Start()
    {
        meshRenderer = GetComponent<MeshRenderer>();
        if (CurrentData.Instance != null)
        {        
            if (platType == PlatType.Open)
            {
                meshRenderer.material = CurrentData.Instance.materialsPlat[0];
            }
            else
            {
                meshRenderer.material = CurrentData.Instance.materialsPlat[2];
                CurrentData.Instance.CheckAvaiablePlat(false);
            }

        }
    }

    private void OnMouseDown()
    {
        if (CurrentData.isHammer)
        {
            if (pieces.Count == 0) return;
            CurrentData.isHammer = false;
            StartCoroutine(BreakPieceHammer());
        }
        if(CurrentData.isHand)
        {
            if(pieces.Count == 0) return;
            CurrentData.isPick = true;
            CurrentData.currentPick = pieces;
            currentPick = true;
        }
        if(platType == PlatType.Ads)
        {
            adsState.SetActive(false);
            platType = PlatType.Open;
            meshRenderer.material = CurrentData.Instance.materialsPlat[0];
        }
    }

    private void OnMouseDrag()
    {
        if (!CurrentData.isHand) return;
        //if(CurrentData.currenPlat == this) return;
        var t = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        container.position = (Vector2)t;
    }

    private void OnMouseUp()
    {
        if (CurrentData.isHand)
        {
            if(CurrentData.currenPlat == null)
            {
                container.localPosition = Vector3.zero;
            }
            else
            {
                var t = CurrentData.currenPlat;
                container.parent = t.transform.parent;
                container.localPosition = Vector3.zero;
                t.container.parent = transform.parent;
                t.container.localPosition = Vector3.zero;
                (container,t.container) = (t.container,container);
                (pieces, t.pieces) = (t.pieces, pieces);
                CurrentData.isHand = false;
                CheckAround();
                t.CheckAround();
            }
        }
    }

    private void OnMouseEnter()
    {
        if (!platType.Equals(PlatType.Open))
        {
            return;
        }
        if (pieces.Count == 0)
        {
            meshRenderer.material = CurrentData.Instance.materialsPlat[1];
            CurrentData.currenPlat = this;
        }
        if (CurrentData.isHand && CurrentData.isPick)
        {
            var plat = CurrentData.currentPick[0].transform.parent.parent;
            container.transform.position = plat.position;
            CurrentData.currenPlat = this;
        }
    }

    private void OnMouseExit()
    {
        if (!platType.Equals(PlatType.Open)) return;
        meshRenderer.material = CurrentData.Instance.materialsPlat[0];
        CurrentData.currenPlat = null;
        if (CurrentData.isHand && !currentPick)
        {
            container.transform.localPosition = Vector3.zero;
        }
    }

    public void Unlock()
    {
        CurrentData.Instance.CheckAvaiablePlat(true);
        platType = PlatType.Open;
        lockState.SetActive(false);
        meshRenderer.material = CurrentData.Instance.materialsPlat[0];
    }

    public void SetState(PlatType type,int lockNumber =0)
    {
        platType = type;
        switch (type)
        {
            case PlatType.Ads:
                adsState.SetActive(true);
                break;
            case PlatType.Lock:
                lockState.SetActive(true);
                this.lockNumber = lockNumber;
                TextMeshPro text = GetComponentInChildren<TextMeshPro>();
                text.text = lockNumber.ToString();
                break;
        }
    }

    public void SetPos()
    {
        if (CurrentData.isPick)
        {
            CurrentData.Instance.CheckAvaiablePlat(false);
            var t = CurrentData.currentPick;
            foreach (var temp in t)
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
        for (int i = 0; i < pieces.Count; i++)
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
        for (int i = 0; i < a; i++)
        {
            var t = pieces[^1];
            pieces.RemoveAt(pieces.Count - 1);
            CurrentData.lastTween = LeanTween.scale(t.gameObject, Vector3.zero, 0.15f).setDestroyOnComplete(true).id;
            yield return new WaitForSeconds(0.08f);
        }
        numOfColor[id] = 0;
        CurrentData.Instance.UpdateScore(a);
        CurrentData.numOfCheck--;
        CheckAround();
        yield return null;
    }


    public IEnumerator BreakPieceHammer()
    {
        CurrentData.Instance.CheckAvaiablePlat(true);
        int a = pieces.Count;
        for(int i=0; i<a; i++)
        {
            var t = pieces[^1];
            pieces.RemoveAt(pieces.Count -1);
            CurrentData.lastTween = LeanTween.scale(t.gameObject, Vector3.zero, 0.15f).setDestroyOnComplete(true).id;
            yield return new WaitForSeconds(0.08f);
        }
        numOfColor.Clear();
        yield return null;
    }


    public void CheckAround()
    {
        if (pieces.Count == 0)
        {
            CurrentData.Instance.CheckAvaiablePlat(true);
            return;
        }
        List<PlatformPiece> nextPieces = LookAround(pieces[^1].id);
        if (nextPieces.Count != 0)
        {
            switch (nextPieces.Count)
            {
                case 1:
                    //Debug.Log("Single");
                    MoveSingle(nextPieces);
                    break;
                case 2:
                    //Debug.Log("Double");
                    MoveDouble(nextPieces);
                    break;
                case 3:
                    //Debug.Log("Tripple");
                    MoveTripple(nextPieces);
                    break;
            }
        }
    }

    List<PlatformPiece> LookAround(int id)
    {
        GetAmount();
        var platPieces = new List<PlatformPiece>();
        foreach (var t in neighbor)
        {
            if (t.pieces.Count == 0)
            {
                continue;
            }
            if (t.pieces[^1].id == id)
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
            if (LookAround(nextHead.id).Count > 0)
            {
                MovingPiece m = new()
                {
                    from = this,
                    to = next,
                    amount = numOfColor[head],
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
                amount = numOfColor[head],
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
                amount = next.numOfColor[next.pieces[^1].id],
            };
            CurrentData.movingStack.Push(m);
            return;
        }
    }

    void MoveDouble(List<PlatformPiece> nextPieces)
    {
        int min = Mathf.Min(numOfColor.Count, nextPieces[0].numOfColor.Count, nextPieces[1].numOfColor.Count);
        int id = pieces[^1].id;
        if (min == numOfColor.Count)
        {
            MovingPiece m = new()
            {
                from = nextPieces[0],
                to = this,
                amount = nextPieces[0].numOfColor[id],
            };
            CurrentData.movingStack.Push((m));
            return;
        }

        if (min == nextPieces[0].numOfColor.Count)
        {
            int temp = nextPieces[1].numOfColor[id];
            MovingPiece m = new()
            {
                from = nextPieces[1],
                to = this,
                amount = temp
            };
            CurrentData.movingStack.Push(m);
            return;
        }

        if (min == nextPieces[1].numOfColor.Count)
        {
            int temp = nextPieces[0].numOfColor[id];
            MovingPiece m = new()
            {
                from = nextPieces[0],
                to = this,
                amount = temp
            };
            CurrentData.movingStack.Push(m);
            return;
        }

    }

    void MoveTripple(List<PlatformPiece> nextPieces)
    {
        int id = pieces[^1].id;
        MovingPiece m = new()
        {
            from = nextPieces[0],
            to = this,
            amount = nextPieces[0].numOfColor[id],
        };
        CurrentData.movingStack.Push((m));
        return;
    }
}
