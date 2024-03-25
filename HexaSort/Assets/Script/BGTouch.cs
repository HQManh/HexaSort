using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class BGTouch : MonoBehaviour, IPointerClickHandler, IBeginDragHandler,IDragHandler, IEndDragHandler
{
    public enum BGType
    {
        SettingInGame,
        BGHold
    }

    [SerializeField]
    BGType type;

    public void OnPointerClick(PointerEventData eventData)
    {
        if(type == BGType.SettingInGame)
        {
            UIController.Instance.OffSettingInGame();
        }
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        if(type == BGType.BGHold)
        {
            UIController.Instance.FadeHoldCover(true);
        }
    }

    public void OnDrag(PointerEventData eventData)
    {

    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (type == BGType.BGHold)
        {
            UIController.Instance.FadeHoldCover(false);
        }
    }
}