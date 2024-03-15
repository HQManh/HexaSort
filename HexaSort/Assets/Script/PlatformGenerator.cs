using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum PlatType
{
    Open,
    Lock,
    Ads
}

public class PlatformGenerator : MonoBehaviour
{
    [Serializable]
    public class PlatFormPro
    {
        public bool isSet;
        public PlatType type;
    }
    [Serializable]
    public class PlatformList
    {
        public List<PlatFormPro> list = new();
    }

    [SerializeField]
    GameObject platPiece;
    [SerializeField] Transform rootPlat;
    [SerializeField]
    List<PlatformList> position = new();
    float height;
    float width;
    [Serializable]
    public class ArrayPlat
    {
        public List<PlatformPiece> pieces = new();
    }
    [SerializeField]
    List<ArrayPlat> pieceList = new();

    void Start()
    {
        height = platPiece.GetComponentInChildren<MeshRenderer>().bounds.size.x;
        width = platPiece.GetComponentInChildren<MeshRenderer>().bounds.size.y;
        SetUp();
    }

    public void SetUp()
    {
        for(int i=0;i < position.Count;i++)
        {
            List<PlatformPiece> listTemp = new();
            for(int j = 0; j < position[i].list.Count;j++)
            {
                PlatformPiece t = null;
                if (position[i].list[j].isSet)
                {
                    var temp= Instantiate(platPiece, rootPlat);
                    t= temp.GetComponentInChildren<PlatformPiece>();
                    temp.transform.position = new Vector3(j * (0.925f*2) + (0.925f) * (i%2), i * (width/2),0f) ;
                }
                listTemp.Add(t);
            }
            ArrayPlat array = new()
            {
                pieces = listTemp
            };
            pieceList.Add(array);

        }
        GetNeighbor();
    }

    void GetNeighbor()
    {
        for (int i = 0; i < pieceList.Count; i++)
        {
            for (int j = 0; j < pieceList[i].pieces.Count; j++)
            {
                if (pieceList[i].pieces[j] == null) continue;
                else
                {
                    if (i >= 1)
                    {
                        var t = pieceList[i - 1].pieces[j];
                        if (t != null)
                        {
                            pieceList[i].pieces[j].neighbor.Add(t);
                        }

                        if (j >= 1 && i % 2 == 0)
                        {
                            t = pieceList[i - 1].pieces[j - 1];
                            if (t != null)
                            {
                                pieceList[i].pieces[j].neighbor.Add(t);
                            }
                        }

                        if(j< pieceList[i - 1].pieces.Count - 1 && i % 2 != 0)
                        {
                            t = pieceList[i - 1].pieces[j + 1];
                            if(t!= null)
                            {
                                pieceList[i].pieces[j].neighbor.Add(t);
                            }
                        }
                    }

                    if (i >= 2)
                    {
                        var t = pieceList[i - 2].pieces[j];
                        if (t != null)
                        {
                            pieceList[i].pieces[j].neighbor.Add(t);
                        }
                    }

                    if (i + 1 < pieceList.Count)
                    {
                        var t = pieceList[i + 1].pieces[j];
                        if (t != null)
                        {
                            pieceList[i].pieces[j].neighbor.Add(t);
                        }

                        if (j >= 1 && i % 2 == 0)
                        {
                            t = pieceList[i + 1].pieces[j - 1];
                            if (t != null)
                            {
                                pieceList[i].pieces[j].neighbor.Add(t);
                            }
                        }

                        if (j < pieceList[i + 1].pieces.Count - 1 && i % 2 != 0)
                        {
                            t = pieceList[i + 1].pieces[j + 1];
                            if (t != null)
                            {
                                pieceList[i].pieces[j].neighbor.Add(t);
                            }
                        }
                    }

                    if (i + 2 < pieceList.Count)
                    {
                        var t = pieceList[i + 2].pieces[j];
                        if (t != null)
                        {
                            pieceList[i].pieces[j].neighbor.Add(t);
                        }
                    }
                }
            }
        }
    }
}
