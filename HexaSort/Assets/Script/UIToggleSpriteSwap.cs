using System;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace UnityEngine.UI
{
    public class UIToggleSpriteSwap : UIBaseInteractive, IPointerClickHandler
    {
        [SerializeField]
        private Image avatar;
        [SerializeField]
        private Sprite spriteOn;
        [SerializeField]
        private Sprite spriteOff;
        [SerializeField]
        private bool isOn = true;
        private float pressedY { get; set; }
        public Toggle.ToggleEvent OnValueChange;

        private void Start()
        {
            if (avatar == null)
            {
                avatar = GetComponent<Image>();
            }
            avatar.sprite = isOn ? spriteOn : spriteOff;
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
                if (avatar != null)
                {
                    avatar.sprite = value ? spriteOn : spriteOff;
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
            tweenColorID = LeanTween.color(avatar.rectTransform, new Color(0.8f, 0.8f, 0.8f), 0.1f).setIgnoreTimeScale(true).id;
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
            tweenColorID = LeanTween.color(avatar.rectTransform, Color.white, 0.1f).setIgnoreTimeScale(true).id;
            LeanTween.moveLocalY(avatar.gameObject, pressedY, 0.1f).setIgnoreTimeScale(true);
            LeanTween.scale(avatar.gameObject, Vector3.one, 0.1f).setIgnoreTimeScale(true);
        }

        public void Toggle()
        {
            IsOn = !IsOn;
        }
    }

}
