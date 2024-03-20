using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelInfo : MonoBehaviour
{
    public int goalScore;

    private void Start()
    {
        CurrentData.freePieces = transform.GetChild(0).childCount;
        CurrentData.Instance.SetGoal(this);
    }
}
