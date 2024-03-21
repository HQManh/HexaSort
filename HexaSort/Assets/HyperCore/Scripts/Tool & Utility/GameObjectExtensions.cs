using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class GameObjectExtensions
{
    public static void SetLayer(this GameObject gameObject, int layer, bool includeChildren = false)
    {
        if (!gameObject) return;
        if (!includeChildren)
        {
            gameObject.layer = layer;
            return;
        }

        foreach (var child in gameObject.GetComponentsInChildren(typeof(Transform), true))
        {
            child.gameObject.layer = layer;
        }
    }
}
