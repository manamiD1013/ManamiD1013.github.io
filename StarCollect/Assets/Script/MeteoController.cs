using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MeteoController : MonoBehaviour {
   



	// Use this for initialization
	void Start () {
        
   
	}
	
	// Update is called once per frame
	void Update () {
        
        this.gameObject.transform.Translate(-0.05f, -0.1f, 0);
      
        }
      
    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(collision.gameObject.tag =="Ground"||collision.gameObject.tag == "Wall"){
        Destroy(this.gameObject);
        }
    }
}
