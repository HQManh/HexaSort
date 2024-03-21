using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum Vector3Axis
{
    All,
    X,
    Y,
    Z,
    XY,
    XZ,
    YZ,
}
public class TransformFollow : MonoBehaviour
{
    public Vector3Axis FollowAxis = Vector3Axis.All;
    public Transform Target;
    public float Stickiness = 0.5f;
    public Vector3 Offset;

    // Update is called once per frame
    void FixedUpdate()
    {
        if (Target != null)
        {
            switch (FollowAxis)
            {
                case Vector3Axis.All:
                    transform.position = Target.position + Offset;
                    break;
                case Vector3Axis.X:
                    transform.position = Vector3.Lerp(transform.position, new Vector3(Target.position.x, transform.position.y, transform.position.z) + Offset, Stickiness);
                    break;
                case Vector3Axis.Y:
                    transform.position = Vector3.Lerp(transform.position, new Vector3(transform.position.x, Target.position.y, transform.position.z) + Offset, Stickiness);
                    break;
                case Vector3Axis.Z:
                    Offset = new Vector3(0, 0, Offset.z);
                    transform.position = Vector3.Lerp(transform.position, new Vector3(transform.position.x, transform.position.y, Target.position.z) + Offset, Stickiness);
                    break;
                case Vector3Axis.XY:
                    transform.position = Vector3.Lerp(transform.position, new Vector3(Target.position.x, Target.position.y, transform.position.z) + Offset, Stickiness);
                    break;
                case Vector3Axis.XZ:
                    Offset = new Vector3(Offset.x, 0, Offset.z);

                    transform.position = Vector3.Lerp(transform.position, new Vector3(Target.position.x, transform.position.y, Target.position.z) + Offset, Stickiness);
                    break;
                case Vector3Axis.YZ:
                    transform.position = Vector3.Lerp(transform.position, new Vector3(Target.position.x, transform.position.y, transform.position.z) + Offset, Stickiness);
                    break;
                default:
                    break;
            }
        }
    }
}
