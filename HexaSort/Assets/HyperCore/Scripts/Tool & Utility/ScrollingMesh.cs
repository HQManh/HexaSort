using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ScrollingMesh : MonoBehaviour
{
    [SerializeField]
    private MeshRenderer meshRenderer;
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
    private float moveRatio { get; set; }
    private Material meshMat { get; set; }
    private string texName { get; set; }
    private Vector2 textureOffset { get; set; }

    private void Start()
    {
        if (target != null)
        {
            lastTargetPos = target.position;
            isFollowingTarget = true;
            meshMat = meshRenderer.sharedMaterial;
            texName = meshMat.GetTexturePropertyNames()[0];
            moveRatio = targetFollowRatio * (meshRenderer.transform.localScale.x / GlobalController.ScreenResolution.x) / GlobalController.ScreenSize.x;
            textureOffset = meshMat.GetTextureOffset(texName);
        }
    }

    private void Update()
    {
        if (isFollowingTarget)
        {
            targetGap = target.position - lastTargetPos;
            if (scrollingDirection == Direction.Horizontal)
            {
                moveGap = new Vector3(targetGap.x * moveRatio, 0);
            }
            else
            {
                moveGap = new Vector3(0, targetGap.y * moveRatio);
            }

            textureOffset += new Vector2(moveGap.x, moveGap.y);
            meshMat.SetTextureOffset(texName, textureOffset);
            lastTargetPos = target.position;
        }
    }
}
