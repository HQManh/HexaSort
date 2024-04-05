using SaveIsEasy;
using SaveIsEasy.Adapter;
using System;
using System.Collections.Generic;
using System.Text;
using UnityEngine;

[Adapter(typeof(LineRenderer), true)]
[HelpURL("https://zedgestudio.com/articles/Adapters.html")]
public class LineRendererAdapter : MonoBehaviour, ISaveIsEasyEvents {

    [Header("The LineRenderer that is going to be saved,")]
    [Header("in case you have more than one in the same class.")]
    [AlwaysSave]
    public LineRenderer LineRenderToSave;

    [Header("The basic things that is probably what you need")]
    public bool SavePositions;

    [AlwaysSave]
    private Vector3[] PositionsList;


    void Awake() {
        if (LineRenderToSave == null)
            LineRenderToSave = GetComponent<LineRenderer>();
    }


    public void OnLoad() {
        if (LineRenderToSave == null) return;


        if (this.SavePositions) {

            LineRenderToSave.positionCount = PositionsList.Length;

            for (var i = 0; i < PositionsList.Length; i++) {
                LineRenderToSave.SetPosition(i, this.PositionsList[i]);
            }
        }

    }

    public void OnSave() {
        if (this.LineRenderToSave == null) return;
        

        if (this.SavePositions) {
            this.PositionsList = new Vector3[LineRenderToSave.positionCount];

            for(var i = 0; i < LineRenderToSave.positionCount; i++) {
                this.PositionsList[i] = LineRenderToSave.GetPosition(i);
            }


        }


    }

}
