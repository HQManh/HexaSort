using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class ShopItem : MonoBehaviour
{
    [SerializeField] private Image avatar;
    [SerializeField] private GameObject btnWatchAds;
    [SerializeField] private GameObject btnUse;
    [SerializeField] private GameObject select;
    [SerializeField] private Text txtUC;
    [SerializeField] private GameObject btnPurchase;
    [SerializeField] private CanvasGroup btnPurchaseCanvasGroup;
    [SerializeField] private Text txtCost;
    [SerializeField] private Text txtUnlockAtLevel;
    [SerializeField] private ItemType type;
    private Shop shop { get; set; }
    public ShopItemData Data { get; set; }

    public void SetUp(ShopItemData data, Shop shop)
    {
        Data = data;
        type = data.Type;
        this.shop = shop;
        avatar.sprite = data.AvatarSprite;
        btnPurchase.SetActive(data.UnlockBy == UnlockConditions.Coin && !data.IsUnlocked && Data.LevelLimit <= DataController.Instance.Data.LevelIndex);
        btnWatchAds.SetActive(data.UnlockBy == UnlockConditions.VideoReward && !data.IsUnlocked && Data.LevelLimit <= DataController.Instance.Data.LevelIndex);
        switch (type)
        {
            case ItemType.Skin:
                btnUse.SetActive(data.IsUnlocked && DataController.Instance.Data.SkinID != data.ID);
                select.SetActive(DataController.Instance.Data.SkinID == data.ID);
                break;
            case ItemType.Weapon:
                btnUse.SetActive(data.IsUnlocked && DataController.Instance.Data.HeadsetID != data.ID);
                select.SetActive(DataController.Instance.Data.HeadsetID == data.ID);
                break;
            default:
                break;
        }
        txtUC.gameObject.SetActive(data.UnlockBy == UnlockConditions.VideoReward && !data.IsUnlocked);
        txtUC.text = data.UCCurrent + "/" + data.UCTotal;
        txtCost.text = data.UCTotal.ToString();
        if (Data.LevelLimit > 0 && !Data.IsUnlocked)
        {
            txtUnlockAtLevel.gameObject.SetActive(Data.LevelLimit > DataController.Instance.Data.LevelIndex);
            txtUnlockAtLevel.text = "UNLOCK AT\n<size=60>Lv." + Data.LevelLimit + "</size>";
        }
        btnPurchaseCanvasGroup.alpha = (data.UCTotal < DataController.Instance.Data.Coin ? 1 : 0.25f);
        btnPurchaseCanvasGroup.blocksRaycasts = data.UCTotal < DataController.Instance.Data.Coin;
    }

    public void OnSelect()
    {
        if (Data.IsUnlocked)
        {
            switch (type)
            {
                case ItemType.Skin:
                    DataController.Instance.Data.SkinID = Data.ID;
                    break;
                case ItemType.Weapon:
                    DataController.Instance.Data.HeadsetID = Data.ID;
                    break;
                default:
                    break;
            }
            DataController.Instance.SaveData();
        }
        switch (type)
        {
            case ItemType.Skin:
                if (shop.CurrentSkinItem != null)
                {
                    shop.CurrentSkinItem.OnDeselect();
                }
                shop.CurrentSkinItem = this;
                break;
            case ItemType.Weapon:
                if (shop.CurrentWeaponItem != null)
                {
                    shop.CurrentWeaponItem.OnDeselect();
                }
                shop.CurrentWeaponItem = this;
                break;
            default:
                break;
        }
        select.SetActive(true);
        Refresh();
    }

    public void OnDeselect()
    {
        select.SetActive(false);
        Refresh();
    }

    public void Refresh()
    {
        SetUp(Data, shop);
    }

    public void OnUse()
    {
        OnSelect();
        //skinShop.Hide();
    }

    public void OnPurchase()
    {
        if (Data.UCTotal > DataController.Instance.Data.Coin)
        {
            shop.OnNotEnoughCoin();
        }
        else
        {
            shop.CollectCoin(-Data.UCTotal);
            switch (type)
            {
                case ItemType.Skin:
                    AssetController.Instance.UpdateSkinItemUC(Data.ID, Data.UCTotal);
                    break;
                case ItemType.Weapon:
                    AssetController.Instance.UpdateWeaponItemUC(Data.ID, Data.UCTotal);
                    break;
                default:
                    break;
            }
            shop.Refresh();
        }
    }

    public void WatchAds()
    {
        GlobalController.Instance.ShowRewardedVideo(OnWatchAds);
    }

    private void OnWatchAds()
    {
        switch (type)
        {
            case ItemType.Skin:
                AssetController.Instance.UpdateSkinItemUC(Data.ID, ++Data.UCCurrent);

                break;
            case ItemType.Weapon:
                AssetController.Instance.UpdateWeaponItemUC(Data.ID, ++Data.UCCurrent);
                break;
            default:
                break;
        }
        Refresh();
    }
}
