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
    [SerializeField]
    GameObject ticketState;
    [SerializeField]
    GameObject iceState;
    [SerializeField]
    ParticleSystem breakPieceParticle;
    public PlatType platType = PlatType.Open;
    public int lockNumber;
    public List<PiecePro> pieces = new();
    public List<int> slots = new();
    public Dictionary<int, int> numOfColor = new();
    public List<PlatformPiece> neighbor = new();
    public Transform container;
    public int id;
    float timeBreak = 0.03f;
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
            }
            if(slots.Count > 0)
            {
                LoadData();
            }
        }
    }

    private void OnMouseDown()
    {
        if (CurrentData.isHammer)
        {
            if (pieces.Count == 0) return;
            StartCoroutine(BreakPieceHammer());
            UIController.Instance.HideUIIngame(false);
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
        if (!CurrentData.isHand || !currentPick ) return;
        //if(CurrentData.currenPlat == this) return;
        var mousePos = Input.mousePosition;
        mousePos.z = 10f;
        var t = Camera.main.ScreenToWorldPoint(mousePos);
        container.position = t;
    }

    private void OnMouseUp()
    {
        if (CurrentData.isHand)
        {
            if (CurrentData.currenPlat == null)
            {
                container.localPosition = Vector3.zero;
            }
            else
            {
                var t = CurrentData.currenPlat;
                container.parent = t.transform.parent;
                t.container.parent = transform.parent;
                container.localPosition = Vector3.zero;
                t.container.localPosition = Vector3.zero;
                (container, t.container) = (t.container, container);
                (pieces, t.pieces) = (t.pieces, pieces);
                CheckAround();
                t.CheckAround();
            }
            UIController.Instance.HideUIIngame(false);
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
            var t = CurrentData.currentPick;
            foreach (var temp in t)
            {
                pieces.Add(temp);
                var a = temp.transform;
                a.parent = container;
                a.gameObject.layer = 2;
                //LeanTween.moveLocal(a.gameObject, transform.localPosition - new Vector3(0f, 0f, 0.15f * (1 + pieces.Count +stt)), 0.25f);
                a.transform.localPosition = transform.localPosition - new Vector3(0f, 0f, 0.2f * (pieces.Count));
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
            CurrentData.Instance.CheckBreak();
            return;
        }
        StartCoroutine(BreakPiece());
    }


    IEnumerator BreakPiece()
    {
        int id = pieces[^1].id;
        GetAmount();
        int a = numOfColor[id];
        breakPieceParticle.Play();
        for (int i = 0; i < a; i++)
        {
            var t = pieces[^1];
            pieces.RemoveAt(pieces.Count - 1);
            CurrentData.lastTween = LeanTween.scale(t.gameObject, Vector3.zero, 0.15f).setDestroyOnComplete(true).id;
            yield return new WaitForSeconds(timeBreak);
        }
        numOfColor[id] = 0;
        CurrentData.Instance.CheckBreak();
        Vector3 pos = transform.position;
        pos.z = 0;
        pos = Camera.main.WorldToScreenPoint(pos);
        StartCoroutine(UIController.Instance.BreakPieces(id, pos,a));
        CheckAround();
        yield return null;
    }


    public IEnumerator BreakPieceHammer()
    {
        int a = pieces.Count;
        if (a == 0) yield break;
        breakPieceParticle.Play();
        for (int i=0; i<a; i++)
        {
            var t = pieces[^1];
            pieces.RemoveAt(pieces.Count -1);
            CurrentData.lastTween = LeanTween.scale(t.gameObject, Vector3.zero, 0.15f).setDestroyOnComplete(true).id;
            yield return new WaitForSeconds(timeBreak);
        }
        numOfColor.Clear();
        yield return null;
    }

    public void LoadData()
    { 
        DestroyChild();
        for (int i=0;i< slots.Count; i++)
        {
            var t = Instantiate(CurrentData.Instance.piecePre);
            t.transform.parent = container;
            t.gameObject.layer = 2;
            t.transform.localPosition = new Vector3(0f,0f,-0.2f*(i+1));
            t.id = slots[i];
            t.SetColor();
            t.gameObject.SetActive(true);
            pieces.Add(t);
        }
        GetAmount();
    }

    void DestroyChild()
    {
        for(int i=0;i< container.childCount; i++)
        {
            DestroyImmediate(container.GetChild(0).gameObject,true);
        }
    }

    public void CheckAround()
    {
        if (pieces.Count == 0) return;
        List<PlatformPiece> nextPieces = LookAround();
        if (nextPieces.Count != 0)
        {
            switch (nextPieces.Count)
            {
                case 1:
                    Debug.Log("Single");
                    MoveSingle(nextPieces);
                    break;
                case 2:
                    Debug.Log("Double");
                    MoveDouble(nextPieces);
                    break;
                case 3:
                    Debug.Log("Tripple");
                    MoveTripple(nextPieces);
                    break;
            }
        }
    }

    public List<PlatformPiece> LookAround()
    {
        GetAmount();
        id = pieces[^1].id;
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
        if (nextPieces[0].LookAround().Count > 1)
        {
            nextPieces[0].CheckAround();
            return;
        }
        if (numOfColor.Count > 1)
        {
            var nextHead = pieces[^numOfColor[head]];
            if (LookAround().Count > 0)
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
        foreach(PlatformPiece piece in nextPieces)
        {
            if (piece.LookAround().Count >2)
            {
                piece.CheckAround();
                return;
            }
        }
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
        int i = 0;
        foreach (PlatformPiece piece in nextPieces)
        {
            if (piece.LookAround().Count == 3)
            {
                i++;
            }
        }
        MovingPiece m = new()
        {
            from = nextPieces[i],
            to = this,
            amount = nextPieces[i].numOfColor[id],
        };
        CurrentData.movingStack.Push((m));
        return;
    }
}
