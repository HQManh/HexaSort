
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PiecesGenerator : MonoBehaviour
{
    int amount;
    [SerializeField]
    [Range(0f, 1f)]
    float percen;
    [SerializeField]
    GameObject rootPieces;
    [SerializeField]
    GameObject piecePre;
    [SerializeField]
    public Transform piecePos;

    public class PieceDetail
    {
        public int colorID;
        public int amount;
    }

    public IEnumerator GeneratePieces(bool isSingle)
    {
        if (isSingle)
        {
            DestroyPieces();
        }
        yield return null;
        for (int i = 0; i < 3; i++)
        {
            float r = Random.value;
            if (r < percen)
            {
                PieceControl();
            }
            var t = GetInfo(isSingle);
            var rootTemp = piecePos.GetChild(i);
            var a = rootTemp.GetComponent<Pieces>();
            a.piecePros.Clear();
            int sum = 0;
            var root = Instantiate(rootPieces, rootTemp);
            root.transform.localPosition = new Vector3(10f, 0f, 0f);
            for (int j = 0; j < t.Length; j++)
            {
                for (int k = 0; k < t[j].amount; k++)
                {
                    var newObject = Instantiate(piecePre, root.transform);
                    newObject.transform.localPosition = new Vector3(0f, 0f, -0.2f * (k + sum));
                    var b = newObject.GetComponentInChildren<PiecePro>();
                    b.id = t[j].colorID;
                    b.SetColor();
                    a.piecePros.Add(b);
                }
                sum += t[j].amount;
            }
            CurrentData.numPiece.Add(a.piecePros);
            LeanTween.moveLocalX(root, 0f, 0.2f).setOnComplete(() =>
            {
                LeanTween.scale(root, Vector3.one * 1.05f, 0.05f).setOnComplete(() =>
                {
                    LeanTween.scale(root, Vector3.one, 0.05f).setEaseInBack();
                });
            });
            yield return new WaitForSeconds(0.1f);
        }
    }





    public IEnumerator LoadPiece(List<List<int>> piecesInfo)
    {
        DestroyPieces();
        foreach (var piece in piecesInfo)
        {
            var rootTemp = piecePos.GetChild(piece[0] - 1);
            var a = rootTemp.GetComponent<Pieces>();
            a.piecePros.Clear();
            var root = Instantiate(rootPieces, rootTemp);
            root.transform.localPosition = new Vector3(10f, 0f, 0f);
            for (int i = 1; i < piece.Count; i++)
            {
                var newObject = Instantiate(piecePre, root.transform);
                newObject.transform.localPosition = new Vector3(0f, 0f, -0.2f * (i - 1));
                var b = newObject.GetComponentInChildren<PiecePro>();
                b.id = piece[i];
                b.SetColor();
                a.piecePros.Add(b);
            }
            CurrentData.numPiece.Add(a.piecePros);
            LeanTween.moveLocalX(root, 0f, 0.2f).setOnComplete(() =>
            {
                LeanTween.scale(root, Vector3.one * 1.05f, 0.05f).setOnComplete(() =>
                {
                    LeanTween.scale(root, Vector3.one, 0.05f).setEaseInBack();
                });
            });
            yield return new WaitForSeconds(0.1f);
        }
    }

    void DestroyPieces()
    {
        for (int i = 0; i < 3; i++)
        {
            var r = piecePos.GetChild(i);
            for (int j = 0; j < r.childCount; j++)
            {
                var c = r.GetChild(j);
                DestroyImmediate(c.gameObject);
            }
        }
    }

    void PieceControl()
    {
        List<int> infos = new();
        for(int i = 0; i < CurrentData.Instance.materialsColor.Count; i++)
        {
            infos.Add(i);
        }
        List<PlatformPiece> avaiable = CurrentData.Instance.GetAvaiablePiece();
        if (avaiable.Count > 0)
        {
            foreach (PlatformPiece piece in avaiable)
            {
                int id = piece.pieces[^1].id;
                if (infos.Contains(id))
                {
                    infos.Remove(id);
                }
            }
        }

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
                int id = Random.Range(0, CurrentData.Instance.maxColorID);
                while (colors.Contains(id))
                {
                    id = Random.Range(0, CurrentData.Instance.maxColorID);
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
            int id = Random.Range(0, CurrentData.Instance.maxColorID);
            PieceDetail p = new() { amount = amount, colorID = id };
            info.Add(p);
            return info.ToArray();

        }
    }
}
