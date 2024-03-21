using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public enum CharacterAnimationState
{
    Idle,
    Run,
    Win,
    Die,
    IdleSad,
    Walk,
    Surprise,
    Scare,
    Attack,
    Jump
}

[Serializable]
public struct CharAnim
{
    [HideInInspector] public string Name;
    public int NumAnims;
}

public class CharAnimController : MonoBehaviour
{
    public Animator anim;
    [SerializeField] private CharAnim[] characterAnims = new CharAnim[Utility.GetEnumLength<CharacterAnimationState>()];
    [SerializeField] private Collider[] ragdollColliders;
    [SerializeField] private Rigidbody[] ragdollRigids;
    [SerializeField] private Rigidbody rootRigid;
    [SerializeField] private bool refresh;
    public string CurrentAnim;
    public string CurrentTrigger = "";

    public Animator Animator { get { return anim; } }

    public void DisableAnimator(bool enableRagdoll = true)
    {
        anim.enabled = false;
        if (enableRagdoll)
        {
            SetRagdollActive(true);
        }
    }

    public void SetRagdollActive(bool active, bool resetTransform = false)
    {
        if (ragdollColliders != null)
        {
            for (int i = 0; i < ragdollColliders.Length; i++)
            {
                ragdollColliders[i].isTrigger = !active;
            }
            for (int i = 0; i < ragdollRigids.Length; i++)
            {
                ragdollRigids[i].angularVelocity = Vector3.zero;
                ragdollRigids[i].velocity = Vector3.zero;
                ragdollRigids[i].isKinematic = !active;
            }
        }
        if (!active && rootRigid != null && resetTransform)
        {
            rootRigid.transform.localEulerAngles = new Vector3(0, rootRigid.transform.localEulerAngles.y, 0);
        }
    }

    public void PlayAnim(string anim, float speed = 1, float normalizedTime = 0, int layer = 0, bool resetTransform = false)
    {
        this.anim.enabled = true;
        SetRagdollActive(false, resetTransform);
        if (CurrentTrigger != "")
        {
            this.anim.ResetTrigger(CurrentTrigger);
        }
        this.anim.Play(anim, layer, normalizedTime);
        this.anim.speed = speed;
    }

    public void PauseAnimAt(string anim, float time)
    {
        this.anim.speed = 0;
        this.anim.Play(anim, 0, time);
    }

    public void PlayAnim(CharacterAnimationState state, float speed = 1, float normalizedTime = 0, int layer = 0, bool resetTransform = false)
    {
        if (anim == null) return;
        this.anim.enabled = true;
        if (CurrentTrigger != "")
        {
            this.anim.ResetTrigger(CurrentTrigger);
            anim.StopPlayback();
        }
        SetRagdollActive(false, resetTransform);
        CurrentAnim = state.ToString().ToLower() + UnityEngine.Random.Range(0, characterAnims[(int)state].NumAnims).ToString("00");
        anim.Play(CurrentAnim, layer, normalizedTime);
        anim.speed = speed;
    }

    public void TriggerAnim(string trigger, float speed = 1)
    {
        if (anim == null) return;
        SetRagdollActive(false);
        if (!anim.GetBool(trigger))
        {
            CurrentTrigger = trigger;
            anim.SetTrigger(trigger);
        }
        anim.speed = speed;
    }

    private void OnValidate()
    {
        if (Utility.GetEnumLength<CharacterAnimationState>() > characterAnims.Length)
        {
            Array.Resize(ref characterAnims, Utility.GetEnumLength<CharacterAnimationState>());
        }
        for (int i = 0; i < characterAnims.Length; i++)
        {
            characterAnims[i].Name = "State " + (CharacterAnimationState)i;
        }
        if (refresh)
        {
            refresh = false;
            ragdollColliders = GetComponentsInChildren<Collider>();
            ragdollRigids = GetComponentsInChildren<Rigidbody>();
            SetRagdollActive(false);
        }
    }
}
