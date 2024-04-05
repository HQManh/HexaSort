using SaveIsEasy;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SaveIsEasyMenu : MonoBehaviour {

    public Text PagesInfoText;
    public LoadPart PrefabToLoad;

    public List<GameObject> PointsToLoadPrefabs;
    
    private int actualPage, totalPages;
    private List<LoadPart> allLoadParts = new List<LoadPart>();
    private List<SceneFile> allSceneFiles;

    private void Start() {
        allSceneFiles = new List<SceneFile>(SaveIsEasyAPI.ListOfValidSaves());
        totalPages = (int)Mathf.Ceil((float)this.allSceneFiles.Count / PointsToLoadPrefabs.Count);


        foreach (GameObject point in PointsToLoadPrefabs) {
            GameObject go = Instantiate<GameObject>(PrefabToLoad.gameObject, point.transform.position, Quaternion.identity);
            go.transform.SetParent(point.transform);

            allLoadParts.Add(go.GetComponent<LoadPart>());
        }

        UpdatePage();
    }

    private void UpdatePage() {

        List<SceneFile> copyScenesFiles = new List<SceneFile>(this.allSceneFiles);

        copyScenesFiles.RemoveRange(0, actualPage * PointsToLoadPrefabs.Count);

        foreach (LoadPart item in allLoadParts) {
            if (copyScenesFiles.Count == 0) {
                item.gameObject.SetActive(false);
                continue;
            }

            item.gameObject.SetActive(true);

            SceneFile select = copyScenesFiles[0];
            copyScenesFiles.Remove(select);
            item.SetInfo(select);

        }

        int page = actualPage + 1;
        PagesInfoText.text = "Page " + page + " of " + totalPages;
    }

    public void Next() {
        if ((actualPage + 1) * PointsToLoadPrefabs.Count >= this.allSceneFiles.Count)
            return;

        actualPage++;
        UpdatePage();
    }

    public void Back() {
        if (actualPage <= 0)
            return;

        actualPage--;
        UpdatePage();
    }

    public void OpenLevel(int sceneBuildIndex) {
        SceneManager.LoadScene(sceneBuildIndex);
    }
}
