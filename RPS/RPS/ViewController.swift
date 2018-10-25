//
//  ViewController.swift
//  RPS
//
//  Created by Ohud Alessa on 24/10/2018.
//  Copyright © 2018 OHUD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func randomRPS() -> Int {
        let r = 1 + arc4random() % 3
        
        return Int(r)
    }
    
 
    
    @IBAction func chooseRPS(_ sender: UIButton) {
        

        performSegue(withIdentifier: "dd", sender: sender)
        
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let but: UIButton = sender as! UIButton
        
        if segue.identifier == "dd" {
            let controller = segue.destination as! ResultViewController
            controller.yourInt = but.tag
            controller.ourInt = randomRPS()
        }
    }


}

