using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

enum Zibun
{
    Tech,
    CampChan,
    Tokyoto,
}
public class Practice9 : MonoBehaviour {
    public Text[] text = new Text[3];
	// Use this for initialization
	void Start () {
        Zibun Myouji = Zibun.Tech;
        Zibun Namae = Zibun.CampChan;
        Zibun Zyuusho = Zibun.Tokyoto;

        text[0].text = "苗字:" + Myouji;
        text[1].text = "名前:" + Namae;
        text[2].text = "住所:" + Zyuusho;

	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
