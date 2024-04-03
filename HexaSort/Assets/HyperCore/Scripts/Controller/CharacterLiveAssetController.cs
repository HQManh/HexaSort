using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterLiveAssetController : MonoBehaviour
{
    [SerializeField] private GameObject[] headsets;
    [SerializeField] private Mesh[] skinMeshes;
    [SerializeField] private SkinnedMeshRenderer skinRenderer;
    [SerializeField] private List<int> attachedHeadsets = new List<int>();
    private int lastActiveHeadsetID;

    private void OnValidate()
    {
        if (attachedHeadsets.Count < skinMeshes.Length)
        {
            for (int i = 0; i < skinMeshes.Length - attachedHeadsets.Count; i++)
            {
                attachedHeadsets.Add(-1);
            }
        }
    }

    public void ChangeHeadset(int id)
    {
        lastActiveHeadsetID = id;
        for (int i = 0; i < headsets.Length; i++)
        {
            if (headsets[i] != null)
            {
                headsets[i].SetActive(i == id);
            }
        }
    }

    public void ChangeSkin(int id)
    {
        if (headsets.Length > 0)
        {
            for (int i = 0; i < headsets.Length; i++)
            {
                if (headsets[i] != null)
                {
                    headsets[i].SetActive(false);
                }
            }
            if (attachedHeadsets[id] > -1)
            {
                headsets[attachedHeadsets[id]].SetActive(true);
            }
            else if (headsets.Length > lastActiveHeadsetID && lastActiveHeadsetID > -1 && headsets[lastActiveHeadsetID] != null)
            {
                headsets[lastActiveHeadsetID].SetActive(true);
            }
        }
        if (skinRenderer != null && skinMeshes.Length > id)
        {
            skinRenderer.sharedMesh = skinMeshes[id];
        }
    }
}
