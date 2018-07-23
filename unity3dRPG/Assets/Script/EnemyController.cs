using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EnemyController : MonoBehaviour {
    public int hp = 100;
    public Image hpGauge;
    int fullHp;
    int attackPower;
	// Use this for initialization
	void Start () {
        fullHp = hp;

	}
	
	// Update is called once per frame
	void Update () {
		
	}
    void OnTriggerEnter(Collider other)
    {
        if(other.name == "cutter01"){
            attackPower = other.GetComponent<Weapon>().power;
            hp -= attackPower;
            print(hp);
            hpGauge.fillAmount = (float)hp / fullHp;
            if (hp <= 0)
            {
                print(other.name);
                Destroy(this.gameObject);
            }
        }
     
    }
}
