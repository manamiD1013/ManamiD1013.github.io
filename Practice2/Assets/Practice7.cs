using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Practice7 : MonoBehaviour {
    public Text[] text = new Text[5];
    public Text answer;
	// Use this for initialization
	void Start () {
        for (int i = 0; i < 5;i++){
            text[i].text = "数:" + i;
        }
        int n = 0;
        for (int r = 0; r < 5;r++){
            n += r;
        }
        answer.text = "合計" + n;
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
