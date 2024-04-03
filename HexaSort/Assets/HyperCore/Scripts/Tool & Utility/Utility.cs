using UnityEngine;
using System.IO;
using System;
using UnityEngine.UI;
using System.Collections.Generic;
using System.Runtime.Serialization.Formatters.Binary;
#if UNITY_EDITOR
using UnityEditor;
#endif

/// <summary>
/// Functions to be shown on AP menu items
/// </summary>
public class Utility : MonoBehaviour
{

#if UNITY_EDITOR
    // Menu Items
    [MenuItem("AP/Clear Data")]
    static void ClearData()
    {
        PlayerPrefs.DeleteAll();
        Caching.ClearCache();
    }

    [MenuItem("AP/Capture Screenshot")]
    static void TakeScreenShot()
    {
        if (!Directory.Exists(Application.dataPath + "/Screenshots/")) Directory.CreateDirectory(Application.dataPath + "/Screenshots/");
        var path = Application.dataPath + "/Screenshots/" + DateTime.Now.ToString("yyyyMMddhhmmss") + ".jpg";
        ScreenCapture.CaptureScreenshot(path);
    }

#endif
    public void SaveFileToLocal(byte[] Data, string Name)
    {
#if UNITY_EDITOR
        var path = string.Format(@"Assets/{0}", Name);
#else
            var path = string.Format("{0}/{1}", Application.persistentDataPath, Name);
#endif

#if UNITY_WP8
            //UnityEngine.Windows.File.WriteAllBytes(path, Data);
#else
        System.IO.File.WriteAllBytes(path, Data);
#endif
    }

    /// <summary>
    /// Get the angle between two positions (in degree)
    /// </summary>
    /// <param name="pos1"></param>
    /// <param name="pos2"></param>
    /// <returns>Angle in degree</returns>
    public static float GetAngleBetweenPos(Vector2 pos1, Vector2 pos2)
    {
        float w = pos2.x - pos1.x;
        float h = pos2.y - pos1.y;
        if (h >= 0)
        {
            return (-Mathf.Atan(w / h) * Mathf.Rad2Deg);
        }
        else
        {
            return (180 - Mathf.Atan(w / h) * Mathf.Rad2Deg);
        }
    }

    /// <summary>
    /// Get angle in degree of a velocity vector (actually used for a RigidBody). Velocity needs to different than zero.
    /// </summary>
    /// <param name="v">Non-zero value of the velocity.</param>
    /// <returns></returns>
    public static float GetAngleOfVelocity(Vector2 v)
    {
        if (v.y > 0)
        {
            return (-Mathf.Atan(v.x / v.y) * Mathf.Rad2Deg);
        }
        else if (v.y < 0)
        {
            return (180 - Mathf.Atan(v.x / v.y) * Mathf.Rad2Deg);
        }
        else
        {
            return v.x > 0 ? 0 : 180;
        }
    }

    public static float GetAngleBetweenVectors(Vector2 v1, Vector2 v2)
    {
        float angle = Mathf.Abs(GetAngleBetweenPos(Vector2.zero, v1) - GetAngleBetweenPos(Vector2.zero, v2));
        if (angle > 180)
        {
            angle = 360 - angle;
        }
        return angle;
    }

    public static Vector2 GetForceVector(Vector2 origin, Vector2 des)
    {
        Vector2 forceVector = (des - origin);
        forceVector.Normalize();
        return forceVector;
    }

    public static Vector2 GetForceVector(Transform origin, Transform des)
    {
        if (origin == null || des == null) return Vector2.zero;
        Vector2 forceVector = (des.position - origin.position);
        forceVector.Normalize();
        return forceVector;
    }

    // http://answers.unity3d.com/questions/56429/enum-choose-random-.html
    /// <summary>
    /// Get a random enum from (inclusive) to (inclusive)
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="from"></param>
    /// <param name="to">-1 for max</param>
    /// <returns></returns>
    public static T GetRandomEnum<T>(int from = 0, int to = -1, List<T> exceptValues = null)
    {
        Array A = Enum.GetValues(typeof(T));
        T V = (T)A.GetValue(UnityEngine.Random.Range(from, to == -1 ? A.Length : to));
        if (exceptValues == null)
        {
            return V;
        }
        do
        {
            V = (T)A.GetValue(UnityEngine.Random.Range(from, to == -1 ? A.Length : to));
        } while (exceptValues.Contains(V));
        return V;
    }

    public static int DirCount(DirectoryInfo d, string fileExtension = "")
    {
        int i = 0;
        // Add file sizes.
        FileInfo[] fis = d.GetFiles();
        foreach (FileInfo fi in fis)
        {
            if (fi.Extension.Contains(fileExtension))
                i++;
        }
        return i;
    }

    public static int GetEnumLength<T>()
    {
        Array A = Enum.GetValues(typeof(T));
        return A.Length;
    }


    public static byte[] ObjectToByteArray(object obj)
    {
        if (obj == null)
            return null;
        BinaryFormatter bf = new BinaryFormatter();
        using (MemoryStream ms = new MemoryStream())
        {
            bf.Serialize(ms, obj);
            return ms.ToArray();
        }
    }

    // Convert a byte array to an Object
    public static object ByteArrayToObject(byte[] arrBytes)
    {
        BinaryFormatter bf = new BinaryFormatter();
        using (MemoryStream ms = new MemoryStream())
        {
            ms.Write(arrBytes, 0, arrBytes.Length);
            ms.Seek(0, SeekOrigin.Begin);
            object obj = bf.Deserialize(ms);

            return obj;
        }
    }

    public static void DoSavePrefab(Transform transform, string savePath, bool enableReplace = false)
    {
#if UNITY_EDITOR
        string prefabName = savePath + transform.name + ".prefab";
        if (!enableReplace)
        {
            int n = 0;
            while (File.Exists(prefabName))
            {
                n++;
                prefabName = savePath + transform.gameObject.name + " " + n + ".prefab";
            }
        }
        UnityEngine.Object prefab = PrefabUtility.CreateEmptyPrefab(prefabName);
        PrefabUtility.ReplacePrefab(transform.gameObject, prefab, ReplacePrefabOptions.ConnectToPrefab);
        AssetDatabase.Refresh();
#endif
    }

    /// <summary>
    /// Get a force value used for a RigidBody to apply AddForce with mode Impulse in order to reach a target position
    /// </summary>
    /// <param name="mass">Mass of the RigidBody</param>
    /// <param name="startPos">Position of the RigidBody</param>
    /// <param name="targetPos">Target position</param>
    /// <param name="initialAngle">Start angle (in degree) that the RigidBody wants to aim. This value can be calculated with a required Height instead.</param>
    /// <returns></returns>
    public static Vector3 GetPhysicsForceToTarget(float mass, Vector3 startPos, Vector3 targetPos, float initialAngle)
    {
        // Selected angle in radians
        float angle = initialAngle * Mathf.Deg2Rad;

        // Positions of this object and the target on the same plane
        Vector3 planarPostion = new Vector3(startPos.x, 0, startPos.z);
        Vector3 planarTarget = new Vector3(targetPos.x, 0, targetPos.z);

        // Planar distance between objects
        float distance = Vector3.Distance(planarTarget, planarPostion);
        // Distance along the y axis between objects
        float yOffset = startPos.y - targetPos.y;

        float initialVelocity = (1 / Mathf.Cos(angle)) *
            Mathf.Sqrt((0.5f * Physics2D.gravity.magnitude * Mathf.Pow(distance, 2)) / (distance * Mathf.Tan(angle) + yOffset));

        Vector3 velocity = new Vector3(0, initialVelocity * Mathf.Sin(angle), initialVelocity * Mathf.Cos(angle));

        // Rotate our velocity to match the direction between the two objects
        //float angleBetweenObjects = Vector3.Angle(Vector3.forward, planarTarget - planarPostion) * (targetPos.x > startPos.x ? 1 : -1);
        float angleBetweenObjects = GetAngleBetweenPos(planarTarget, planarPostion);

        Vector3 finalVelocity = Quaternion.AngleAxis(angleBetweenObjects, Vector3.up) * velocity * mass;
        return finalVelocity;
    }

    public static bool AreLinesIntersecting(out Vector3 intersection, Vector3 a1,
        Vector3 a2, Vector3 b1, Vector3 b2)
    {
        Vector3 aDiff = a2 - a1;
        Vector3 bDiff = b2 - b1;

        Vector3 lineVec3 = b1 - a1;
        Vector3 crossVec1and2 = Vector3.Cross(aDiff, bDiff);
        Vector3 crossVec3and2 = Vector3.Cross(lineVec3, bDiff);

        float planarFactor = Vector3.Dot(lineVec3, crossVec1and2);

        bool intersect;
        //is coplanar, and not parallel
        if (Mathf.Abs(planarFactor) < 0.0001f
                && crossVec1and2.sqrMagnitude > 0.0001f)
        {
            float s = Vector3.Dot(crossVec3and2, crossVec1and2) / crossVec1and2.sqrMagnitude;
            intersection = a1 + (aDiff * s);
            intersect = true;
        }
        else
        {
            intersection = Vector3.zero;
            intersect = false;
        }

        if (intersect)
        {
            float aSqrMagnitude = aDiff.sqrMagnitude;
            float bSqrMagnitude = bDiff.sqrMagnitude;

            if ((intersection - a1).sqrMagnitude <= aSqrMagnitude
                 && (intersection - aDiff).sqrMagnitude <= aSqrMagnitude
                 && (intersection - b1).sqrMagnitude <= bSqrMagnitude
                 && (intersection - bDiff).sqrMagnitude <= bSqrMagnitude)
            {
                return true;
            }
        }
        return false;
    }

    public static bool LineLineIntersection(out Vector3 intersection, Vector3 linePoint1,
        Vector3 lineVec1, Vector3 linePoint2, Vector3 lineVec2)
    {

        Vector3 lineVec3 = linePoint2 - linePoint1;
        Vector3 crossVec1and2 = Vector3.Cross(lineVec1, lineVec2);
        Vector3 crossVec3and2 = Vector3.Cross(lineVec3, lineVec2);

        float planarFactor = Vector3.Dot(lineVec3, crossVec1and2);

        //is coplanar, and not parallel
        if (Mathf.Abs(planarFactor) < 0.0001f
                && crossVec1and2.sqrMagnitude > 0.0001f)
        {
            float s = Vector3.Dot(crossVec3and2, crossVec1and2) / crossVec1and2.sqrMagnitude;
            intersection = linePoint1 + (lineVec1 * s);
            return true;
        }
        else
        {
            intersection = Vector3.zero;
            return false;
        }
    }

    public static bool AreLinesIntersecting(Vector2 l1_p1, Vector2 l1_p2, Vector2 l2_p1, Vector2 l2_p2, bool shouldIncludeEndPoints = true)
    {
        bool isIntersecting = false;

        float denominator = (l2_p2.y - l2_p1.y) * (l1_p2.x - l1_p1.x) - (l2_p2.x - l2_p1.x) * (l1_p2.y - l1_p1.y);

        //Make sure the denominator is > 0, if not the lines are parallel
        if (denominator != 0f)
        {
            float u_a = ((l2_p2.x - l2_p1.x) * (l1_p1.y - l2_p1.y) - (l2_p2.y - l2_p1.y) * (l1_p1.x - l2_p1.x)) / denominator;
            float u_b = ((l1_p2.x - l1_p1.x) * (l1_p1.y - l2_p1.y) - (l1_p2.y - l1_p1.y) * (l1_p1.x - l2_p1.x)) / denominator;

            //Are the line segments intersecting if the end points are the same
            if (shouldIncludeEndPoints)
            {
                //Is intersecting if u_a and u_b are between 0 and 1 or exactly 0 or 1
                if (u_a >= 0f + Constants.EPSILON && u_a <= 1f - Constants.EPSILON && u_b >= 0f + Constants.EPSILON && u_b <= 1f - Constants.EPSILON)
                {
                    isIntersecting = true;
                }
            }
            else
            {
                //Is intersecting if u_a and u_b are between 0 and 1
                if (u_a > 0f + Constants.EPSILON && u_a < 1f - Constants.EPSILON && u_b > 0f + Constants.EPSILON && u_b < 1f - Constants.EPSILON)
                {
                    isIntersecting = true;
                }
            }
        }

        return isIntersecting;
    }

#if UNITY_EDITOR
    public static T InstantiatePrefab<T>(UnityEngine.Object prefab, Transform parent, string name = "")
    {
        GameObject g = PrefabUtility.InstantiatePrefab(prefab, parent) as GameObject;
        g.name = string.IsNullOrEmpty(name) ? prefab.name : name;
        T prefabInstance = g.GetComponent<T>();
        return prefabInstance;
    }
#endif
}
