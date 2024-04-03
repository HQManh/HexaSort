using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FacingCamera : MonoBehaviour
{
    private void Update()
    {
        transform.LookAt(CameraController.Instance.transform);
    }
}
