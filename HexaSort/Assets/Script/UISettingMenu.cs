using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class UISettingMenu : UIBaseInteractive, IPointerClickHandler
{
    [SerializeField]
    private List<Image> imageList;
    [SerializeField]
    private bool isOn = true;
    private float pressedY { get; set; }
    public Toggle.ToggleEvent OnValueChange;
    [SerializeField]
    Color32 onColor;
    [SerializeField]
    Color32 offColor;


    private void Start()
    {
        if (isOn)
        {
            imageList[0].color = onColor;
            imageList[1].color = onColor;
            imageList[1].rectTransform.localPosition = new Vector3(90f, 0f);
            imageList[2].gameObject.SetActive(isOn);
        }
        else
        {
            imageList[0].color = offColor;
            imageList[1].color = offColor;
            imageList[1].rectTransform.localPosition = new Vector3(-90f, 0f);
            imageList[2].gameObject.SetActive(isOn);
        }
    }

    public override void OnPointerClick(PointerEventData eventData)
    {
        base.OnPointerClick(eventData);
        IsOn = !IsOn;
        OnValueChange.Invoke(IsOn);
    }

    public bool IsOn
    {
        get { return isOn; }
        set
        {
            isOn = value;
            if (isOn)
            {
                imageList[0].color = onColor;
                imageList[1].color = onColor;
                imageList[1].rectTransform.localPosition = new Vector3(90f, 0f);
                imageList[2].gameObject.SetActive(isOn);
            }
            else
            {
                imageList[0].color = offColor;
                imageList[1].color = offColor;
                imageList[1].rectTransform.localPosition = new Vector3(-90f, 0f);
                imageList[2].gameObject.SetActive(isOn);
            }
        }
    }

    public void Toggle()
    {
        IsOn = !IsOn;
    }
}
