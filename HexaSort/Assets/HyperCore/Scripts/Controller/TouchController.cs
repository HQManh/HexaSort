using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class TouchController : Singleton<TouchController>,
    IPointerDownHandler,
    IPointerClickHandler,
    IPointerUpHandler,
    IDragHandler,
    IBeginDragHandler,
    IEndDragHandler
{
    [SerializeField] private DynamicJoystick joystick;

    public void OnBeginDrag(PointerEventData eventData)
    {
    }

    public void OnDrag(PointerEventData eventData)
    {
    }

    public void OnEndDrag(PointerEventData eventData)
    {
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        Debug.Log("Click");
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        if (IsReady() && GlobalController.CurrentStage == StageScreen.Home)
        {
            //GameUIController.Instance.HideTut();
        }
    }

    public void OnPointerUp(PointerEventData eventData)
    {
    }

    private bool IsReady()
    {
        return
            LevelController.Instance != null &&
            LevelController.Instance.Level != null &&
            !StageController.Instance.IsOver;
    }
}
