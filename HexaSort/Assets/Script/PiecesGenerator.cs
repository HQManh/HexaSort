
using System.Collections;
using System.Collections.Generic;
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
        GeneratePieces(false);
    }

    public void GeneratePieces(bool isSingle)
    {
        if(isSingle)
        {
            for(int i=0;i<3;i++)
            {
                var r =piecePos.GetChild(i);
                for (int j = 0; j < r.childCount; j++){
                    var c = r.GetChild(j);
                    DestroyImmediate(c.gameObject);
                }
            }
        }
        for( int i=0; i < 3; i++)
        {
            var t = GetInfo(isSingle);
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
                    newObject.transform.localPosition = new Vector3(0f,0f, -0.35f * (k+sum));
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


    PieceDetail[] GetInfo(bool isSingle)
    {
        if (!isSingle)
        {
            int numColors = Random.Range(1, 4);
            amount = Random.Range(numColors, 7);
            List<PieceDetail> info = new();
            List<int> colors = new();
            for (int i = 0; i < numColors; i++)
            {
                PieceDetail piece = new();
                int id = Random.Range(2, CurrentData.Instance.maxColorID + 2);
                while (colors.Contains(id))
                {
                    id = Random.Range(2, CurrentData.Instance.maxColorID + 2);
                }
                if (numColors - i == 1)
                {
                    piece.amount = amount;
                    piece.colorID = id;
                    info.Add(piece);
                    return info.ToArray();
                }
                int a = Random.Range(1, amount - 2);
                piece.amount = a;
                piece.colorID = id;
                info.Add(piece);
                colors.Add(id);
                amount -= a;
            }
            return info.ToArray();
        }
        else
        {
            List<PieceDetail> info = new();
            amount = Random.Range(1, 7);
            int id = Random.Range(2, CurrentData.Instance.maxColorID + 2);
            PieceDetail p = new() { amount = amount, colorID = id };
            info.Add(p);
            return info.ToArray();

        }
    }

}
