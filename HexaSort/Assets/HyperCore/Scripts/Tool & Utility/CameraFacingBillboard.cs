//cameraFacingBillboard.cs v02
//by Neil Carter (NCarter)
//modified by Juan Castaneda (juanelo), Hoang Pham Vu (brastik)
//
//added in-between GRP object to perform rotations on
//added auto-find main camera
//added un-initialized state, where script will do nothing
using UnityEngine;
using System.Collections;


public class CameraFacingBillboard : MonoBehaviour
{

    public Camera m_Camera;
    public bool amActive = false;
    public bool autoInit = false;
    GameObject myContainer;

    void Awake()
    {
        if (autoInit == true)
        {
            m_Camera = CameraController.Instance.GameCamera;
            amActive = true;
        }

        myContainer = new GameObject();
        myContainer.name = "CameraFacingBillboard";
        myContainer.transform.SetParent(transform.parent);
        myContainer.transform.localScale = Vector3.one;
        myContainer.transform.position = transform.position;
        transform.SetParent(myContainer.transform);
        transform.localEulerAngles = Vector3.zero;
    }

    //Orient the camera after all movement is completed this frame to avoid jittering
    void LateUpdate()
    {
        if (amActive == true && m_Camera != null)
        {
            myContainer.transform.LookAt(myContainer.transform.position + m_Camera.transform.rotation * Vector3.forward, m_Camera.transform.rotation * Vector3.up);
        }
    }
}