using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Constants
{
    internal static readonly float EPSILON = 0.00001f;

    public static string AppName { get { return ""; } }
    public static string PackageName { get { return "com.amzg.game"; } }
    public static string FacebookPageURL { get { return ""; } }
    public static string AppURL { get { return "PC Build"; } }
    public static string StoreURL { get { return "PC Build"; } }

    public static class Tag
    {
        public static string MainCharacter = "MainCharacter";
        public static string BadGuy = "BadGuy";
        public static string Trap = "Trap";
        public static string Obstacle = "Obstacle";
        public static string Loot = "Loot";
        public static string GrabItem = "GrabItem";
    }

    public static class Layer
    {
        public static string Obstacle = "Obstacle";
        public static string DisabledGround = "DisabledGround";
        public static string PathPoint = "PathPoint";
    }

    public static string SharingContent { get { return "I got [score] score in this awesome " + AppName + " game! Who can beat me?"; } }
    public static string[] RateUsContent
    {
        get
        {
            return new string[]
            {
                "Give us your valuable feedback to improve the game?",
                "Like "+ AppName+"? \nRate it please!",
                "Your precious rating is important to "+ AppName+". \nRate now?",
                "Enjoying the game? \nTell others how cool you play it!"
            };
        }
    }
}
