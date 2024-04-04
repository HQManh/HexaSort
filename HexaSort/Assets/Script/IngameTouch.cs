using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using static BGTouch;

public class IngameTouch : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler
{
    Vector3 startPos;
    Vector3 currentPos;

    public void OnBeginDrag(PointerEventData eventData)
    {
        startPos = Input.mousePosition;
    }

    public void OnDrag(PointerEventData eventData)
    {
        currentPos = Input.mousePosition;
    }

    public void OnEndDrag(PointerEventData eventData)
    {

    }
}
