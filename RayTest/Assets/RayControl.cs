using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RayControl : MonoBehaviour {
    public GameObject player;
    Vector3 newPlayerPosition;
    float time = 0;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if(Input.GetMouseButtonDown(0)){
            time = 0;
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if(Physics.Raycast(ray,out hit)){
                newPlayerPosition = hit.point;
            }
        }
        time += Time.deltaTime + 0.1f;
        player.transform.position = Vector3.Lerp(player.transform.position, newPlayerPosition, time);
	}
}
