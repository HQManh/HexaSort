using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ParticleRecycler : MonoBehaviour
{
    public ParticleSystem e;
    public ParticleSystem eMat;
    [SerializeField] private float duration;

    private void Start()
    {
        if (duration == 0)
        {
            duration = e.main.duration;
        }
        Invoke("SelfRecycle", duration);
    }

    public void Play()
    {
        if (e != null)
        {
            e.Play();
        }
    }

    private void SelfRecycle()
    {
        //e.Recycle();
        Destroy(gameObject);
    }
}
