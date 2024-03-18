using System;
using System.Collections;
using System.Collections.Generic;
using TMPro.SpriteAssetUtilities;
using UnityEngine;

public class PiecesGenerator : MonoBehaviour
{
    int amount;
    [SerializeField]
    GameObject rootPieces;
    [SerializeField]
    GameObject piecePre;
    [SerializeField]
    Transform piecePos;

    public class PieceDetail
    {
        public int colorID;
        public int amount;
    }

    private void Start()
    {
        GeneratePieces();
    }

    public void GeneratePieces()
    {
        for( int i=0; i < 3; i++)
        {
            var t = GetInfo();
            var rootTemp = piecePos.GetChild(i);
            var a = rootTemp.GetComponent<Pieces>();
            a.piecePros.Clear();
            int sum = 0;
            var root = Instantiate(rootPieces, rootTemp);
            root.transform.localPosition = Vector3.zero;
            for (int j =0;j< t.Length ; j++)
            {
                for (int k=0; k< t[j].amount ; k++)
                {
                    var newObject = Instantiate(piecePre, root.transform);
                    newObject.transform.localPosition = new Vector3(0f,0f, -0.15f * (k+sum));
                    var b = newObject.GetComponentInChildren<PiecePro>();
                    b.id= t[j].colorID;
                    b.SetColor();
                    a.piecePros.Add(b);
                }
                sum += t[j].amount;
            }
        }
        CurrentData.numPiece = 3;
    }


    PieceDetail[] GetInfo()
    {
        int numColors = UnityEngine.Random.Range(1, 4);
        amount = UnityEngine.Random.Range(numColors, 7);
        List<PieceDetail> info = new();
        List<int> colors = new();
        for (int i=0;i < numColors; i++)
        {
            PieceDetail piece = new();
            int id = UnityEngine.Random.Range(2, CurrentData.Instance.maxColorID + 2);
            while (colors.Contains(id))
            {
                id = UnityEngine.Random.Range(2, CurrentData.Instance.maxColorID + 2);
            }
            if (numColors - i == 1)
            {
                piece.amount = amount;
                piece.colorID = id;
                info.Add(piece);
                return info.ToArray();
            }
            int a = UnityEngine.Random.Range(1, amount-2);
            piece.amount = a;
            piece.colorID = id;
            info.Add(piece);
            colors.Add(id);
            amount -= a;
        }
        return info.ToArray();
    }

}
