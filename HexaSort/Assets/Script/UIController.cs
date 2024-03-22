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
        LeanTween.value(progressPercen.fillAmount, progressPercen.fillAmount + percen, 0.2f).setOnUpdate((float value) =>
        {
            progressPercen.fillAmount = value;
        });
        if(progressPercen.fillAmount >= 1)
        {

        }
    }

    public void HammerBooster()
    {
        CurrentData.isHammer = true;
    }

    public void HandBooster()
    {
        CurrentData.isHand = true;
    }

    public void SwapBooster()
    {
        CurrentData.Instance.SwapBooster();
    }

    public void EndGameUI(bool isWin)
    {
        LeanTween.alphaCanvas(endGroup, 1f, 0.2f);
        if (isWin)
        {

        }
    }
}
