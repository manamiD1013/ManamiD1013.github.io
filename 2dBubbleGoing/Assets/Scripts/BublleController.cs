using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BublleController : MonoBehaviour {
    Rigidbody2D rigidbody2d;
    Animator animator;
    float angle;
    bool isDead = false;

    public float maxHeight;
    public float jumpVelocity;
    public float movingVelocityX;
    public GameObject bubbleSprite;
    bool isGround = false;

    public bool IsDead(){
        return isDead;
    }

	// Use this for initialization
	void Start () {
        rigidbody2d = GetComponent<Rigidbody2D>();
        animator = bubbleSprite.GetComponent<Animator>();
	}
	
	// Update is called once per frame
	void Update () {
        if(Input.GetButtonDown("Fire1")&&transform.position.y<maxHeight){
            Jump();
        }
        ReflectAngle();
        animator.SetBool("isGround", isGround);
	}
    void Jump(){
        if(isDead){
            return;
        }
        isGround = false;
        rigidbody2d.velocity = new Vector2(0.0f, jumpVelocity);
    }

    void ReflectAngle(){
        float targetAngle;
        //死亡したらひっくり返す
        if(isDead){
            targetAngle = 180.0f;
        }else{
            //Y軸に加速している速度、地面などの移動速度から角度を求める
            targetAngle = Mathf.Atan2(rigidbody2d.velocity.y, movingVelocityX) * Mathf.Rad2Deg;

        }

               //回転アニメーションを滑らかに
        angle = Mathf.Lerp(angle, targetAngle, Time.deltaTime * 10.0f);
        //Rotaionに度数での回転を反映させる
        bubbleSprite.transform.localRotation = Quaternion.Euler(0.0f, 0.0f, angle);
    }
    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(collision.gameObject.tag =="Block"){
            if (isDead)
            {
                return;
            }
            animator.enabled = false;
            //何かにぶつかったら死亡フラグを立てる
            isDead = true;

        }else{
            isGround = true;
        }
    }
}
