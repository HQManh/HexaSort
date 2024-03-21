using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class Log : MonoBehaviour {

	private bool isShowing { get; set; }
    public Animator anim;
    public Text txtLog;

    void Awake()
    {
        Application.logMessageReceived += HandleLog;
        DontDestroyOnLoad(gameObject);
    }

    public void Toggle()
    {
        if (isShowing)
        {
            isShowing = false;
            anim.Play("LogHidden", 0, 0);
        }
        else
        {
            isShowing = true;
            anim.Play("LogShown", 0, 0);
        }
    }

    public void Clear()
    {
        txtLog.text = "";
    }

    private void HandleLog(string logString, string stackTrace, LogType type)
    {
        string log = "";
        switch (type)
        {
            case LogType.Warning:
                //log = "<color=#FFFF00>" + log + "</color>\n";
                break;
            case LogType.Error:
            case LogType.Exception:
                log = "<color=#FF0000>" + logString + "\n" + stackTrace+"</color>\n";
                break;
            default:
                log = logString+"\n";
                break;
        }
        txtLog.text += log;
    }
}
