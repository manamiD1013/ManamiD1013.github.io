using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AutoDoor : MonoBehaviour {
    Animator anim;
    Inventory inventory = new Inventory();
    public bool conditionNeedItem = false;
	// Use this for initialization
	void Start () {
        anim = GetComponent<Animator>();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
	void OnTriggerEnter(Collider other)
	{
        if (other.name == "Player")
        {
            if (conditionNeedItem == false)
            {

                anim.SetBool("IsOpen", true);
                print("プレイヤーがぶつかりました！");
            }
            else
            {
                if (GameManager.instance.inventory.HasItem())
                {
                    anim.SetBool("IsOpen", true);
                }
            } 
        }
	}
	void OnTriggerExit(Collider other)
	{
        if(other.name =="Player"){
            anim.SetBool("IsOpen", false);
        }
	}
}
