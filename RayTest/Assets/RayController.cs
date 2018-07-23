using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RayController : MonoBehaviour {
    public GameObject bullet;
    public Camera playerCamera;
    public float speed = 20;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if(Input.GetMouseButton(0)){
            GameObject bullet2 = (GameObject)Instantiate(bullet, playerCamera.transform.position, Quaternion.identity);

            Ray rayOrigin = playerCamera.ScreenPointToRay(Input.mousePosition);
            Vector3 direction = rayOrigin.direction;
            bullet2.GetComponent<Rigidbody>().velocity = direction * speed;
        }
	}
}
