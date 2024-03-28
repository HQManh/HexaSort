using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class BoosterControl : MonoBehaviour
{
    public GameObject hammer;
    public GameObject hand;
    public GameObject swap;
    public TextMeshProUGUI hammerText;
    public TextMeshProUGUI handText;
    public TextMeshProUGUI swapText;

    public void SetUpBooster()
    {
        int i = GlobalControll.Hammer;
        if(i == 0)
        {
            hammer.transform.GetChild(1).gameObject.SetActive(true);
        }
        else
        {
            hammer.transform.GetChild(0).gameObject.SetActive(true);
        }

    }

}
