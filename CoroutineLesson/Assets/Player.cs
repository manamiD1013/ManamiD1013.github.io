using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour {
    public bool getDestroy = false;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    void OnCollisionEnter(Collision other)
    {
        if(other.gameObject.tag =="Enemy") {
            Destroy(other.gameObject);
            getDestroy = true;
        }
    }
}
