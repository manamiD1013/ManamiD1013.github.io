using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Practice1 : MonoBehaviour {
    string name;
    int birthMonth;
    int birthDay;

	// Use this for initialization
	void Start () {
        name = "土井";
        birthMonth = 10;
        birthDay = 13;
        print("私の名前は"+name+"です。生まれた月の数字と生まれた日にちを足すと"+(birthMonth+birthDay)+"になります。");
            
	}
	
	// Update is called once per frame
	void Update () {
       
	}
}
