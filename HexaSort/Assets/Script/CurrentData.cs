using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class MovingPiece
{
    public PlatformPiece from;
    public PlatformPiece to;
    public int amount;
}


public class CurrentData : MonoBehaviour
{
    public static CurrentData Instance;
    public int maxColorID = 0;
    public List<Material> materialsColor = new();
    public List<Material> materialsPlat = new();
    public static bool isPick = false;
    public static List<List<PiecePro>> numPiece = new();
    public static List<PiecePro> currentPick = new();
    public static PlatformPiece currenPlat;
    public static int freePieces = 0;
    public static int lastTween;
    public static LevelInfo levelInfo;
    public int currentProgress = 0;
    public static List<PlatformPiece> canBreak = new();
    public static int numOfCheck = 0;
    public static Stack<MovingPiece> movingStack = new();
    public static bool isMove = false;
    public static bool isHammer = false;
    public static bool isHand = false;
    bool isStart = false;
    public static List<PlatformPiece> needCheckPieces = new();
    [SerializeField]
    PiecesGenerator piecesGenerator;
    [SerializeField]
    AudioClip movingClip;
    public Transform progressBar;
    public GameObject breakObject;
    public PiecePro piecePre;
    bool isEnd = false;

    private void Awake()
    {
        Instance = this;
    }

    public void UpdateScore(int score)
    {
        currentProgress += score;
        UIController.Instance.SetProgress((float)(currentProgress) / (float)levelInfo.goalScore);
        levelInfo.CheckUnlock(currentProgress);
        levelInfo.CheckProcess(currentProgress);
    }


    public void EndGameAnim()
    {
        levelInfo.EndGameAnim();
        piecesGenerator.piecePos.gameObject.SetActive(false);
        //UIController.Instance.HideUIIngame(true);
    }

    public void StartGame(LevelData data = null)
    {
        if (data != null)
        {
            LoadDataLevel(data);
        }
        else
        {
            numPiece.Clear();
            StartCoroutine(piecesGenerator.GeneratePieces(false));
        }
        isEnd = false;
    }

    public void CheckPiece()
    {
        numPiece.Remove(currentPick);
        if (numPiece.Count == 0)
        {
            StartCoroutine(piecesGenerator.GeneratePieces(false));
        }
    }

    List<int> GetPiecesHead()
    {
        List<int> ids = new();
        foreach (var t in numPiece)
        {
            if (ids.Contains(t[^1].id)) continue;
            ids.Add(t[^1].id);
        }
        return ids;
    }



    public IEnumerator BreakPlat(int numOfBreak)
    {
        List<int> piecesHead = GetPiecesHead();
        List<PlatformPiece> currentPieces = levelInfo.allPieces;
        List<PlatformPiece> canBreakPieces = new();
        for (int i = 0; i < piecesHead.Count; i++)
        {
            for (int j = 0; j < currentPieces.Count; j++)
            {
                if (currentPieces[j].pieces.Count == 0) continue;
                if (currentPieces[j].pieces[^1].id == piecesHead[i])
                {
                    var temp = currentPieces[j];
                    foreach (var t in temp.neighbor)
                    {
                        if (canBreakPieces.Contains(t) || t.pieces.Count == 0 || t.pieces[^1].id == piecesHead[i]) continue;
                        canBreakPieces.Add(t);
                    }
                }
            }
        }

        List<PlatformPiece> breakList = new();
        if (canBreakPieces.Count > numOfBreak)
        {
            breakList = canBreakPieces;
            for (int i = 0; i < numOfBreak - breakList.Count; i++)
            {
                int t = UnityEngine.Random.Range(0, currentPieces.Count);
                while (breakList.Contains(currentPieces[t]))
                {
                    t = UnityEngine.Random.Range(0, currentPieces.Count);
                }
                breakList.Add(currentPieces[t]);
                currentPieces.RemoveAt(t);
            }
        }
        else
        {
            for (int i = 0; i < numOfBreak; i++)
            {
                int t = UnityEngine.Random.Range(0, canBreakPieces.Count);
                breakList.Add(canBreakPieces[t]);
                canBreakPieces.RemoveAt(t);
            }
        }
        for (int i = 0; i < numOfBreak; i++)
        {
            var t = Instantiate(breakObject);
            LeanTween.move(t, breakList[i].transform.position, .8f).setOnComplete(() =>
            {
                StartCoroutine(breakList[i].BreakPieceHammer());
            });
            yield return new WaitForSeconds(UnityEngine.Random.Range(0f, 0.5f));
        }
        yield return null;
    }


    public void SwapBooster()
    {
        numPiece.Clear();
        StartCoroutine(piecesGenerator.GeneratePieces(true));
    }

    public void CheckBreak()
    {
        numOfCheck--;
        //if(numOfCheck == 0)
        //{
        //    CheckAvaiablePlat();
        //}
    }


    public IEnumerator CheckAvaiablePlat()
    {
        if (isEnd) yield break;
        yield return new WaitUntil(() => numOfCheck == 0 && movingStack.Count == 0);
        int c = 0;
        foreach (var piece in levelInfo.allPieces)
        {
            if (piece.pieces.Count == 0 || piece.platType != PlatType.Open)
                yield break;
            c++;
        }
        if (c == levelInfo.allPieces.Count)
        {
            Debug.Log("End");
            isEnd = true;
            StageControl.Instance.End(false);
            yield return null;
        }

    }

    void CheckMoving()
    {
        isMove = false;
        numOfCheck = canBreak.Count;
        foreach (var des in canBreak)
        {
            des.CheckBreak();
        }
        canBreak.Clear();
    }

    IEnumerator Move()
    {
        isStart = true;
        isMove = true;
        MovingPiece piece = movingStack.Pop();
        var f = piece.from;
        var t = piece.to;
        if (f.pieces.Count < piece.amount)
        {
            yield break;
        }
        Vector3 pos2 = t.pieces[^1].transform.position;
        Vector3 vTemp = t.pieces[^1].transform.localPosition;
        Vector3 pos1 = f.pieces[^1].transform.position;
        for (int i = 0; i < piece.amount; i++)
        {
            var fPiece = f.pieces[^1];
            List<Vector3> list = new();
            fPiece.transform.parent = t.container;
            pos1 = fPiece.transform.localPosition;
            t.pieces.Add(fPiece);
            f.pieces.RemoveAt(f.pieces.Count - 1);
            var posTemp = vTemp - new Vector3(0f, 0f, 0.2f) * (i + 1);
            Vector3 midPos = new((pos1.x + posTemp.x) / 2, (pos1.y + posTemp.y) / 2, Mathf.Min(pos1.z - .5f, posTemp.z - 0.2f * (i + 1)) - 1.5f);
            list.Add(pos1);
            list.Add(midPos);
            list.Add(midPos);
            list.Add(posTemp);
            Vector3 dir = posTemp - fPiece.transform.localPosition;
            dir.z = 0;
            var rotation = Quaternion.LookRotation(Vector3.forward, dir);
            fPiece.transform.rotation = rotation;
            lastTween = LeanTween.moveLocal(fPiece.gameObject, list.ToArray(), 0.4f).setEaseInOutSine().id;
            SoundControl.Instance.PlaySfx(movingClip);
            fPiece.Holder.transform.DOLocalRotate(new Vector3(180, 0, 0), 0.4f).OnComplete(() =>
            {
                fPiece.Holder.transform.localRotation = Quaternion.identity;
            });
            if (!canBreak.Contains(t))
            {
                canBreak.Add(t);
            }
            yield return new WaitForSeconds(0.025f);
            //yield return null;
        }
        yield return null;
        //needCheckPieces.Add(t);
        //needCheckPieces.Add(f);
        t.CheckAround();
        f.CheckAround();
        //if (piece.isCheck)
        //{
        //    CheckMovingPiece();
        //}
        yield return null;
    }

    void SaveCurrentData()
    {
        var t = levelInfo.GetPiecesData();
        List<string> pieces = new();
        foreach (var piece in numPiece)
        {
            string list = "";
            switch (piece[0].transform.parent.parent.name)
            {
                case "Pos1":
                    list += "1";
                    foreach (var p in piece)
                    {
                        list += " " + (p.id).ToString();
                    }
                    pieces.Add(list);
                    break;
                case "Pos2":
                    list += "2";
                    foreach (var p in piece)
                    {
                        list += " " + (p.id).ToString();
                    }
                    pieces.Add(list);
                    break;
                case "Pos3":
                    list += "3";
                    foreach (var p in piece)
                    {
                        list += " " + (p.id).ToString();
                    }
                    pieces.Add(list);
                    break;
            }
        }

        LevelData data = new()
        {
            level = GlobalControll.CurrentLevelIndex,
            currentProcess = currentProgress,
            platInfo = t,
            pieces = pieces
        };

        DataControl.Instance.SaveData(data);
    }


    public void LoadDataLevel(LevelData data)
    {
        currentProgress = data.currentProcess;
        LoadPlatInfo(data.platInfo);
        LoadPieceData(data.pieces);
        LoadProgress(data.currentProcess);
    }

    void LoadPlatInfo(List<string> info)
    {
        List<List<int>> platInfo = new();
        foreach (var s in info)
        {
            string[] t = s.Split(' ');
            List<int> list = new();
            for (int i = 0; i < t.Length; i++)
            {
                if (int.TryParse(t[i], out int j))
                {
                    list.Add(j);
                }
            }
            platInfo.Add(list);
        }
        if (platInfo.Count == 0) return;
        LevelControl.Instance.loadedLevel.LoadDataPlat(platInfo);
    }

    void LoadPieceData(List<string> info)
    {
        List<List<int>> pieceInfo = new();
        foreach (var s in info)
        {
            string[] t = s.Split(" ");
            List<int> list = new();
            for (int i = 0; i < t.Length; i++)
            {
                if (int.TryParse(t[i], out int j))
                {
                    list.Add(j);
                }
            }
            pieceInfo.Add(list);
        }
        if (info.Count == 0)
        {
            StartCoroutine(piecesGenerator.GeneratePieces(false));
        }
        else
            StartCoroutine(piecesGenerator.LoadPiece(pieceInfo));
    }


    void LoadProgress(int progress)
    {
        currentProgress = progress;
        UIController.Instance.SetProgress((float)progress / (float)LevelControl.Instance.loadedLevel.goalScore, 0f);
    }

    private void Update()
    {
        if (isStart)
        {
            if (LeanTween.isTweening(lastTween)) return;
        }

        if (movingStack.Count != 0 && numOfCheck == 0)
        {
            StartCoroutine(Move());
            return;
        }

        if (movingStack.Count == 0 && isMove && numOfCheck == 0)
        {
            CheckMoving();
        }
    }

    public List<PlatformPiece> GetAvaiablePiece()
    {
        List<PlatformPiece> avaiable = new();
        List<PlatformPiece> pieces = levelInfo.allPieces;
        foreach (PlatformPiece piece in pieces)
        {
            if (piece.pieces.Count == 0)
                avaiable.Add(piece);
        }
        return avaiable;
    }

    private void OnApplicationQuit()
    {
        SaveCurrentData();
    }


}
