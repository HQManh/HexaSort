using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Singleton<T> : MonoBehaviour where T : MonoBehaviour
{
    protected static T mInstance;
    public static T Instance
    {
        get
        {
            if (null == mInstance)
            {
                mInstance = (T)FindObjectOfType(typeof(T));
            }
            return mInstance;
        }
        set
        {
            mInstance = value;
        }
    }
    public static bool HasInstance
    {
        get
        {
            return mInstance != null;
        }
    }
    public void Destroy()
    {
        if (mInstance == this)
            mInstance = null;
    }
    protected virtual void Awake()
    {
        if (mInstance == null)
        {
            mInstance = this as T;
        }
        else
        {
            Destroy(gameObject);
        }
    }
    protected virtual void OnDestroy()
    {
        Destroy();
    }
}