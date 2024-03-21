using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public enum CoinPackID
{
    smallpouch,
    mediumpouch,
    bigpouch,
    hugepouch
}
public class Shop : MonoBehaviour
{
    [SerializeField] private ShopItem shopItemPrefab;
    [SerializeField] private CanvasGroup canvasGroup;
    [SerializeField] private Transform[] grids;
    [SerializeField] private ScrollRect[] scrolls;
    [SerializeField] private CanvasGroup[] tabCanvasGroups;
    [SerializeField] private GameObject[] tabContents;
    private CanvasGroup currentTabCanvasGroup;
    private GameObject currentTabContent;
    private List<ShopItem> listSkinItems = new List<ShopItem>();
    private List<ShopItem> listWeaponItems = new List<ShopItem>();
    public ShopItem CurrentSkinItem;
    public ShopItem CurrentWeaponItem;

    private void Start()
    {
        //SetUp();
        OnTabSelect(0);
    }

    public void SetUp()
    {
        for (int i = 0; i < grids[0].childCount; i++)
        {
            Destroy(grids[0].GetChild(i).gameObject);
        }
        for (int i = 0; i < grids[1].childCount; i++)
        {
            Destroy(grids[1].GetChild(i).gameObject);
        }
        listSkinItems.Clear();
        listWeaponItems.Clear();
        for (int i = 0; i < AssetController.Instance.ListSkinItemData.Count; i++)
        {
            ShopItem si = Instantiate(shopItemPrefab, grids[0]);
            si.SetUp(AssetController.Instance.ListSkinItemData[i], this);
            if (AssetController.Instance.ListSkinItemData[i].ID == DataController.Instance.Data.SkinID)
            {
                si.OnSelect();
            }
            listSkinItems.Add(si);
        }
        for (int i = 0; i < AssetController.Instance.ListHeadsetItemData.Count; i++)
        {
            ShopItem si = Instantiate(shopItemPrefab, grids[1]);
            si.SetUp(AssetController.Instance.ListHeadsetItemData[i], this);
            if (AssetController.Instance.ListHeadsetItemData[i].ID == DataController.Instance.Data.HeadsetID)
            {
                si.OnSelect();
            }
            listWeaponItems.Add(si);
        }
        StartCoroutine(CoReposition());
    }

    IEnumerator CoReposition()
    {
        yield return null;
        LeanTween.value(scrolls[0].verticalNormalizedPosition, 1, 0.4f).setOnUpdate((float f) =>
        {
            scrolls[0].verticalNormalizedPosition = f;
        });
        LeanTween.value(scrolls[1].verticalNormalizedPosition, 1, 0.4f).setOnUpdate((float f) =>
        {
            scrolls[1].verticalNormalizedPosition = f;
        });
    }

    public void OnNotEnoughCoin()
    {
        //OnTabSelect(1); // Show diamond tab
        Debug.LogError("Not enough coin");
    }

    public void OnTabSelect(int index)
    {
        if (currentTabCanvasGroup != null)
        {
            currentTabCanvasGroup.alpha = 0.5f;
        }
        currentTabCanvasGroup = tabCanvasGroups[index];
        currentTabCanvasGroup.alpha = 1;
        if (currentTabContent != null)
        {
            currentTabContent.SetActive(false);
        }
        currentTabContent = tabContents[index];
        currentTabContent.SetActive(true);
        StartCoroutine(CoReposition());
    }

    public void OnCoinPackPurchase(int id)
    {
        //IAPDiamondPackEvent e = new IAPDiamondPackEvent();
        //e.AddListener(OnDiamondPackPurchaseSuccessful);
        //GlobalController.Instance.PurchaseDiamond((DiamondPackID)id, e);
    }

    private void OnCoinPackPurchaseSuccessful(CoinPackID arg0)
    {
        switch (arg0)
        {
            case CoinPackID.smallpouch:
                CollectCoin(400);
                break;
            case CoinPackID.mediumpouch:
                CollectCoin(900);
                break;
            case CoinPackID.bigpouch:
                CollectCoin(1400);
                break;
            case CoinPackID.hugepouch:
                CollectCoin(2000);
                break;
            default:
                break;
        }
    }

    public void CollectCoin(int value)
    {
        GameUIController.Instance.UpdateCoin(DataController.Instance == null ? 0 : DataController.Instance.Data.Coin, DataController.Instance.Data.Coin + value);
        DataController.Instance.Data.Coin += value;
        DataController.Instance.SaveData();
        Refresh();
        GameUIController.Instance.UpdateShopNoti();
    }

    public void Refresh()
    {
        for (int i = 0; i < listSkinItems.Count; i++)
        {
            listSkinItems[i].Refresh();
        }
        for (int i = 0; i < listWeaponItems.Count; i++)
        {
            listWeaponItems[i].Refresh();
        }
    }

    public void Show()
    {
        LeanTween.alphaCanvas(canvasGroup, 1, 0.02f);
        canvasGroup.blocksRaycasts = true;
        Refresh();
    }

    public void Hide()
    {
        LeanTween.alphaCanvas(canvasGroup, 0, 0.02f);
        canvasGroup.blocksRaycasts = false;
        //GameUIController.Instance.ShowContent(); // For video ads assets
    }
}
