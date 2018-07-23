using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CoroutineLesson : MonoBehaviour {

	// Use this for initialization
	void Start () {
        StartCoroutine("MoveSphere");

	}
    IEnumerator MoveSphere(){
        for (int f = 10; f >= 0;f--){
            this.gameObject.transform.position = new Vector3(f * 0.1f, 1, 1);
            yield return new WaitForSeconds(0.5f);
            print(Time.time);
        }
    }
	// Update is called once per frame
	void Update () {
		
	}
}
