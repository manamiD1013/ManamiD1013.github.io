using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreasureChest : MonoBehaviour
{
    Animator anim;
    bool isOpen = false;
    // Use this for initialization
    void Start()
    {
        anim = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {

    }
    void OnTriggerEnter(Collider other)
    {
        if(other.name =="Player"&& isOpen == false){
            anim.SetBool("IsOpen", true);
            GameObject effectObj = Resources.Load<GameObject>("Effects/ItemEffect");
            GameObject effect = Instantiate(effectObj, gameObject.transform.position, effectObj.transform.rotation);
            effect.transform.parent = gameObject.transform;
            isOpen = true;
        }

    }
}
