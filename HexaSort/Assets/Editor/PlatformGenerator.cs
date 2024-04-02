using System;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEditor;
using UnityEngine;


[ExecuteInEditMode]
public class PlatformGenerator : MonoBehaviour
{
    [Serializable]
    public class PlatformList
    {
        public List<PlatPro> list = new();
    }

    [SerializeField]
    GameObject platPiece;
    [SerializeField]
    PiecePro piece;
    [SerializeField] Transform rootPlat;
    float height;
    float width;
    [Serializable]
    public class ArrayPlat
    {
        public List<PlatformPiece> pieces = new();
    }
    [SerializeField]
    List<List<PlatformPiece>> pieceList = new();

    public void SetUp(Vector2 size, List<List<PlatPro>> platList)
    {
        height = platPiece.GetComponentInChildren<MeshRenderer>().bounds.size.x;
        width = platPiece.GetComponentInChildren<MeshRenderer>().bounds.size.y;
        Vector3 offset = new();
        int num = 0;
        var a = FindAnyObjectByType<LevelInfo>();
        a.allPieces.Clear();
        a.lockPieces.Clear();
        for (int i = 0; i < size.x; i++)
        {
            List<PlatformPiece> listTemp = new();
            for (int j = 0; j < size.y; j++)
            {
                PlatformPiece t = null;
                if (platList[i][j].type.Equals(PlatType.None))
                {
                    listTemp.Add(t);
                    continue;
                }
                var temp = PrefabUtility.InstantiatePrefab(platPiece, rootPlat);
                t = temp.GetComponentInChildren<PlatformPiece>();
                Vector3 pos = new(j * (1.7f * 2) + (1.7f) * (i % 2), -i * (width / 2), 0f);
                t.transform.parent.transform.position = pos;
                offset += pos;
                listTemp.Add(t);
                num++;
                switch (platList[i][j].type)
                {
                    case PlatType.Open:
                        if (platList[i][j].preList != null)
                        {
                            string[] numsString = platList[i][j].preList.Split(new char[] {' '}, StringSplitOptions.RemoveEmptyEntries);
                            foreach(var numString in numsString)
                            {
                                if(int.TryParse(numString, out int id))
                                {
                                    var p = PrefabUtility.InstantiatePrefab(piece);
                                    Debug.Log(p.name);
                                    var te = p.GetComponent<PiecePro>();
                                    te.transform.parent = t.container;
                                    te.gameObject.layer = 2;
                                    te.transform.localPosition = new Vector3(0f, 0f, -0.2f* (t.pieces.Count + 1));
                                    te.id = id;
                                    t.pieces.Add(te);
                                }
                            }
                        }
                        break;
                    case PlatType.Ads:
                        t.SetState(PlatType.Ads);
                        break;
                    case PlatType.Lock:
                        t.SetState(PlatType.Lock, platList[i][j].scoreOpen);
                        break;
                }
                a.allPieces.Add(t);
            }
            pieceList.Add(listTemp);
        }
        GetNeighbor();
        offset /= num;
        a.GetLockPieces();
        a.SetPos(offset);
    }

    public void DestroyChild()
    {
        for (int i = 0; i < rootPlat.childCount; i++)
        {
            var t = rootPlat.GetChild(i);
            DestroyImmediate(t.gameObject);
        }
        pieceList.Clear();
    }


    void GetNeighbor()
    {
        for (int i = 0; i < pieceList.Count; i++)
        {
            for (int j = 0; j < pieceList[i].Count; j++)
            {
                if (pieceList[i][j] == null) continue;
                else
                {
                    if (i >= 1)
                    {
                        var t = pieceList[i - 1][j];
                        if (t != null)
                        {
                            pieceList[i][j].neighbor.Add(t);
                        }

                        if (j >= 1 && i % 2 == 0)
                        {
                            t = pieceList[i - 1][j - 1];
                            if (t != null)
                            {
                                pieceList[i][j].neighbor.Add(t);
                            }
                        }

                        if (j < pieceList[i - 1].Count - 1 && i % 2 != 0)
                        {
                            t = pieceList[i - 1][j + 1];
                            if (t != null)
                            {
                                pieceList[i][j].neighbor.Add(t);
                            }
                        }
                    }

                    if (i >= 2)
                    {
                        var t = pieceList[i - 2][j];
                        if (t != null)
                        {
                            pieceList[i][j].neighbor.Add(t);
                        }
                    }

                    if (i + 1 < pieceList.Count)
                    {
                        var t = pieceList[i + 1][j];
                        if (t != null)
                        {
                            pieceList[i][j].neighbor.Add(t);
                        }

                        if (j >= 1 && i % 2 == 0)
                        {
                            t = pieceList[i + 1][j - 1];
                            if (t != null)
                            {
                                pieceList[i][j].neighbor.Add(t);
                            }
                        }

                        if (j < pieceList[i + 1].Count - 1 && i % 2 != 0)
                        {
                            t = pieceList[i + 1][j + 1];
                            if (t != null)
                            {
                                pieceList[i][j].neighbor.Add(t);
                            }
                        }
                    }

                    if (i + 2 < pieceList.Count)
                    {
                        var t = pieceList[i + 2][j];
                        if (t != null)
                        {
                            pieceList[i][j].neighbor.Add(t);
                        }
                    }
                }
            }
        }
    }
}
