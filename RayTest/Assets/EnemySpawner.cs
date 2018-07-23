using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemySpawner : MonoBehaviour {
    public GameObject upperStage;
    public GameObject enemy;
    float upperStageX;
    float upperStageZ;

	// Use this for initialization
	void Start () {
        upperStageX = upperStage.GetComponent<Renderer>().bounds.size.x;
        upperStageZ = upperStage.GetComponent<Renderer>().bounds.size.z;

       
	}
	
	// Update is called once per frame
    void Update () {;
        GameObject[] enemies = GameObject.FindGameObjectsWithTag("enemy");
        if(enemies.Length<5){
            Instantiate(enemy, upperStage.transform.position + new Vector3(Random.Range(-upperStageX / 2, upperStageX / 2), 0, Random.Range(-upperStageZ / 2,upperStageZ/2)
                                                                          ), Quaternion.identity);
        }
	}
}
