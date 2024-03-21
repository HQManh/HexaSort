using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LevelSelectorUI : MonoBehaviour
{
    [SerializeField] private CanvasGroup canvasGroup;
    [SerializeField] private GameObject content;
    [SerializeField] private Transform grid;
    [SerializeField] private LevelItem levelItemPrefab;
    [SerializeField] private ScrollRect scroll;
    private List<LevelItem> listLevels = new List<LevelItem>();

    public void SetUp()
    {
        for (int i = 0; i < grid.childCount; i++)
        {
            Destroy(grid.GetChild(i).gameObject);
        }
        for (int i = 0; i < StageController.Instance.LevelLimit; i++)
        {
            LevelItem level = Instantiate(levelItemPrefab, grid);
            level.SetUp(i + 1);
            level.buttonScript.draggableRoot = scroll;
        }
        StartCoroutine(CoReposition());
    }

    IEnumerator CoReposition()
    {
        yield return null;
        float pos = 1 - ((DataController.Instance.Data.LevelIndex - 1) / 3) /* 3 columns */ / (StageController.Instance.LevelLimit / 3f);
        LeanTween.value(scroll.verticalNormalizedPosition, pos, 0.4f).setOnUpdate((float f) =>
        {
            scroll.verticalNormalizedPosition = f;
        });
    }


    public void Show()
    {
        SetUp();
        LeanTween.alphaCanvas(canvasGroup, 1, 0.1f);
        content.transform.localScale = Vector3.one * 0.7f;
        LeanTween.scale(content, Vector3.one, 0.2f);
        canvasGroup.blocksRaycasts = true;
        Refresh();
    }

    public void Refresh()
    {
        for (int i = 0; i < listLevels.Count; i++)
        {
            listLevels[i].Refresh();
        }
    }

    public void Hide()
    {
        LeanTween.alphaCanvas(canvasGroup, 0, 0.1f);
        LeanTween.scale(content, Vector3.one * 0.7f, 0.2f).setOnComplete(() =>
        {
        });
        canvasGroup.blocksRaycasts = false;
    }
}
