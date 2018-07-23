using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemController : MonoBehaviour {

    public Item.ItemType itemType;

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }
    void OnTriggerEnter(Collider other)
    {
        if (other.name == "Player")
        {
            GameManager.instance.inventory.AddItem(itemType);
            Destroy(gameObject);
            GameObject effectObj = transform.parent.Find("ItemEffect(Clone)").gameObject;
            Destroy(effectObj);
        }
    }
}