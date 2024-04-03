using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveOnMouse : MonoBehaviour
{
    private Plane plane;
    private Ray ray;
    protected Vector3 movePos;
    protected Vector3 nextPos;
    private float distance;
    [SerializeField] private float moveEase = 0.5f;
    public bool IsAuto;
    private Vector3 lastPos;
    private Vector3 delta;

    private void Start()
    {
        lastPos = transform.position;
    }

    public void UpdateMovePos(Vector3 inPoint, bool withEase = true)
    {
        /// Ground plane. If you don't see transform moving, it's likely the plane is facing wrong direction.
        /// May try changing Vector3.up or Vector3.forward for inNormal param of new Plane(...) method.
        plane = new Plane(Vector3.up, inPoint);

        ray = CameraController.Instance.GameCamera.ScreenPointToRay(Input.mousePosition);

        if (plane.Raycast(ray, out distance))
        {
            movePos = ray.GetPoint(distance); // distance along the ray
        }
        delta = movePos - lastPos;
        if (withEase)
        {
            nextPos = transform.position + delta;
            transform.position = Vector3.Lerp(transform.position, nextPos, moveEase);
        }
        else
        {
            //transform.position += delta;
            //lastPos = transform.position;
        }
        lastPos = movePos;
    }

    void Update()
    {
        if (IsAuto)
        {
            UpdateMovePos(transform.position);
        }
    }
}
