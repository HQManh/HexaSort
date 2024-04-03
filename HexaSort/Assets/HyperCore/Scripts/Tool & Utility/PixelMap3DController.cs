using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PixelMap3DController : Singleton<PixelMap3DController>
{
    [SerializeField] private PixelCube pixelCubePrefab;
    [SerializeField] private Texture2D tex;
    [SerializeField] private Transform board;
    [SerializeField] private Material cubeMaterial;
    [SerializeField] private float pixelGap;
    [SerializeField] private bool generateSampleTex;
    [SerializeField] private bool colorAffectHeight;
    private List<Color> listLevelPixelColors = new List<Color>();
    public float DefaultCubeSize;
    private float realPixelSize;
    private Color[] levelColors;
    public PixelCube[,] ArrayPixels;
    public Dictionary<Color, Material> DictPixelMaterials = new Dictionary<Color, Material>();
    public List<PixelCube> ListPixelCubes = new List<PixelCube>();
    private int[][] neighborPositions = new int[][] {
            new int[]{-1,-1}, new int[]{-1, 0}, new int[]{-1, 1},
            new int[]{ 0,-1},                   new int[]{ 0, 1},
            new int[]{ 1,-1}, new int[]{ 1, 0}, new int[]{ 1, 1}
    };

    private void OnValidate()
    {
        if (generateSampleTex && tex != null)
        {
            generateSampleTex = false;
            GenerateMap(tex, Vector3.zero);
        }
    }

    private string cubeIndex;
    public void GenerateMap(Texture2D tex, Vector3 boardPos)
    {
        board.localPosition = boardPos;
        Material mat = new Material(cubeMaterial);
        realPixelSize = DefaultCubeSize + pixelGap;
        levelColors = tex.GetPixels();
        ArrayPixels = new PixelCube[tex.width, tex.height];
        // Load level pixels
        for (int i = 0; i < levelColors.Length; i++)
        {
            // Colored pixel (not transparent)
            if (levelColors[i].a != 0)
            {
                // Save the color
                listLevelPixelColors.Add(levelColors[i]);

                // Spawn pixel cubes
                PixelCube pixelCube = Instantiate(pixelCubePrefab, board);
                pixelCube.transform.localPosition = new Vector3(
                    (-tex.width / 2 + (i % tex.width)) * realPixelSize +
                    (tex.width % 2 == 1 ? 0 : DefaultCubeSize / 2)
                    ,
                    0,
                    (-tex.height / 2 + (i / tex.width)) * realPixelSize +
                    (tex.height % 2 == 1 ? 0 : DefaultCubeSize / 2)
                    //,0
                    );
                cubeIndex = i % tex.width + "," + i / tex.width;
                ArrayPixels[i % tex.width, i / tex.width] = pixelCube;
                if (!DictPixelMaterials.ContainsKey(levelColors[i]))
                {
                    mat = new Material(cubeMaterial);
                    mat.color = levelColors[i];
                    DictPixelMaterials.Add(levelColors[i], mat);
                    pixelCube.SetUp(mat, cubeIndex);
                }
                else
                {
                    pixelCube.SetUp(DictPixelMaterials[levelColors[i]], cubeIndex);
                }
                pixelCube.CurrentColor = levelColors[i];
                ListPixelCubes.Add(pixelCube);
            }
        }

        for (int i = 0; i < tex.width; i++)
        {
            for (int j = 0; j < tex.height; j++)
            {
                for (int n = 0; n < neighborPositions.Length; n++)
                {
                    int nrow = j + neighborPositions[n][0];
                    int ncol = i + neighborPositions[n][1];
                    if (nrow >= 0 && nrow < tex.height && ncol >= 0 && ncol < tex.width && ArrayPixels[i, j] != null && ArrayPixels[ncol, nrow] != null)
                    {
                        ArrayPixels[i, j].Neighbors.Add(ArrayPixels[ncol, nrow]);
                    }
                }
            }
        }
    }

}
