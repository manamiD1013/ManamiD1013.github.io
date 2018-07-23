using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CharacterController : MonoBehaviour {
   

    //変数定義
    public float flap = 550f;
    public float scroll = 10f;
    float direction = 0f;
    Rigidbody2D rb2d;
    public GameObject chara;
    Animator anim;

    //HP
     Slider hp;
    int playerLife;
    bool isDead = false;
    // Use this for initialization

    public ScoreController score;

   

    public bool IsDead(){
        return isDead;
    }
    void Start()
    {
        anim = chara.GetComponent<Animator>();
        //コンポーネント読み込み
        rb2d = GetComponent<Rigidbody2D>();
        hp = GameObject.Find("HP").GetComponent<Slider>();
        playerLife = 3;
       
    }


    // Update is called once per frame
    void Update()
    {
        Vector3 scale = chara.transform.localScale;
        anim.SetBool("isWalk", false);

       
        //キーボード操作
        if (Input.GetKey(KeyCode.RightArrow))
        {
            scale.x = 1;
            MoveToRight();
        }
        else if (Input.GetKey(KeyCode.LeftArrow))
        {
            MoveToLeft();
            scale.x = -1;

        }
        else
        {
            direction = 0f;
        }
        chara.transform.localScale = scale;


        //スマホ操作
        if (Input.touchCount > 0)
        {
            Touch touch = Input.GetTouch(0);
            //画面右半分をタッチしていたら
            if (touch.position.x > Screen.width * 0.5f)
            {
                scale.x = 1;
                MoveToRight();
                //画面左半分をタッチしていたら
            }
            else if (touch.position.x < Screen.width * 0.5f)
            {
                MoveToLeft();
                scale.x = -1;

            }
            else
            {
                direction = 0f;
            }

        }
        chara.transform.localScale = scale;
        //キャラのy軸のdirection方向にscrollの力をかける
        rb2d.velocity = new Vector2(scroll * direction, rb2d.velocity.y);
    }
    void MoveToRight(){
        direction = 1f;
        anim.SetBool("isWalk", true);
    } 
    void MoveToLeft(){
        direction = -1f;
        anim.SetBool("isWalk", true);
    }
   

    private void OnCollisionEnter2D(Collision2D collision)
    {
        
        if(collision.gameObject.tag=="Ground"||collision.gameObject.tag == "Wall"){
            
        }else{
            Destroy(collision.gameObject);
        }
        if(collision.gameObject.tag == "Meteo"){
            playerLife--;
            //sliderのvalueに、体力を代入する
            hp.value = playerLife;

            if(playerLife<=0){
                if(isDead){
                   
                    return;
                }
                isDead = true;
                Destroy(this.gameObject);
                Debug.Log(playerLife);
            }
                
        }
        if (collision.gameObject.tag == "YellowStar")
        {
            score.AddAScore(40);
        }
        if (collision.gameObject.tag == "GreenStar")
        {
            score.AddAScore(30);
        }
        if (collision.gameObject.tag == "BlueStar")
        {
            score.AddAScore(20);
        }
        if(collision.gameObject.tag == "PinkStar"){
            score.AddAScore(10);  
        }
    }
}