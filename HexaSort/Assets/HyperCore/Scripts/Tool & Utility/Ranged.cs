using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Ranged
{

    /// <summary>
    /// Ranged int holds a number of int values between a range.
    /// </summary>
    [Serializable]
    public struct rint
    {
        private int value { get; set; }
        public int Value
        {
            get
            {
                if (value > Max)
                {
                    return Max;
                }
                else if (value < Min)
                {
                    return Min;
                }
                else
                {
                    return value;
                }
            }
            set
            {
                this.value = value;
                if (this.value > Max)
                {
                    this.value = Max;
                }
                else if (this.value < Min)
                {
                    this.value = Min;
                }
            }
        }
        public int Min;
        public int Max;

        public rint(int value, int min, int max) : this()
        {
            Value = value;
            Min = min;
            Max = max;
        }

        public rint(int min, int max) : this()
        {
            Min = min;
            Max = max;
        }

        public int RandomValue
        {
            get
            {
                return UnityEngine.Random.Range(Min, Max + 1);
            }
        }

        public bool IsMin { get { return Value == Min; } }
        public bool IsMax { get { return Value == Max; } }
        public float Percent { get { return Value / (float)Max; } }

    }

    /// <summary>
    /// Ranged float holds a number of float values between a range.
    /// </summary>
    [Serializable]
    public struct rfloat
    {
        private float value { get; set; }
        public float Value
        {
            get
            {
                if (value > Max)
                {
                    return Max;
                }
                else if (value < Min)
                {
                    return Min;
                }
                else
                {
                    return value;
                }
            }
            set
            {
                this.value = value;
                if (this.value > Max)
                {
                    this.value = Max;
                }
                else if (this.value < Min)
                {
                    this.value = Min;
                }
            }
        }
        public float Min;
        public float Max;

        public rfloat(float value, float min, float max) : this()
        {
            Value = value;
            Min = min;
            Max = max;
        }

        public rfloat(float min, float max) : this()
        {
            Min = min;
            Max = max;
        }

        public float RandomValue
        {
            get
            {
                return UnityEngine.Random.Range(Min, Max);
            }
        }

        public bool IsMin { get { return Value == Min; } }
        public bool IsMax { get { return Value == Max; } }
    }
}
