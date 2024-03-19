using UnityEngine;
using UnityEngine.UI;

public class UIController : MonoBehaviour
{
    public static UIController Instance;
    [Header("StartUI")]
    public CanvasGroup startGroup;
    [Header("PlayUI")]
    public CanvasGroup playGroup;
    public Image progressPercen;
    [Header("EndUI")]
    public CanvasGroup endGroup;

    private void Awake()
    {
        Instance = this;
    }

    public void SetProgress(float percen)
    {
        progressPercen.fillAmount = percen;

    }
}
