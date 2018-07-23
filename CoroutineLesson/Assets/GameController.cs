using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameController : MonoBehaviour {
    public GameObject enemy;
    public GameObject stage;
    public GameObject player;
    GameObject[] enemies;
    float stageWidth;
    float stageHeight;
    Player playerScript;
	// Use this for initialization
	void Start () {
        stageWidth = stage.GetComponent<Renderer>().bounds.size.x;
        stageHeight = stage.GetComponent<Renderer>().bounds.size.z;
        playerScript = player.GetComponent<Player>();

        for (int n = 0; n < 5;n++){
            Instantiate(enemy, new Vector3(Random.Range(-stageWidth / 2, stageWidth / 2), 1, Random.Range(-stageHeight / 2, stageHeight / 2)), Quaternion.identity);
        }
	}
	
	// Update is called once per frame
	void Update () {
        if(playerScript.getDestroy == true){
            StartCoroutine("GenerateEnemy");
            playerScript.getDestroy = false;
        }
	}
    IEnumerator GenerateEnemy(){
        yield return new WaitForSeconds(3.0f);
        Instantiate(enemy,new Vector3(Random.Range(-stageWidth / 2, stageWidth / 2), 1, Random.Range(-stageHeight / 2, stageHeight / 2)), Quaternion.identity);
    }
}
