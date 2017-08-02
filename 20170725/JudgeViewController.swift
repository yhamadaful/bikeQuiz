//
//  JudgeViewController.swift
//  20170725
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class JudgeViewController: UIViewController {
    
    @IBOutlet var textView : UILabel!
    @IBOutlet var topButton : UIButton!
    @IBOutlet var nextButton : UIButton!
    @IBOutlet var pointLayout : UILabel!
    @IBOutlet var ansewerImage : UIImageView!
    @IBOutlet var ansewerLabel: UILabel!

    var correct : Int!
    var index : Int!
    var total_point = 0
    var ansertext : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let ud = UserDefaults.standard
        total_point = ud.integer(forKey: "point_history")
        print(total_point)
        pointLayout.text = "通算ポイント　：　" + String(total_point)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("correct = "+String(correct))
        print("index = "+String(index))
        
        textView.text = ""
        if(correct == index){
            textView.text = "正解"
            total_point = total_point + 100
            pointLayout.text = "通算ポイント　：　" + String(total_point)
            ansewerImage.image = UIImage(named : "correct.png")
            
        }else{
            total_point = total_point - 100
            pointLayout.text = "通算ポイント　：　" + String(total_point)
            textView.text = "不正解"
            ansewerImage.image = UIImage(named : "incorrect.png")
            ansewerLabel.text = "正解は　" + ansertext + " です。"
        }
        
        
        let ud = UserDefaults.standard
        ud.set(total_point, forKey: "point_history")
        ud.synchronize()        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back(){
        self.dismiss(animated:true, completion: nil)
    }
    
        
}
