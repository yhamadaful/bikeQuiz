//
//  QuestionViewController.swift
//  20170725
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var answerTableView : UITableView!
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var questionImage : UIImageView!
    
    var random : Int = 0
    
    var questionArray = [
                         ["question":"このバイクの名前は？","imagePath":"ワルキューレ.jpg",
                          "answer1":"マグナ","answer2":"ワルキューレ ルーン","answer3":"デスペラードX","answer4":"ドラッグスター","correct": 2],
                         ["question":"このバイクの名前は？","imagePath":"SR400.jpg",
                          "answer1":"ST250","answer2":"CB223S","answer3":"SR400","answer4":"エストレヤ","correct": 3],
                         ["question":"このバイクの名前は？","imagePath":"ninja1000.jpg",
                          "answer1":"Ninja1000","answer2":"VFR","answer3":"RC390","answer4":"CBR400RR","correct": 1],
                         ["question":"このバイクの名前は？","imagePath":"インパルス.jpg",
                          "answer1":"CB400SF","answer2":"ZEPHYRχ","answer3":"XJR","answer4":"インパルス","correct": 4],
                         ["question":"このバイクの名前は？","imagePath":"VMAX.jpg",
                          "answer1":"VMAX","answer2":"V1100ビラーゴ","answer3":"ブルバード","answer4":"バルカン900クラシック","correct": 1],
                         ["question":"このバイクの名前は？","imagePath":"CB400.jpeg",
                          "answer1":"CB400F","answer2":"ZEPHYRχ","answer3":"XJR","answer4":"インパルス","correct": 1],
                         ["question":"問題7","imagePath":"進入禁止.gif",
                          "answer1":"気をつけて進め","answer2":"車両進入禁止","answer3":"歩行者も含め通行禁止","answer4":"無視する","correct": 2]
                        /*
                        ,
                         ["question":"問題8","imagePath":"通行止.gif",
                          "answer1":"問題","answer2":"問題","answer3":"問題","answer4":"問題","correct": 1],
                         ["question":"問題9","imagePath":"最低速度.gif",
                          "answer1":"問題","answer2":"問題","answer3":"問題","answer4":"問題","correct": 1],
                         ["question":"展開禁止  ","imagePath":"最大幅.gif",
                          "answer1":"問題","answer2":"問題","answer3":"問題","answer4":"問題","correct": 1]
                        */
                        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        answerTableView.dataSource = self
        answerTableView.delegate = self
        
        random = Int(arc4random_uniform(7))
        print(random)
        
        questionLabel.text = questionArray[random]["question"] as? String
        questionImage.image = UIImage(named : (questionArray[random]["imagePath"] as? String)!)
        
        //カスタムセル用
        let nib = UINib(nibName: "AnswerTableViewCell", bundle: Bundle.main)
        answerTableView.register(nib, forCellReuseIdentifier: "Cell")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        random = Int(arc4random_uniform(7   ))
        print(random)
        questionLabel.text = questionArray[random]["question"] as? String
        questionImage.image = UIImage(named : (questionArray[random]["imagePath"] as? String)!)
        answerTableView.reloadData()
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AnswerTableViewCell
        cell.answerLabel.text = questionArray[random]["answer"+String(indexPath.row+1)] as? String
        cell.numberImage.image = UIImage(named:String(indexPath.row+1) + ".gif")
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            let judgeViewController = segue.destination as! JudgeViewController
            let selectedIndexPath = answerTableView.indexPathForSelectedRow!
            
            judgeViewController.correct = questionArray[random]["correct"] as! Int
            judgeViewController.index = selectedIndexPath.row + 1
            let num : Int = judgeViewController.correct
            judgeViewController.ansertext = questionArray[random]["answer" + String(num)] as! String
        }
    }
    
}
