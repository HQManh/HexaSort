using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

/// <summary>
/// <ref>UIButtonSimple</ref> uses UnityUI and DOTween.
/// </summary>
public class UIButton : UIBaseInteractive
{
    [SerializeField]
    private Image avatar;
    [SerializeField]
    private Sprite spritePressed;
    [SerializeField]
    private bool soundOn = true;
    [SerializeField]
    private AudioClip sfxPress;
    private Sprite spriteNormal;
    private float pressedY { get; set; }
    private Vector3 startScale { get; set; }
    public Color StartColor { get; set; }
    private Color pressedColor { get { return new Color(StartColor.r * 0.5f, StartColor.g * 0.5f, StartColor.b * 0.5f, StartColor.a); } }

    // Use this for initialization
    void Start()
    {
        if (avatar == null)
        {
            avatar = GetComponent<Image>();
        }
        spriteNormal = avatar.sprite;
        StartColor = avatar.color;
        if (spritePressed == null)
        {
            spritePressed = spriteNormal;
        }
        pressedY = avatar.transform.localPosition.y;
        startScale = avatar.transform.localScale;
        onFingerDown.AddListener(OnFingerDown);
        onFingerUp.AddListener(OnFingerUp);
    }

    private int tweenColorID = -1;

    private void OnFingerDown()
    {
        avatar.sprite = spritePressed;
        if (avatar.rectTransform != null && avatar.transform != null)
        {
            LeanTween.cancel(tweenColorID, true);
            LeanTween.cancel(avatar.gameObject, true);
        }
        pressedY = avatar.transform.localPosition.y;
        tweenColorID = LeanTween.color(avatar.rectTransform, pressedColor, 0.1f).setRecursive(false).setIgnoreTimeScale(true).id;
        LeanTween.moveLocalY(avatar.gameObject, avatar.transform.localPosition.y - 5, 0.1f).setIgnoreTimeScale(true);
        LeanTween.scale(avatar.gameObject, startScale * 0.98f, 0.1f).setIgnoreTimeScale(true);
        if (soundOn && SoundController.Instance != null)
        {
            if (sfxPress != null)
            {
                SoundController.Instance.PlaySingle(sfxPress);
            }
            else if (SoundController.Instance.SfxButton != null)
            {
                SoundController.Instance.PlaySingle(SoundController.Instance.SfxButton);
            }
        }
    }

    private void OnFingerUp()
    {
        avatar.sprite = spriteNormal;
        if (avatar.rectTransform != null && avatar.transform != null)
        {
            LeanTween.cancel(tweenColorID, true);
            LeanTween.cancel(avatar.gameObject, true);
        }
        tweenColorID = LeanTween.color(avatar.rectTransform, StartColor, 0.1f).setIgnoreTimeScale(true).setRecursive(false).id;
        LeanTween.moveLocalY(avatar.gameObject, pressedY, 0.1f).setIgnoreTimeScale(true);
        LeanTween.scale(avatar.gameObject, startScale, 0.1f).setIgnoreTimeScale(true);
    }
}
