using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RayControl1 : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if(Input.GetMouseButtonDown(0)){
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if(Physics.Raycast(ray,out hit)){
                GameObject selectObj = hit.collider.gameObject;
                print("name:" + selectObj.name + selectObj.transform.position);
            }
        }
	}
}
