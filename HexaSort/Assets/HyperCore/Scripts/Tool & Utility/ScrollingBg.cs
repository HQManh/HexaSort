using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public enum Direction
{
    Horizontal,
    Vertical
}

public class ScrollingBg : MonoBehaviour
{
    private float moveSpeed = 128; // Pixel per second
    private float texLength = 1280;
    private float xOffset = 0;
    [SerializeField]
    private RawImage bg;
    [SerializeField]
    private Direction scrollingDirection;
    [SerializeField]
    private Transform target;
    [SerializeField]
    private float targetFollowRatio = 1f;
    private Vector3 lastTargetPos { get; set; }
    private bool isFollowingTarget { get; set; }
    private Vector3 targetGap { get; set; }
    private Vector3 moveGap { get; set; }
    private float moveRatio;
    public int NumTextures = 1; // Number of textures packed inside the file

    private void Start()
    {
        texLength = (scrollingDirection == Direction.Horizontal ? bg.rectTransform.sizeDelta.x : bg.rectTransform.sizeDelta.y);
        if (target != null)
        {
            lastTargetPos = target.position;
            isFollowingTarget = true;
        }
        moveRatio = targetFollowRatio*(texLength / GlobalController.ScreenResolution.x) / GlobalController.ScreenSize.x;
    }

    public void SetSpeedByTime(float s)
    {
        moveSpeed = (1 / texLength) * s * Time.fixedUnscaledDeltaTime;
    }

    public void SetNumTextures(int num)
    {
        NumTextures = num;
        xOffset = 1f / NumTextures;
    }

    private void Update()
    {
        if (target == null)
        {
            bg.uvRect = new Rect(
                bg.uvRect.x + moveSpeed,
                bg.uvRect.y,
                bg.uvRect.width,
                bg.uvRect.height);
            if (bg.uvRect.x >= 1)
            {
                bg.uvRect = new Rect(
                xOffset - bg.uvRect.x - 1,
                bg.uvRect.y,
                bg.uvRect.width,
                bg.uvRect.height);
            }
        }
        else if (isFollowingTarget)
        {
            targetGap = target.position - lastTargetPos;
            if (scrollingDirection == Direction.Horizontal)
            {
                //moveGap = new Vector3(targetGap.x / Global.ScreenSize.x * texLength / Global.ScreenResolution.x, 0);
                moveGap = new Vector3(targetGap.x * moveRatio, 0);
            }
            else
            {
                //moveGap = new Vector3(0, targetGap.y / Global.ScreenSize.y * texLength / Global.ScreenResolution.y);
                moveGap = new Vector3(0, targetGap.y * moveRatio);
            }
            //moveGap *= targetFollowRatio;
            bg.uvRect = new Rect(bg.uvRect.x + moveGap.x,
                bg.uvRect.y + moveGap.y,
                bg.uvRect.width,
                bg.uvRect.height);
            lastTargetPos = target.position;
        }
    }
}
