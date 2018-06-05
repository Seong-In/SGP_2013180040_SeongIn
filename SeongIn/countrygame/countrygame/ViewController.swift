//
//  ViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 5. 23..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    @IBOutlet weak var titlelabel: UILabel!
    @IBAction func doneToPickerViewController(segue:UIStoryboardSegue){
    }
    
    
    
    
    
    override func viewDidLoad() {
        titlelabel.font = FontHUD
        
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

