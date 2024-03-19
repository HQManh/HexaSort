using System;
using System.Collections;
using System.Collections.Generic;
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
    public List<Material> materials = new();
    public static bool isPick = false;
    public static int numPiece;
    public static Pieces currentPick = new();
    public static PlatformPiece currenPlat;
    public static int freePieces =0;
    public int goalScore;
    public int currentProgress =0;
    List<PlatformPiece> desPiece = new();
    public static Stack<MovingPiece> movingStack = new();
    bool isMove = false;
    [SerializeField]
    Material defaultMaterial;
    [SerializeField]
    PiecesGenerator piecesGenerator;

    private void Awake()
    {
        Instance = this;
        materials.Add(defaultMaterial);
        SetMaterial();  
    }

    public void SetGoal(int goal)
    {
        goalScore = goal;       
    }


    void SetMaterial()
    {
        var t = Instantiate(defaultMaterial);
        t.color = Color.white;
        materials.Add(t);
    }

    public void UpdateScore(int score)
    {
        currentProgress += score;
        UIController.Instance.SetProgress((float)(currentProgress) / (float) goalScore);
    }

    public void CheckPiece()
    {
        numPiece--;
        if(numPiece == 0)
        {
            piecesGenerator.GeneratePieces();
        }
    }

    public void CheckMoving()
    {
        isMove = false;
        foreach(var des in desPiece)
        {
            des.CheckBreak();  
        }    
    }

    void Move()
    {
        MovingPiece piece = movingStack.Pop();
        var f = piece.from;
        var t = piece.to;
        for(int i=0; i < piece.amount; i++)
        {
            f.pieces[^1].transform.parent = t.container;
            f.pieces[^1].transform.localPosition = t.pieces[^1].transform.localPosition - new Vector3(0f, 0f, 0.35f);
            t.pieces.Add(f.pieces[^1]);
            f.pieces.RemoveAt(f.pieces.Count - 1);
            f.GetAmount();  
            t.GetAmount();
            desPiece.Add(t);
        }
        t.CheckAround();
        f.CheckAround();
    }


    private void Update()
    {
        if (movingStack.Count != 0)
        {
            isMove = true;
            desPiece.Clear();
            Move();
        }
        if(isMove && movingStack.Count == 0)
        {
            CheckMoving();
        }
    }
}
