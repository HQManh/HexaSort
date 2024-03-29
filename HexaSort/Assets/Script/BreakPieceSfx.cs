using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BreakPieceSfx : MonoBehaviour
{
    [SerializeField]
    Image image;
    [SerializeField]
    GameObject progressBar;

    public void SetColor(int id)
    {
        var imageTemp = Instantiate(image);
        imageTemp.gameObject.SetActive(true);
        imageTemp.color = CurrentData.Instance.materialsColor[id].color;
        List<Vector3> points = new();
        var t = transform.position;
        points.Add(t);
        t += new Vector3(2f, 0f, 0f);
        points.Add(t);
        t += new Vector3(0f, 02f, 0f);
        points.Add(t);
        points.Add(progressBar.transform.position);
    }
}
