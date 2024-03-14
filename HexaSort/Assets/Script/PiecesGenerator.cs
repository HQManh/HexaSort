using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PiecesGenerator : MonoBehaviour
{
    int amount;
    [SerializeField]
    GameObject rootPieces;

    public class PieceInfo
    {
        public int amount;
        public Dictionary<int,int> colorID = new();
    }

   
    public void GeneratePieces()
    {
        var t = GetInfo();

    }


    PieceInfo GetInfo()
    {
        amount = UnityEngine.Random.Range(1, 6);
        int numColors = UnityEngine.Random.Range(1, 3);
        PieceInfo info = new();
        for (int i=0;i < numColors; i++)
        {
            int id = UnityEngine.Random.Range(2, CurrentData.maxColorID);
            while (info.colorID.ContainsKey(id))
            {
                id = UnityEngine.Random.Range(2, CurrentData.maxColorID);
            }
            if (numColors - i == 1)
            {
                info.amount = amount;
                info.colorID.Add(id, amount);
                return info;
            }
            int a = UnityEngine.Random.Range(1, amount-2);
            info.colorID.Add(a, amount);
            amount -= a;
        }
       return info;
    }

}
