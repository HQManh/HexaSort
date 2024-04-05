using SaveIsEasy;
using UnityEngine;
using UnityEngine.SceneManagement;


public class ExampleControlGUI : MonoBehaviour {

    public bool Open = true;

    //to avoid setting an empty name we use sceneFileName variable
    private string sceneFileName;
    private Scene selected;

    private void Start() {
        selected = SceneManager.GetSceneAt(0);
        sceneFileName = SaveIsEasyAPI.GetSceneFileNameByScene(selected);
    }

    void OnGUI() {

        if (Open) {
            int sceneCount = SceneManager.sceneCount;

            if (sceneCount > 1) {
                int height = 160;
                if (sceneCount > 3)
                    height = 40 + (40 * sceneCount);

                GUI.Box(new Rect(10, 10, 470, height), "Save and Load in Game Tools (<b>" + selected.name + "</b>)");
                if(GUI.Button(new Rect(490, 10, 50, 30), "Close")) {
                    Open = false;
                }
            } else {
                GUI.Box(new Rect(10, 10, 330, 160), "Save and Load in Game Tools (<b>" + selected.name + "</b>)");
                if (GUI.Button(new Rect(350, 10, 50, 30), "Close")) {
                    Open = false;
                }
            }


            if (sceneCount > 1) {
                int i = 0;

                for (int n = 0; n < sceneCount; ++n) {
                    Scene scene = SceneManager.GetSceneAt(n);

                    GUI.enabled = SaveIsEasyAPI.IsSaveIsEasyManagerValidByScene(scene);
                    if (GUI.Button(new Rect(340, 50 + i * 40, 130, 30), scene.name)) {
                        selected = scene;
                        sceneFileName = SaveIsEasyAPI.GetSceneFileNameByScene(scene);
                    }
                    i++;
                    GUI.enabled = true;
                }
            }

            if (GUI.Button(new Rect(20, 50, 150, 30), "Save Game")) {
                SaveIsEasyAPI.SaveAll(selected);
            }
            if (GUI.Button(new Rect(20, 90, 150, 30), "Load Game")) {
                SaveIsEasyAPI.LoadAll(selected);
            }
            if (GUI.Button(new Rect(20, 130, 150, 30), "Menu")) {
                SceneManager.LoadScene(0);
            }

            //to avoid setting an empty name
            if (string.IsNullOrEmpty(sceneFileName) == false) {
                sceneFileName = SaveIsEasyAPI.GetSceneFileNameByScene(selected);
            }

            GUI.Label(new Rect(180, 70, 150, 30), "File name");
            sceneFileName = GUI.TextField(new Rect(180, 90, 150, 30), sceneFileName);

            if (string.IsNullOrEmpty(sceneFileName) == false) {
                SaveIsEasyAPI.SetSceneFileNameByScene(sceneFileName, selected);
            }

        } else {
            if(GUI.Button(new Rect(10, 10, 50, 30), "Open")) {
                Open = true;
            }
        }
        
    }
}
