using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class BoosterControl : MonoBehaviour
{
    public GameObject hammer;
    public GameObject hand;
    public GameObject swap;
    public GameObject priceHammer;
    public GameObject priceHand;
    public GameObject priceSwap;
    public TextMeshProUGUI hammerText;
    public TextMeshProUGUI handText;
    public TextMeshProUGUI swapText;

    public void SetUpBooster()
    {
        int i = GlobalControll.Hammer;
        if (GlobalControll.CurrentLevelIndex < -1)
        {
            hammer.transform.GetChild(1).gameObject.SetActive(true);
        }
        else
        {
            hammer.transform.GetChild(0).gameObject.SetActive(true);
            if (i == 0)
            {
                hammerText.text = i.ToString();
                hammerText.transform.parent.gameObject.SetActive(true);
                //priceHammer.SetActive(true);
            }
            else
            {
                hammerText.text = i.ToString();
                hammerText.transform.parent.gameObject.SetActive(true);

            }
        }
        i = GlobalControll.Swap;
        if (GlobalControll.CurrentLevelIndex < -1)
        {
            swap.transform.GetChild(1).gameObject.SetActive(true);
        }
        else
        {
            swap.transform.GetChild(0).gameObject.SetActive(true);
            if (i == 0)
            {
                swapText.text = i.ToString();
                swapText.transform.parent.gameObject.SetActive(true);
                //priceSwap.SetActive(true);
            }
            else
            {
                swapText.text = i.ToString();
                swapText.transform.parent.gameObject.SetActive(true);
            }
        }
        i = GlobalControll.Hand;
        if (GlobalControll.CurrentLevelIndex < -1)
        {
            hand.transform.GetChild(1).gameObject.SetActive(true);
        }
        else
        {
            hand.transform.GetChild(0).gameObject.SetActive(true);
            if (i == 0)
            {
                handText.text = i.ToString();
                handText.transform.parent.gameObject.SetActive(true);
                //priceHand.SetActive(true);
            }
            else
            {
                handText.text = i.ToString();
                handText.transform.parent.gameObject.SetActive(true);
            }
        }
    }

}
