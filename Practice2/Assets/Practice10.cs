using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Practice10 : MonoBehaviour {
    public Text[] text = new Text[5];
    public Text answer;
	// Use this for initialization
	void Start () {
        Number(10);
        answer.text = "答え:" + Ans(10);
	}
    void Number(int n){
        for (int i = 0; i < 5;i++){
            text[i].text = "数:" + n;
            n++;
        }
    }
    int Ans(int n){
        int answer = 0;
        for (int r = n; r < n+5;r++){
            answer += r;
        }
        return answer;
    }
	// Update is called once per frame
	void Update () {
		
	}
}
