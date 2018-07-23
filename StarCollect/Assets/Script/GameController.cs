using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement; 
public class GameController : MonoBehaviour
{
    enum State
    {
        Ready,
        Play,
        TimeUp,
        GameOver
    }
    State state;
    public CharacterController chara;

    public TimeManager timeManage;
    public StartCount startCount;
    public GameObject count;
    public GameObject Spawns;
    public Text timeText;
   

    //残り時間（初期値はInspectorで入力する）
    public float time;
    private void Start()
    {
        Ready();

    }
    void Ready()
    {
        state = State.Ready;
        this.GetComponent<TimeManager>().enabled = false;
        chara.scroll = 0;
        Spawns.SetActive(false);

    }
    void GameStart()
    {
        Debug.Log("ゲーム開始");
        state = State.Play;
        chara.scroll = 10;
        count.SetActive(false);
        this.GetComponent<TimeManager>().enabled = true;
        Spawns.SetActive(true);

      
       
    }
    void TimeUp()
    {
        state = State.TimeUp;
        Destroy(Spawns.gameObject);
        Invoke("GoTitle", 3f);
        ScoreController obj = GameObject.Find("GameController").GetComponent<ScoreController>();
        obj.SaveHighScore();
        chara.scroll = 0;
        Debug.Log("終了");
              
    }
    void GameOver()
    {
        Destroy(Spawns.gameObject);
        this.GetComponent<TimeManager>().enabled = false;
        Debug.Log("終了");
        Invoke("BackTitle", 2.0f);
    }
  
    private void Update()
    {
        switch (state)
        {
            case State.Ready:
                if(startCount.IsStart())
                {
                    GameStart();

                }
                break;
            case State.Play:
                if (timeManage.IsTime())
                {
                    TimeUp();
                }
                if(chara.IsDead()){
                    GameOver();
                }
                break;

        }
    }
    void BackTitle()
    {
        SceneManager.LoadScene("Start");
     
    }
    void GoTitle(){
        SceneManager.LoadScene("Start");
    }
}

    


