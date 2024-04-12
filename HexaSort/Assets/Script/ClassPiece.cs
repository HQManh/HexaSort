using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum PlatType
{
    Open,
    Lock,
    Ads,
    Ticket,
    None,
    Ice,
    Plank
}

public class PlatPro
{
    public PlatType type;
    public int scoreOpen;
    public string preList;
}


public class ClassPiece : MonoBehaviour
{
 

}
