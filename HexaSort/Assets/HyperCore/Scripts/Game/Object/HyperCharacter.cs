using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum CharacterType
{
    Player,
    AI
}

public class HyperCharacter : Character
{
    public CharacterType Type;

    public void HandleControl(Vector2 movement)
    {
        moveDirection = movement.normalized;
        if(CurrentState != CharacterState.Move)
        {
            StartMoving();
        }
    }

    public void OnRelease()
    {

    }
}
