using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class StartCount : MonoBehaviour {
    public Text timeText;

    //残り時間（初期値はInspectorで入力する）
    public float time;

    bool isStart = false;



    public bool IsStart()
    {
        return isStart;
    }

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

        //残り時間を少なくしてく
        time = time - Time.deltaTime;

        //もし残り時間が1より大きかったら
        if (time >= 1)
        {
            //残り時間をテキストに表示する
            timeText.text = time.ToString("0");

        }
        else {
                if (isStart)
                {
                    return;
                }
                isStart = true;
            }
           
        
    }
}
