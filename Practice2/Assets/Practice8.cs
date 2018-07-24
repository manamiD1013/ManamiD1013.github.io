using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Practice8 : MonoBehaviour {
    string myouzi = "Doi";
    string namae = "Manami";
	// Use this for initialization
	void Start () {
        print(TwoStringToOneString(myouzi,namae));
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    string TwoStringToOneString(string a,string b){
        string answer = a + b;
        return answer;
    }
}
