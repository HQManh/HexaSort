//using UnityEngine;
//using Cinemachine;

///// <summary>
///// An add-on module for Cinemachine Virtual Camera that locks the camera's X co-ordinate
///// </summary>
//[ExecuteInEditMode]
//[SaveDuringPlay]
//public class CMCameraLock : CinemachineExtension
//{
//    public Vector3Axis LockAxis;
//    [Tooltip("Lock the camera's X position to this value")]
//    public float m_XPosition = 0;
//    [Tooltip("Lock the camera's Y position to this value")]
//    public float m_YPosition = 0;
//    [Tooltip("Lock the camera's Z position to this value")]
//    public float m_ZPosition = 0;

//    protected override void PostPipelineStageCallback(
//        CinemachineVirtualCameraBase vcam,
//        CinemachineCore.Stage stage, ref CameraState state, float deltaTime)
//    {
//        if (stage == CinemachineCore.Stage.Body)
//        {
//            var pos = state.RawPosition;
//            switch (LockAxis)
//            {
//                case Vector3Axis.All:
//                    pos.x = m_XPosition;
//                    pos.y = m_YPosition;
//                    pos.z = m_ZPosition;
//                    break;
//                case Vector3Axis.X:
//                    pos.x = m_XPosition;
//                    break;
//                case Vector3Axis.Y:
//                    pos.y = m_YPosition;
//                    break;
//                case Vector3Axis.Z:
//                    pos.z = m_ZPosition;
//                    break;
//                case Vector3Axis.XY:
//                    pos.x = m_XPosition;
//                    pos.y = m_YPosition;
//                    break;
//                case Vector3Axis.XZ:
//                    pos.x = m_XPosition;
//                    pos.z = m_ZPosition;
//                    break;
//                case Vector3Axis.YZ:
//                    pos.y = m_YPosition;
//                    pos.z = m_ZPosition;
//                    break;
//                default:
//                    break;
//            }
//            state.RawPosition = pos;
//        }
//    }
//}