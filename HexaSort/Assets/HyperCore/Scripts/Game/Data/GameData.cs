using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class GameData
{
    public int ChestKey;
    public int Coin;
    public int BestScore;
    public int LevelCycleCount;
    public int LevelIndex;
    public int SkinID;
    public int HeadsetID;
    public int LastUnlockItemByLevel;
    public List<int> SkinIDs;
    public List<int> SkinUnlockProgress;
    public List<int> HeadsetIDs;
    public List<int> HeadsetUnlockProgress;
}

[Serializable]
public class GameStats
{
    public bool NoAds;
    public int GamePlayCount;
    public int TotalScore;
}
