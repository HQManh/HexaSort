using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class LevelItem : MonoBehaviour
{
    [SerializeField] private GameObject currentMark;
    [SerializeField] private GameObject checkMark;
    public UIButton buttonScript;
    [SerializeField] private int level;
    [SerializeField] private GameObject lockMark;
    [SerializeField] private Text txtLevel;

    public void SetUp(int id)
    {
        level = id;
        txtLevel.text = level.ToString();
        if (GlobalController.Instance.ForTesting)
        {
            lockMark.SetActive(false);
            currentMark.SetActive(false);
            checkMark.SetActive(true);
            buttonScript.enabled = true;
        }
        else
        {
            currentMark.gameObject.SetActive(DataController.Instance.Data.LevelIndex == id);
            checkMark.SetActive(DataController.Instance.Data.LevelIndex > id);
            lockMark.SetActive(DataController.Instance.Data.LevelIndex < id);
            buttonScript.enabled = DataController.Instance.Data.LevelIndex >= id;
        }
    }

    public void Refresh()
    {
        SetUp(level);
    }

    public void OnPlay()
    {
        StageController.Instance.ForceStartLevel(level);
    }
}
