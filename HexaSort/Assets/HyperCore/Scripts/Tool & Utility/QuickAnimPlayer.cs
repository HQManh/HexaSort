using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuickAnimPlayer : MonoBehaviour
{
    [SerializeField] private Animator anim;
    [SerializeField] private string animName;
    [SerializeField] private string triggerName;

    private void Start()
    {
        if(anim == null)
        {
            anim = GetComponent<Animator>();
        }
        if (anim != null)
        {
            anim.Play(animName, 0, 0);
            anim.SetTrigger(triggerName);
            anim.keepAnimatorStateOnDisable = true;
        }
    }
}
