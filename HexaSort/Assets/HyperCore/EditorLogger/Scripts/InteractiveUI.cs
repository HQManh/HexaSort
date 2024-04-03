using System;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class InteractiveUI : MonoBehaviour,
    IPointerClickHandler,
    IPointerDownHandler,
    IPointerUpHandler,
    IDragHandler,
    IBeginDragHandler,
    IEndDragHandler
{
    public bool isOneTimeInteractable = false;
    public UnityEvent onPress;
    public UnityEvent onFingerDown;
    public UnityEvent onFingerUp;
    private bool isTapped = false;

    public float maxClickThresholdX = 10;
    public float maxClickThresholdY = 10;
    public float maxDragThresholdX = 30;
    public float maxDragThresholdY = 50;

    private bool isDragged;
    private bool currentDragFinished;

    private float dragX;
    private float dragY;

    public ScrollRect draggableRoot;
    public Action<PointerEventData> rootOnBeginDrag, rootOnEndDrag;

    public void OnPointerClick(PointerEventData eventData)
    {
        if (!isTapped && !isDragged)
        {
            onPress.Invoke();
        }
        if (isOneTimeInteractable)
        {
            isTapped = true;
        }
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        isDragged = false;
        currentDragFinished = false;
        onFingerDown.Invoke();
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        onFingerUp.Invoke();
    }

    public void OnDrag(PointerEventData eventData)
    {
        dragX = Mathf.Abs(eventData.pressPosition.x - eventData.position.x);
        dragY = Mathf.Abs(eventData.pressPosition.y - eventData.position.y);
        if (dragX < maxClickThresholdX && dragY < maxClickThresholdY)
        {
            isDragged = false;
        }
        else
        {
            isDragged = true;
        }
        if (!currentDragFinished && (dragX > maxDragThresholdX || dragY > maxDragThresholdY))
        {
            currentDragFinished = true;
            OnPointerUp(eventData);
        }
        if (draggableRoot != null && currentDragFinished)
        {
            draggableRoot.OnDrag(eventData);
        }
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (draggableRoot != null)
        {
            ((IBeginDragHandler)draggableRoot).OnBeginDrag(eventData);
        }
        if (rootOnBeginDrag != null)
        {
            rootOnBeginDrag(eventData);
        }
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (draggableRoot != null)
        {
            ((IEndDragHandler)draggableRoot).OnEndDrag(eventData);
        }
        if (rootOnEndDrag != null)
        {
            rootOnEndDrag(eventData);
        }
    }
}
