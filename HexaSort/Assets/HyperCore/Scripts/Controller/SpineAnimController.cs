//using Spine;
//using Spine.Unity;
//using System.Collections;
//using System.Collections.Generic;
//using UnityEngine;

//public class SpineAnimController : MonoBehaviour
//{
//    public SkeletonAnimation SkeletonData;
//    [SerializeField]
//    private SkeletonGraphic animatorGraphic;
//    [SerializeField]
//    private bool isGraphic = false;
//    private MeshRenderer meshRenderer;
//    public bool IgnoreTimescale = false;
//    private float deltaTime;
//    private float lastRecordTime;
//    public string CurrentAnimationName
//    {
//        get
//        {
//            return SkeletonData.AnimationName;
//        }
//        set
//        {
//            SkeletonData.AnimationName = value;
//        }
//    }

//    public TrackEntry PlayAnim(string anim, bool loop, bool mixPrevious = false, float delay = 0, Spine.AnimationState.TrackEntryDelegate onEnd = null)
//    {
//        TrackEntry a;
//        if (isGraphic)
//        {
//            a = animatorGraphic.AnimationState.SetAnimation(0, anim, loop);
//        }
//        else
//        {
//            a = SkeletonData.AnimationState.SetAnimation(0, anim, loop);
//        }
//        if (!mixPrevious)
//        {
//            a.MixDuration = 0;
//        }
//        a.Delay = delay;
//        if (onEnd != null)
//        {
//            a.Complete += onEnd;
//        }
//        return a;
//    }

//    private void Update()
//    {
//        if (IgnoreTimescale && Time.timeScale == 0)
//        {
//            deltaTime = Time.realtimeSinceStartup - lastRecordTime;
//            if (SkeletonData != null)
//            {
//                SkeletonData.Update(deltaTime);
//            }
//            lastRecordTime = Time.realtimeSinceStartup;
//        }
//    }

//    public TrackEntry AddAnimToQueue(string anim, bool loop, float delay = 0, float mixDuration = 0.2f)
//    {
//        TrackEntry a = SkeletonData.AnimationState.AddAnimation(0, anim, loop, delay);
//        a.MixDuration = mixDuration;
//        return a;
//    }

//    public void ChangeSkin(string skin)
//    {
//        //animator.initialSkinName = skin;
//        if (isGraphic)
//        {
//            animatorGraphic.Skeleton.SetSkin(skin);
//        }
//        else
//        {
//            SkeletonData.Skeleton.SetSkin(skin);
//        }
//    }

//    public void FlipX(bool isFlip)
//    {
//        SkeletonData.Skeleton.ScaleX = isFlip ? -1 : 1;
//    }

//    public SkeletonAnimation GetSkeleton()
//    {
//        return SkeletonData;
//    }

//    public void StopAllAnimations(bool resetPose = false)
//    {
//        SkeletonData.state.ClearTracks();
//        if (resetPose)
//        {
//            SkeletonData.skeleton.SetToSetupPose();
//        }
//    }

//    public void SetUpPose()
//    {
//        SkeletonData.state.Apply(SkeletonData.skeleton);
//    }

//    public void SetDrawOrder(int order)
//    {
//        if (meshRenderer == null)
//        {
//            meshRenderer = GetComponent<MeshRenderer>();
//        }
//        meshRenderer.sortingOrder = order;
//    }

//    public void SetTimeScale(float timeScale)
//    {
//        if (isGraphic)
//        {
//            animatorGraphic.timeScale = timeScale;
//        }
//        else
//        {
//            SkeletonData.timeScale = timeScale;
//        }
//    }

//    public void Fade(float to, float time)
//    {
//        if (isGraphic)
//        {
//            LeanTween.value(animatorGraphic.color.a, to, time).setOnUpdate((float f) =>
//            {
//                animatorGraphic.color = new Color(animatorGraphic.color.r, animatorGraphic.color.g, animatorGraphic.color.b, f);
//            });
//        }
//        else
//        {
//            LeanTween.value(SkeletonData.skeleton.GetColor().a, to, time).setOnUpdate((float f) =>
//            {
//                SkeletonData.skeleton.SetColor(new Color(SkeletonData.skeleton.GetColor().r, SkeletonData.skeleton.GetColor().g, SkeletonData.skeleton.GetColor().b, f));
//            });
//        }
//    }
//}
