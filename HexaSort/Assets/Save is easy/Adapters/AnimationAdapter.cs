using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using SaveIsEasy;
using System.Linq;
using SaveIsEasy.Adapter;

[Adapter(typeof(Animation), false)]
[HelpURL("https://zedgestudio.com/articles/Adapters.html")]
public class AnimationAdapter : MonoBehaviour, ISaveIsEasyEvents {

    [Header("The animation that is going to be saved,")]
    [Header("in case you have more than one in the same class.")]
    [AlwaysSave]
    public Animation AnimationToSave;

    [Header("The basic things that is probably what you need")]
    public bool SaveEnable;
    public bool SaveTime, SaveIsPlaying;

    [Header("More advanced stuff")]
    public bool SaveWeight;
    public bool SaveWrapMode, SaveNormalizedTime, SaveSpeed, SaveNormalizedSpeed, SaveName, SaveLayer, SaveBlendMode;

    [AlwaysSave]
    Dictionary<string, AnimationValue> AnimationValues = new Dictionary<string, AnimationValue>();

    
    void Awake() {
        if (AnimationToSave == null)
            AnimationToSave = GetComponent<Animation>();
    }
    

    public void OnLoad() {
        if (AnimationToSave == null) return;

        foreach (AnimationState item in AnimationToSave) {

            if (AnimationValues.ContainsKey(item.name)) {
                AnimationValues[item.name].SetValue(item, this);
                AnimationValues.Remove(item.name);
            } else {
                AnimationToSave.RemoveClip(item.clip);
            }
        }

        foreach(KeyValuePair<string, AnimationValue> item in AnimationValues) {
            AnimationClip clip = Resources.Load<AnimationClip>(item.Key);

            if(clip == null) {
                Debug.LogError("(Save is easy): You need to move the animation called '" + item.Key + "' to your resource folder to be able to be loaded when it is deleted.");
                continue;
            }

            AnimationToSave.AddClip(clip, item.Key);
            item.Value.SetValue(AnimationToSave[item.Key], this);
        }
        
    }

    public void OnSave() {
        if (this.AnimationToSave == null) return;
        AnimationValues.Clear();
        

        foreach (AnimationState item in AnimationToSave) {
            AnimationValues.Add(item.name, new AnimationValue(item, this));
        }

    }

    [System.Serializable]
    private class AnimationValue {
        private bool enabled, isPlaying;
        private float time, weight, normalizedTime, speed, normalizedSpeed;
        private WrapMode wrapMode;
        private int layer;
        private AnimationBlendMode blendMode;
        private string name;
        
        public AnimationValue(AnimationState state, AnimationAdapter adapter) {
            if (adapter.SaveEnable)
                this.enabled = state.enabled;

            if (adapter.SaveIsPlaying)
                this.isPlaying = adapter.AnimationToSave.IsPlaying(state.clip.name);

            if (adapter.SaveTime)
                this.time = state.time;

            if (adapter.SaveWeight)
                this.weight = state.weight;

            if (adapter.SaveNormalizedTime)
                this.normalizedTime = state.normalizedTime;

            if (adapter.SaveSpeed)
                this.speed = state.speed;

            if (adapter.SaveNormalizedSpeed)
                this.normalizedSpeed = state.normalizedSpeed;

            if (adapter.SaveWrapMode)
                this.wrapMode = state.wrapMode;

            if (adapter.SaveLayer)
                this.layer = state.layer;

            if (adapter.SaveBlendMode)
                this.blendMode = state.blendMode;

            if (adapter.SaveName)
                this.name = state.name;
        }

        public void SetValue(AnimationState state, AnimationAdapter adapter) {

            if (adapter.SaveEnable)
                state.enabled = this.enabled;

            if (adapter.SaveIsPlaying) {
                if (this.isPlaying)
                    adapter.AnimationToSave.Play(state.clip.name);
                else
                    adapter.AnimationToSave.Stop(state.clip.name);
            }

            
            if (adapter.SaveTime)
                state.time = this.time;

            if (adapter.SaveWeight)
                state.weight = this.weight;

            if (adapter.SaveNormalizedTime)
                state.normalizedTime = this.normalizedTime;

            if (adapter.SaveSpeed)
                state.speed = this.speed;

            if (adapter.SaveNormalizedSpeed)
                state.normalizedSpeed = this.normalizedSpeed;

            if (adapter.SaveWrapMode)
                state.wrapMode = this.wrapMode;

            if (adapter.SaveLayer)
                state.layer = this.layer;

            if (adapter.SaveBlendMode)
                state.blendMode = this.blendMode;

            if (adapter.SaveName)
                state.name = this.name;
        }
    }

}
