using SaveIsEasy;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LoadPart : MonoBehaviour {

    public Text Title, Line1, Line2, Line3, Line4;
    public Image Screenshot;

    SceneFile sceneFile;

    public void SetInfo(SceneFile sceneFile) {
        this.sceneFile = sceneFile;


        ResetTexts();


        Title.text = sceneFile.Name;
        Line1.text = "Last Play: " + sceneFile.LastModifiedDate.ToString("M/d/yyyy");

        if (sceneFile.HasKeyQuickAccess("SceneName")) {
            Line2.text = "Scene: " + sceneFile.SceneName;
        } else {
            Line2.text = "Version: " + sceneFile.FormatVersion;
        }

        if (sceneFile.HasSaveIsEasyStatistics) {
            Line3.text = "Created: " + sceneFile.StatisticsCreationDateAsDateTime.ToString("M/d/yyyy");

            if ((int)sceneFile.StatisticsTotalTimeInSecondsAsTimeSpan.TotalDays == 0) {
                if ((int)sceneFile.StatisticsTotalTimeInSecondsAsTimeSpan.TotalHours == 0) {
                    if ((int)sceneFile.StatisticsTotalTimeInSecondsAsTimeSpan.TotalMinutes == 0) {
                        Line4.text = "Total time: " + (int)sceneFile.StatisticsTotalTimeInSecondsAsTimeSpan.TotalSeconds + " Seconds";
                    } else {
                        Line4.text = "Total time: " + (int)sceneFile.StatisticsTotalTimeInSecondsAsTimeSpan.TotalMinutes + " Minutes";
                    }
                } else {
                    Line4.text = "Total time: " + (int)sceneFile.StatisticsTotalTimeInSecondsAsTimeSpan.TotalHours + " Hours";
                }
            } else {
                Line4.text = "Total time: " + (int)sceneFile.StatisticsTotalTimeInSecondsAsTimeSpan.TotalDays + " Days";
            }
        }


        Sprite sprite = sceneFile.StatisticsScreenshotAsSprite;

        if (sprite != null) {
            Screenshot.rectTransform.gameObject.SetActive(true);
            Screenshot.sprite = sprite;
        } else {
            Screenshot.rectTransform.gameObject.SetActive(false);
        }
    }

    private void ResetTexts() {
        Title.text = "";
        Line1.text = "";
        Line2.text = "";
        Line3.text = "";
        Line4.text = "";
    }

    public void OnClick() {
        sceneFile.LoadSceneAndGame(SceneFile.LoadSceneBy.ScenePath, true, false);
    }
}
