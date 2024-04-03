using UnityEngine;
using System.Collections;
using UnityEngine.UI;

[System.Serializable]
public class PoolAndInstantiate
{
    public int Size;
    public GameObject Prefab;
    public Transform Parent;
}

public class ObjectPoolManager : MonoBehaviour
{

    public static ObjectPoolManager Instance;
    public PoolAndInstantiate[] lstPool;
    //public AnimatedClass AnimatedObject;
    // Use this for initialization
    void Awake()
    {
        Instance = this;
        //AnimatedObject.CreatePool(1);
        CreatePoolInstantiate();
    }

    private void CreatePoolInstantiate()
    {
        if (lstPool != null && lstPool.Length > 0)
        {
            for (int i = 0; i < lstPool.Length; i++)
                CreatePool(lstPool[i]);
        }
    }

    private void CreatePool(PoolAndInstantiate poolObj)
    {
        poolObj.Prefab.CreatePool(poolObj.Size);

        for (int i = 0; i < poolObj.Size; i++)
        {
            //var obj = 
            poolObj.Prefab.Spawn(poolObj.Parent);
            //Utils.SetParentNGUI(obj, poolObj.Parent.gameObject, true);
        }
    }

}
