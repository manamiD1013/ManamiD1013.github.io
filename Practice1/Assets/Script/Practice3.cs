using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Practice3 : MonoBehaviour {
    public int num;
	// Use this for initialization
	void Start () {
        if(num==0){
            print("値は0だよ");
        }else{
            print("値は0ではないよ");
        }

        if(num<20){
            print("値は20より小さいよ");
        }else if(num < 40){
            print("値は40より小さいよ");
        }else{
            print("値は40より大きいよ");
        }

        if(num>10){
            print("10より大きい数字か1引いたよ");
            print(num - 1);
        }


	}
   
        
	
	// Update is called once per frame
	void Update () {
		
	}
}
