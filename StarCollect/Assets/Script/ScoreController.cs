using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class ScoreController : MonoBehaviour {
    
    public int score;
    public Text scoreTxt;
    public Text highScore;
  
    // Use this for initialization
   

    public void AddAScore(int addScore){
        score = score + addScore;
        scoreTxt.text = "Score:" + score;

    }

	void Start () {
        score = 0;
        if (SceneManager.GetActiveScene().name == "Start")
        {
            highScore.text = "High Score: " + PlayerPrefs.GetInt("HighScore");
        }
    }
	
	
	// Update is called once per frame
	void Update () {
        if (SceneManager.GetActiveScene().name == "Main")
        {
            scoreTxt.text = "Score: " + score;
        }
    }

    public void SaveHighScore()
    {
        if (PlayerPrefs.GetInt("HighScore") < score)
        {
            PlayerPrefs.SetInt("HighScore", score);
        }

    }
}
