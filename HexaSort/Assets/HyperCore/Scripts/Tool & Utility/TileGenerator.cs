using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum TileType
{
    Square,
    Hexagon
}

public class TileGenerator : MonoBehaviour
{
    public TileType Type;

    public List<Vector3> GenerateSquareTilePos(Vector2 tileFloorDimension, float tileSize, float tileGap)
    {
        List<Vector3> listTilePos = new List<Vector3>();
        Vector2 floorSize = new Vector2((tileSize + tileGap) * tileFloorDimension.x - tileSize, (tileSize + tileGap) * tileFloorDimension.y - tileSize);
        Vector2 gap = new Vector2(floorSize.x / (tileFloorDimension.x - 1), floorSize.y / (tileFloorDimension.y - 1));
        for (int x = 0; x < tileFloorDimension.x; x++)
        {
            for (int y = 0; y < tileFloorDimension.y; y++)
            {
                listTilePos.Add(new Vector3(x * gap.x - floorSize.x / 2, 0, y * gap.y - floorSize.y / 2));
            }
        }
        return listTilePos;
    }

    public List<Vector3> GenerateHexTilePos(Vector2 tileFloorDimension, float tileInnerRadius, float tileOuterRadius, float tileGap)
    {
        List<Vector3> listTilePos = new List<Vector3>();
        Vector2 floorSize = new Vector2((tileFloorDimension.x + tileFloorDimension.y * 0.5f - (int)tileFloorDimension.x / 2) * (tileInnerRadius + tileGap) * 2f - tileInnerRadius,
            tileFloorDimension.y * (tileOuterRadius + tileGap) * 1.5f - tileOuterRadius);
        for (int x = 0; x < tileFloorDimension.x; x++)
        {
            for (int y = 0; y < tileFloorDimension.y; y++)
            {
                listTilePos.Add(new Vector3((x + y * 0.5f - y / 2) * (tileInnerRadius + tileGap) * 2f - floorSize.x / 2, 0, y * (tileOuterRadius + tileGap) * 1.5f - floorSize.y / 2));
            }
        }
        return listTilePos;
    }
}
