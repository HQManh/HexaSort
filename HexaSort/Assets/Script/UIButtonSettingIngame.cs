using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class UIButtonSettingIngame : UIBaseInteractive, IPointerClickHandler
{
    [SerializeField]
    private Image avatar;
    [SerializeField]
    private Image icon;
    [SerializeField]
    private bool isOn = true;
    private float pressedY { get; set; }
    public Toggle.ToggleEvent OnValueChange;
    Color32 startColor;


    private void Start()
    {
        if (avatar == null)
        {
            avatar = GetComponent<Image>();
        }
        if (isOn)
        {
            icon.gameObject.SetActive(false);
        }
        else
        {
            icon.gameObject.SetActive(true);
        }
        onFingerDown.AddListener(OnFingerDown);
        onFingerUp.AddListener(OnFingerUp);
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
                icon.gameObject.SetActive(false);
            }
            else
            {
                icon.gameObject.SetActive(true);
            }
        }
    }

    private int tweenColorID;

    private void OnFingerDown()
    {
        if (avatar.transform != null)
        {
            LeanTween.cancel(tweenColorID, true);
            LeanTween.cancel(avatar.gameObject, true);
        }

        pressedY = avatar.transform.localPosition.y;
        LeanTween.moveLocalY(avatar.gameObject, avatar.transform.localPosition.y - 5, 0.1f).setIgnoreTimeScale(true);
        LeanTween.scale(avatar.gameObject, Vector3.one * 0.98f, 0.1f).setIgnoreTimeScale(true);

    }

    private void OnFingerUp()
    {
        if (avatar.transform != null)
        {
            LeanTween.cancel(tweenColorID, true);
            LeanTween.cancel(avatar.gameObject, true);
        }
        LeanTween.moveLocalY(avatar.gameObject, pressedY, 0.1f).setIgnoreTimeScale(true);
        LeanTween.scale(avatar.gameObject, Vector3.one, 0.1f).setIgnoreTimeScale(true);
    }

    public void Toggle()
    {
        IsOn = !IsOn;
    }
}
