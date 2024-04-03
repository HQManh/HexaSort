using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationEventController : MonoBehaviour
{
    public Action<int> EventCallback;

    public void OnEventState(int state)
    {
        EventCallback(state);
    }
}
