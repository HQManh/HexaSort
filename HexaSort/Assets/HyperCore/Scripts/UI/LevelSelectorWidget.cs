using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelSelectorWidget : MonoBehaviour
{
    [SerializeField] private TMPro.TMP_InputField inpLevel;
    private int selectedLevel;

    private void Start()
    {
        selectedLevel = DataController.Instance.Data.LevelIndex;
        inpLevel.text = selectedLevel.ToString();
    }

    public void OnLevelInput(string lv)
    {
        try
        {
            int.TryParse(inpLevel.text, out selectedLevel);
        }
        catch (System.Exception)
        {

            throw;
        }
    }

    public void OnLevelAlter(int alterNum)
    {
        selectedLevel += alterNum;
        if (selectedLevel < 1) selectedLevel = 1;
        inpLevel.text = selectedLevel.ToString();
    }

    public void LoadSelectedLevel()
    {
        if (selectedLevel < 1) selectedLevel = 1;
        inpLevel.text = selectedLevel.ToString();

        GlobalController.ReplayingLevel = 0;
        DataController.Instance.Data.LevelIndex = selectedLevel;
        StageController.Instance.NextLevel();
    }
}
