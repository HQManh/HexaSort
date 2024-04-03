using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseTween : MonoBehaviour
{
    [SerializeField] protected Vector3 target;
    [SerializeField] protected float speed;
    private int tweenId;

    public virtual void Play(bool loop = false)
    {
    }

    public virtual void Stop()
    {

    }
}
