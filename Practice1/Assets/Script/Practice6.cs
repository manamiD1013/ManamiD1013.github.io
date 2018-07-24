using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Practice6 : MonoBehaviour {
    int sum;
	// Use this for initialization
	void Start () {
        for (int i = 0; i <=20;i++){
            print(i);
            sum += i;
        }
        print(sum);
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
