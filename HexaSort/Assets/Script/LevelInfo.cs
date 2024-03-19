using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelInfo : MonoBehaviour
{
    public int goalScore;

    private void Start()
    {
        CurrentData.Instance.SetGoal(goalScore);
    }
}
