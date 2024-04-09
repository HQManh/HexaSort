using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Map : MonoBehaviour
{
    [SerializeField]
    List<Set> sets = new();
    public bool isDone = false;
    public int amount;
    public int currentAmount;

    public void SetInfo(int currentAmount, bool isDone = false)
    {
        this.currentAmount = currentAmount;
        
    }

}
