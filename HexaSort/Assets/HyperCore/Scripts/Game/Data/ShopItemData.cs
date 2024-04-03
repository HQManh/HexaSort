using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum UnlockConditions
{
    Coin,
    VideoReward,
    Level,
    DailyLogin,
    Key,
    ComingSoon
}

public enum ItemType
{
    Skin,
    Weapon
}

[Serializable]
public class ShopItemData
{
    public int ID;
    public ItemType Type;
    /// <summary>
    /// Avatar sprite
    /// </summary>
    public Sprite AvatarSpriteLock;
    public Sprite AvatarSprite;
    //public Mesh Model;
    public Material MainMaterial;
    public Material PartMaterial;
    /// <summary>
    /// Unlock condition
    /// </summary>
    public UnlockConditions UnlockBy;
    public int LevelLimit;

    public float AttackRange;

    /// <summary>
    /// Unlock condition total value
    /// </summary>
    public int UCTotal = 1;

    private int ucCurrent { get; set; }
    /// <summary>
    /// Unlock condition current value
    /// </summary>
    public int UCCurrent
    {
        get
        {
            if (DataController.Instance != null)
            {
                return (UnlockBy == UnlockConditions.Level ?
#if VIDEO
                    9999 :
#else
                    DataController.Instance.Data.LevelIndex :
#endif
                    ucCurrent);
            }
            return ucCurrent;
        }
        set { ucCurrent = value; }
    }

    public string UCDesc;

    public bool IsUnlocked
    {
        get
        {
            if (DataController.Instance == null)
            {
                return UCCurrent >= UCTotal;
            }
            else
            {
                return UCCurrent >= UCTotal;
            }
        }
    }
}
