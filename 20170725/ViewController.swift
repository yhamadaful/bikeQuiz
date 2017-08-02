//
//  ViewController.swift
//  20170725
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{

    var audioPlayer:AVAudioPlayer!
    var timer: Timer!
    
    var total_point : Int = 0

    
    @IBOutlet var button:UIButton!
    @IBOutlet var pointLayout : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 再生する audio ファイルのパスを取得
        let audioPath = Bundle.main.path(forResource: "bike-start-up1", ofType:"mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        let ud = UserDefaults.standard
        total_point = ud.integer(forKey: "point_history")
        print("total_point = " + String(total_point))
        pointLayout.text = "通算ポイント　：　" + String(total_point)
        
        // auido を再生するプレイヤーを作成する
        var audioError:NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch let error as NSError {
            audioError = error
            audioPlayer = nil
        }
        
        // エラーが起きたとき
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
    }
  /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
 */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func update(){
        if ( audioPlayer.isPlaying ){
            audioPlayer.stop()
            button.setTitle("Stop", for: UIControlState())
        }
        else{
            audioPlayer.play()
            button.setTitle("Play", for: UIControlState())
        }
    }
    
    
    // ボタンがタップされた時の処理
    @IBAction func buttonTapped(_ sender : AnyObject) {
        audioPlayer.play()
        let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(2.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            self.audioPlayer.stop()
        })
        
    }
    
    @IBAction func clear(){
        total_point = 0
        let ud = UserDefaults.standard
        ud.set(total_point, forKey: "point_history")
        ud.synchronize()
        pointLayout.text = "通算ポイント　：　" + String(total_point)
    }
    
}

