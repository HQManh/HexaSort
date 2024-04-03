using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PixelCube : MonoBehaviour
{
    public int Index;
    [SerializeField] protected Collider col;
    [SerializeField] protected Collider colDetect;
    [SerializeField] protected Rigidbody rigid;
    [SerializeField] private Transform top;
    [SerializeField] private TMPro.TextMeshPro txtIndex;
    [SerializeField] private MeshRenderer[] meshRenderers;
    private float originY;
    public Color CurrentColor;
    public int MonoBlockIndex { get; set; }
    public Material SharedMaterial { get; set; }
    public bool IsFree { get; set; }
    public bool IsInteractive { get; set; }
    public PixelCube MatchCube { get; set; }
    public List<PixelCube> Neighbors = new List<PixelCube>();

    public void SetUp(Material mat, string index = "")
    {
        if(txtIndex != null)
        {
            txtIndex.text = index;
        }
        SetSkin(mat);
        if (rigid != null)
        {
            rigid.useGravity = false;
            rigid.velocity = Vector3.zero;
            rigid.angularVelocity = Vector3.zero;
            rigid.drag = 10;
        }
        IsFree = true;
        IsInteractive = false;
        originY = transform.localPosition.y;
    }

    public void SetSkin(Material mat)
    {
        if (meshRenderers != null)
        {
            for (int i = 0; i < meshRenderers.Length; i++)
            {
                meshRenderers[i].gameObject.SetActive(true);
                meshRenderers[i].sharedMaterial = mat;
            }
        }
        transform.localEulerAngles = Vector3.zero;
        if (rigid != null)
        {
            rigid.useGravity = false;
            rigid.velocity = Vector3.zero;
            rigid.angularVelocity = Vector3.zero;
        }
    }

    public void EnableInteractivity()
    {
        IsFree = false;
        IsInteractive = true;
        rigid.useGravity = true;
    }

    public void SetColliderActive(bool isActive)
    {
        col.enabled = isActive;
    }


    // For static cube
    public void PresetPixel(PixelCube pixel)
    {
        col.enabled = false;
        CurrentColor = pixel.CurrentColor;
        MatchCube = pixel;
        pixel.transform.position = transform.position;
    }

    public void OnJump(float delay)
    {
        LeanTween.cancel(gameObject);
        LeanTween.moveLocalY(gameObject, originY + 0.25f, 0.1f).setDelay(delay).setOnComplete(() =>
        {
            LeanTween.moveLocalY(gameObject, originY, 0.3f);
        });
        LeanTween.scale(gameObject, Vector3.one * 1.2f, 0.1f).setDelay(delay).setOnComplete(()=> {
            LeanTween.scale(gameObject, Vector3.one, 0.3f);
        });
        for (int i = 0; i < meshRenderers.Length; i++)
        {
            MeshRenderer m = meshRenderers[i];
            LeanTween.color(m.gameObject, Color.white, 0.1f).setDelay(delay).setOnComplete(()=> {
                LeanTween.color(m.gameObject, CurrentColor, 0.4f);
            });
        }
    }
}
