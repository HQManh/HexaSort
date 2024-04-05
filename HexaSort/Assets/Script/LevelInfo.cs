using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelInfo : MonoBehaviour
{
    public int goalScore;
    public int maxcolorStart =3;
    public List<PlatformPiece> lockPieces = new();
    public List<PlatformPiece> allPieces = new();
    public List<int> processes = new();
    int currentIndex = 0;

    private void Awake()
    {
        SetID();
    }

    private void Start()
    {
        CurrentData.Instance.maxColorID = maxcolorStart;
        if(CurrentData.Instance != null)
        {
            CurrentData.freePieces = transform.childCount;
            CurrentData.levelInfo = this;
        }
        GetAllPieces();
    }

    public void GetLockPieces()
    {
        lockPieces.Clear();
        PlatformPiece[] pieces = GetComponentsInChildren<PlatformPiece>();
        for(int i=0;i<pieces.Length;i++)
        {
            if (pieces[i].platType.Equals(PlatType.Lock))
            {
                lockPieces.Add(pieces[i]);
            }
        }
        lockPieces.Sort(ComparePiece);
    }

    int ComparePiece(PlatformPiece p1, PlatformPiece p2)
    {
        return p1.lockNumber.CompareTo(p2.lockNumber);
    }

    public void CheckUnlock(int currentScore)
    {
        if (lockPieces.Count == 0) return;
        if(currentScore > lockPieces[currentIndex].lockNumber)
        {
            lockPieces[currentIndex].Unlock();
            currentIndex++;
        }
    }

    public void CheckProcess(int currentScore)
    {
        if(processes.Count ==0) return;
        if (currentScore > processes[0])
        {
            CurrentData.Instance.maxColorID++;
            processes.RemoveAt(0); 
        }
    }
    
    public void SetPos(Vector3 offset)
    {
        foreach(PlatformPiece piece in allPieces)
        {
            piece.transform.parent.localPosition -= offset;
        }
    }

    void GetAllPieces()
    {
        if (allPieces.Count == 0)
        {
            var t = transform.GetComponentsInChildren<PlatformPiece>();
            for (int i = 0; i < t.Length; i++)
            {
                allPieces.Add(t[i]);
            }
        }
    }

    void SetID()
    {
        for(int i=0;i< allPieces.Count; i++)
        {
            allPieces[i].id = i;
        }
    }
    
    public List<string> GetPiecesData()
    {
        List<string> platinfo = new();
        foreach(PlatformPiece piece in allPieces)
        {
            string list ="";
            foreach(PiecePro p in piece.pieces)
            {
               list += " "+ (p.id).ToString();
            }
            platinfo.Add(list);
        }
        return platinfo;
    }

    public void EndGameAnim()
    {
        LeanTween.rotateAroundLocal(gameObject, Vector3.forward, 100f, 5f);
        LeanTween.scale(gameObject, Vector3.one * 0.8f, 1.5f);
        foreach(PlatformPiece piece in allPieces)
        {
            if(piece.pieces.Count != 0)
            {
                StartCoroutine(piece.BreakPieceHammer());
            }
        }
    }

    public void LoadDataPlat(List<List<int>> platData)
    {
        for(int i=0;i< allPieces.Count; i++)
        {
            allPieces[i].slots = platData[i];
        }
    }
}
