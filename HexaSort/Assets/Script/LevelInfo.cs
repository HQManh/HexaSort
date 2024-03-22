using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelInfo : MonoBehaviour
{
    public int goalScore;
    public List<PlatformPiece> lockPieces = new();
    int currentIndex = 0;

    private void Start()
    {
        if(CurrentData.Instance != null)
        {
            CurrentData.freePieces = transform.GetChild(0).childCount;
            CurrentData.levelInfo = this;
        }
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
        if(currentScore > lockPieces[currentIndex].lockNumber)
        {
            lockPieces[currentIndex].Unlock();
            currentIndex++;
        }
    }
}
