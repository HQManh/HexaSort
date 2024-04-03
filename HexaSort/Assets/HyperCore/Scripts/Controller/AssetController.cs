using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AssetController : MonoBehaviour
{
    public static AssetController Instance { get; set; }
    public List<Sprite> ListSkinSprites = new List<Sprite>();
    public List<Sprite> ListHeadsetSprites = new List<Sprite>();
    public List<ShopItemData> ListSkinItemData = new List<ShopItemData>();
    public List<ShopItemData> ListHeadsetItemData = new List<ShopItemData>();
    public List<ShopItemData> ListItemsToUnlock = new List<ShopItemData>();
    public Dictionary<int, ShopItemData> HeadsetItems = new Dictionary<int, ShopItemData>();
    public Dictionary<int, ShopItemData> SkinItems = new Dictionary<int, ShopItemData>();

    private void Awake()
    {
        Instance = this;
        ListSkinItemData.Sort(ShopItemComparer);
        for (int i = 0; i < ListSkinItemData.Count; i++)
        {
            if (ListSkinItemData[i].LevelLimit != 0)
            {
                ListItemsToUnlock.Add(ListSkinItemData[i]);
            }
            SkinItems.Add(ListSkinItemData[i].ID, ListSkinItemData[i]);
        }
        ListHeadsetItemData.Sort(ShopItemComparer);
        for (int i = 0; i < ListHeadsetItemData.Count; i++)
        {
            if (ListHeadsetItemData[i].LevelLimit != 0)
            {
                ListItemsToUnlock.Add(ListHeadsetItemData[i]);
            }
            HeadsetItems.Add(ListHeadsetItemData[i].ID, ListHeadsetItemData[i]);
        }
        ListItemsToUnlock.Sort(ShopItemComparer);
    }

    private int ShopItemComparer(ShopItemData x, ShopItemData y)
    {
        if (x.IsUnlocked) return -1;
        if (y.IsUnlocked) return 1;
        if (x.LevelLimit < y.LevelLimit)
        {
            return -1;
        }
        else if (x.LevelLimit < y.LevelLimit)
        {
            return 1;
        }
        else
        {
            if (x.UCTotal < y.UCTotal)
            {
                return -1;
            }
            else
            {
                return 1;
            }
        }
    }

    //private void OnValidate()
    //{
    //    if (ListSkinSprites.Count == 0)
    //    {
    //        ListSkinSprites.Add(Sprite.Create(new Texture2D(0, 0), new Rect(), Vector2.zero));
    //    }
    //    ListItemData.Clear();
    //    for (int i = 0; i < ListSkinSprites.Count; i++)
    //    {
    //        ListItemData.Add(new ShopItemData()
    //        {
    //            ID = i,
    //            AvatarSprite = ListSkinSprites[i],
    //            UCTotal = i == 0 ? 0 : 1
    //        });
    //    }
    //}

    public void UpdateSkinItemUC(int id, int current, bool saveData = true)
    {
        if (current < DataController.Instance.Data.SkinUnlockProgress[id]) return;
        SkinItems[id].UCCurrent = current;
        if (saveData)
        {
            DataController.Instance.Data.SkinUnlockProgress[id] = current;
            DataController.Instance.SaveData();
        }
    }

    public void UnlockSkin(int id)
    {
        UpdateSkinItemUC(id, SkinItems[id].UCTotal);
        DataController.Instance.Data.SkinID = id;
    }

    public void AddSkin()
    {
        ListSkinItemData.Add(new ShopItemData()
        {
            ID = ListSkinItemData.Count,
            AvatarSprite = ListSkinSprites.Count == 0 ? null : ListSkinSprites[ListSkinSprites.Count - 1],
            UCTotal = 1,
            Type = ItemType.Skin
        });
        ListSkinSprites.Add(ListSkinSprites.Count == 0 ? null : ListSkinSprites[ListSkinSprites.Count - 1]);
    }

    public void RemoveSkin(int index)
    {
        ListSkinItemData.RemoveAt(index);
        ListSkinSprites.RemoveAt(index);
    }

    public void UpdateWeaponItemUC(int id, int current, bool saveData = true)
    {
        if (current < DataController.Instance.Data.HeadsetUnlockProgress[id] || !HeadsetItems.ContainsKey(id)) return;
        HeadsetItems[id].UCCurrent = current;
        if (saveData)
        {
            DataController.Instance.Data.HeadsetUnlockProgress[id] = current;
            DataController.Instance.SaveData();
        }
    }

    public void UnlockWeapon(int id)
    {
        UpdateWeaponItemUC(id, HeadsetItems[id].UCTotal);
        DataController.Instance.Data.HeadsetID = id;
    }

    public void UnlockItem(ShopItemData item)
    {
        switch (item.Type)
        {
            case ItemType.Skin:
                UnlockSkin(item.ID);
                break;
            case ItemType.Weapon:
                UnlockWeapon(item.ID);
                break;
            default:
                break;
        }
    }

    public void AddWeapon()
    {
        ListHeadsetItemData.Add(new ShopItemData()
        {
            ID = ListHeadsetItemData.Count,
            AvatarSprite = ListHeadsetSprites.Count == 0 ? null : ListHeadsetSprites[ListHeadsetSprites.Count - 1],
            UCTotal = 1,
            Type = ItemType.Weapon
        });
        ListHeadsetSprites.Add(ListHeadsetSprites.Count == 0 ? null : ListHeadsetSprites[ListHeadsetSprites.Count - 1]);
    }

    public void RemoveWeapon(int index)
    {
        ListHeadsetItemData.RemoveAt(index);
        ListHeadsetSprites.RemoveAt(index);
    }
}
