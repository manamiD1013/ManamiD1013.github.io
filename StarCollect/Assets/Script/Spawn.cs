using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spawn : MonoBehaviour
{
    public GameObject[] star;


    // Use this for initialization
    void Start()
    {
        InvokeRepeating("DoStar", 2f, 1f);
    }
       
    void DoStar(){
        var num = Random.Range(0, star.Length);
        var instance = Instantiate(star[num]);
        //要素の位置調整
        //まず、Spawner（自分）の座標と生成した要素の座標を一緒にする
        var iTf = instance.GetComponent<Transform>(); //生成した要素のTranceform
        var tf = GetComponent<Transform>();//自分のTranceform
                                           //自分の座標を変数に入れておく
        var pos = tf.position;
        //ちょっと足し算をする
        pos = pos + new Vector3(Random.Range(-10f, 10f), 0, 0);

        iTf.position = pos;
        //要素を数秒後に削除する
        Destroy(instance, 3f);                
    }
 



    // Update is called once per frame
    void Update()
        {

        }
    
}
