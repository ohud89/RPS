//
//  ResultViewController.swift
//  RPS
//
//  Created by Ohud Alessa on 24/10/2018.
//  Copyright © 2018 OHUD. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ResultViewController: UIViewController {
    
    
    var ourInt: Int?
    var yourInt: Int?
    var audioPlayer = AVAudioPlayer()
   
   
    
    func playSound(_ id: Int){
        var audioName: String
        
        switch id{
        case 1:
            audioName = "winner"
        case 2:
            audioName = "lose"
        default:
            audioName = "tie"
        }

        let path = Bundle.main.path(forResource: audioName, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        
        try! self.audioPlayer = AVAudioPlayer(contentsOf: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet var you: UIImageView!
    @IBOutlet var us: UIImageView!
    
    func getImgName(_ id: Int) -> String {
        
        switch id {
        case 1:
          return  "paper"
        case 2:
          return  "scissor"
        case 3:
           return "rock"
        default:
            return""
        }
        
    }
    
    
    func getResult(_ you:Int, _ us: Int) -> String{
      
        if (you == 1 && us == 3) || (you == 3 && us == 2) || (you == 2 && us == 1){
            message.textColor = UIColor.blue
            playSound(1)
            return "YOU WIN !!"
        }
        else if (you == 3 && us == 1) || (you == 2 && us == 3) || (you == 1 && us == 2) {
            message.textColor = UIColor.red
            playSound(2)
            return "YOU LOSE !!"
        }
        else {
            message.textColor = UIColor.gray
            playSound(3)
            return "TIE !!"
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let our = ourInt {
            self.us.image = UIImage(named: self.getImgName(our))
        } else {
            self.us.image = nil;
        }
        
        if let your = yourInt {
            self.you.image = UIImage(named: self.getImgName(your))
        } else {
            self.you.image = nil
        }
        
       message.text = getResult(yourInt!, ourInt!)
        
        self.you.alpha = 0
        self.us.alpha = 0
        self.message.alpha = 0
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.you.alpha = 1
            self.us.alpha = 1
        }
        UIView.animate(withDuration: 0.8){
            self.message.alpha = 1
        }
    }

    @IBAction func playAgain(_ sender: Any) {
        self.dismiss()
    }
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

    

}
