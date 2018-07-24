using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Practice4 : MonoBehaviour {
    public string name;
	// Use this for initialization
	void Start () {
        switch(name){
            case "山田":
                print("私は山田という人を知っています");
                break;
            case "松下":
                print("私は松下という人を知っています");
                break;
                      default:
                print("私はその人を知りません");
                break;
        }
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
