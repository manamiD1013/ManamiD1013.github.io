using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour {
    //敵の移動スピード
    float speed = 10.0f;
    //弾
    public GameObject enemyBullet;

    //爆発
    public GameObject explosion;

    //弾を撃つ間隔を開ける
    float interval;

	// Use this for initialization
	void Start () {
        interval = 0;
	}
	
	// Update is called once per frame
	void Update () {
        transform.Translate(-1 * transform.forward * Time.deltaTime * speed);
        interval += Time.deltaTime;
        if(interval>=0.8f){
            GenerateEnemyBullet();
        }
	}
    void GenerateEnemyBullet(){
        Quaternion q1 = Quaternion.Euler(0, 185, 0);
        Quaternion q2 = Quaternion.Euler(0, 175, 0);
        interval = 0.0f;
        Instantiate(enemyBullet, new Vector3(transform.position.x  -1, transform.position.y, transform.position.z - 2), q1);
        Instantiate(enemyBullet, new Vector3(transform.position.x + 1, transform.position.y, transform.position.z - 2), q2);    
    }
    private void OnTriggerEnter(Collider coll)
    {
        if(coll.gameObject.tag=="PlayerBullet"){
            Instantiate(explosion, transform.position, Quaternion.identity);
            Destroy(this.gameObject);
            Destroy(coll.gameObject);
            //スコアの加算
            ScoreController obj = GameObject.Find("Main Camera").GetComponent<ScoreController>();
            obj.ScorePlus();
        }
    }


}
