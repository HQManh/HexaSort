using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum CharacterState
{
    Idle,
    Move,
    FreeFall,
    Win,
    Lose,
    Attack,
    Stunned,
    Jump,
    Fall
}

public class Character : MonoBehaviour
{
    public Transform CenterPoint;
    public Collider HitBox;
    public Transform CenterHitBox;
    public CharacterState CurrentState;
    public float MoveSpeed = 1f;
    public Vector3 CurrentVelocity;
    public Rigidbody RigidRagdoll;
    protected Vector2 moveDirection;
    [SerializeField] protected CharacterController controller;
    [SerializeField] protected GameObject dialog;
    [SerializeField] protected CharAnimController anim;
    [SerializeField] protected AnimationEventController[] animEvents;
    protected float moveSpeedScale = 1.5f;
    protected bool isOnGround;

    public virtual void SetUp(int index, float delay)
    {
        CurrentState = CharacterState.Idle;
        for (int i = 0; i < animEvents.Length; i++)
        {
            animEvents[i].EventCallback = OnAnimCallback;
        }
    }

    protected virtual void OnAnimCallback(int state)
    {
        switch (state)
        {
            case 0:
                break;
            case 1:
                break;
            default:
                break;
        }
    }

    public virtual void StartMoving()
    {
        CurrentState = CharacterState.Move;
    }


    public virtual void OnHit()
    {
    }

    public void PlayAnimState(CharacterAnimationState state, float speed = 1f, float normalizedTime = 0f, int layer = 0)
    {
        anim.PlayAnim(state, speed, normalizedTime, layer);
    }

    private void Update()
    {
        if (controller != null && controller.enabled)
        {
            isOnGround = controller.isGrounded;
            if (CurrentState == CharacterState.Move)
            {
                CurrentVelocity = MoveSpeed * moveDirection * moveSpeedScale;
            }
            if (isOnGround && CurrentVelocity.y < 0)
            {
                CurrentVelocity.y = 0f;
            }
            transform.LookAt(transform.position - (Vector3)moveDirection);
            CurrentVelocity.y += Physics.gravity.y * Time.deltaTime;
            controller.Move(CurrentVelocity * Time.deltaTime);
        }
    }

    public virtual void Celebrate()
    {
        //if (CurrentState == CharacterState.Move || CurrentState == CharacterState.Idle)
        //{
        CurrentState = CharacterState.Win;
        if (dialog != null)
        {
            dialog.SetActive(false);
        }
    }

    public void OnTriggerEnter(Collider other)
    {
        if (StageController.Instance.IsOver) return;
        switch (other.transform.tag)
        {
            default:
                break;
        }
    }

    public void Jump(float height)
    {
        CurrentVelocity.y += Mathf.Sqrt(height * -3.0f * Physics.gravity.y);
    }
}
