using SaveIsEasy;
using UnityEngine;

public class Example2CubeMove : MonoBehaviour, ISaveIsEasyEvents{

    public GameObject Cube;
    public bool CanMove;
    
    int Speed;

    void Awake() {
        Speed = Random.Range(100, 600);
    }

    void Update() {
        if (CanMove) {

            if (Input.GetKey(KeyCode.W)) {
                transform.Translate(Vector3.up * Time.deltaTime * 5);
            }
            if (Input.GetKey(KeyCode.S)) {
                transform.Translate(Vector3.down * Time.deltaTime * 5);
            }
            if (Input.GetKey(KeyCode.A)) {
                transform.Translate(Vector3.left * Time.deltaTime * 5);
            }
            if (Input.GetKey(KeyCode.D)) {
                transform.Translate(Vector3.right * Time.deltaTime * 5);
            }
            if (Input.GetKeyDown(KeyCode.Space)) {
                Instantiate<GameObject>(Cube, transform.position, Quaternion.identity);
            }
        } else {
            transform.Rotate(Vector3.forward * Time.deltaTime * Speed);
        }
    }

    //if the object is too far go back to the center
    void OnBecameInvisible() {
        transform.position = Vector3.zero;
    }
    
    void ISaveIsEasyEvents.OnLoad() {
        //Example of load event
        //Debug.Log("On Load event!");
    }

    void ISaveIsEasyEvents.OnSave() {
        //Example of save event
    }
}
