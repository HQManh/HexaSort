using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovingPiece
{
    public PlatformPiece from;
    public PlatformPiece to;
    public int amount;
    public bool isCheck = false;
}


public class CurrentData : MonoBehaviour
{
    public static CurrentData Instance;
    public int maxColorID = 0;
    public List<Material> materialsColor = new();
    public List<Material> materialsPlat = new();
    public static bool isPick = false;
    public static int numPiece;
    public static List<PiecePro> currentPick = new();
    public static PlatformPiece currenPlat;
    public static int freePieces =0;
    public static int lastTween;
    public static LevelInfo levelInfo;
    public int currentProgress =0;
    public static List<PlatformPiece> canBreak = new();
    public static int numOfCheck =0;
    public static Stack<MovingPiece> movingStack = new();
    public static bool isMove = false;
    public static bool isHammer = false;
    public static bool isHand = false;
    bool isStart = false;
    List<PlatformPiece> needCheckPieces = new();
    [SerializeField]
    PiecesGenerator piecesGenerator;

    private void Awake()
    {
        Instance = this;  
    }

    public void UpdateScore(int score)
    {
        currentProgress += score;
        UIController.Instance.SetProgress((float)(currentProgress) / (float) levelInfo.goalScore);
        levelInfo.CheckUnlock(currentProgress);
    }

    public void CheckPiece()
    {
        numPiece--;
        if(numPiece == 0)
        {
            piecesGenerator.GeneratePieces(false);
        }
    }

    public void SwapBooster()
    {
        piecesGenerator.GeneratePieces(true);
    }

    public void CheckAvaiablePlat(bool isIncrease)
    {
        if (isIncrease)
        {
            freePieces++;
        }else freePieces--;
        if (freePieces == 0)
        {
            GameUIController.Instance.ShowGameEnd(false);
        }
    }

    void CheckMoving()
    {
        isMove = false;
        numOfCheck = canBreak.Count;
        foreach(var des in canBreak)
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
        Vector3 pos2 = t.pieces[^1].transform.localPosition;
        for (int i=0; i < piece.amount; i++)
        {
            var fPiece = f.pieces[^1];
            List<Vector3> list = new ();
            fPiece.transform.parent = t.container;
            Vector3 pos1 = fPiece.transform.localPosition;
            t.pieces.Add(fPiece);
            f.pieces.RemoveAt(f.pieces.Count - 1);  
            Vector3 midPos = new((pos1.x + pos2.x) / 2, (pos1.y + pos2.y) / 2,Mathf.Min(pos1.z,pos2.z -0.35f*(i+1)) - 1f);
            list.Add(pos1);
            list.Add(midPos);
            list.Add(midPos);
            list.Add(pos2 - new Vector3(0f, 0f, 0.35f) * (i+1));
            lastTween = LeanTween.moveLocal(fPiece.gameObject,list.ToArray(), 0.2f).id;
            midPos = Vector3.zero;
            if(pos1.x == pos2.x)
            {
                if (pos1.y < pos2.y)
                {
                    midPos.x = -180f;
                }
                else
                {
                    midPos.x = 180f;
                }
            }
            else
            {
                if (pos1.x < pos2.x)
                {
                    midPos.y = 180f;
                }
                else
                {
                    midPos.y = -180f;
                }
            }
            LeanTween.rotateLocal(fPiece.gameObject,f.transform.localEulerAngles + midPos, 0.2f);
            if (!canBreak.Contains(t))
            {
                canBreak.Add(t);
            }
            //f.pieces[^1].transform.localPosition = t.pieces[^1].transform.localPosition - new Vector3(0f, 0f, 0.35f);
            yield return new WaitForSeconds(0.1f);
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

    void CheckMovingPiece()
    {
        foreach(var t in needCheckPieces)
        {
            t.CheckAround();
        }
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

        if(movingStack.Count == 0 && isMove && numOfCheck ==0)
        {
            CheckMoving();
        }
    }
}
