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
    
    var imagecnt = true

    @IBOutlet weak var easybutton: UIButton!
    @IBOutlet weak var normarlbutton: UIButton!
    
    @IBOutlet weak var gimage: UIImageView!
    @IBOutlet weak var hardbutton: UIButton!
    
    @IBAction func gamebutton(_ sender: Any) {
        if(imagecnt == false)
        {
            gimage.isHidden = true
            easybutton.isHidden = true
            normarlbutton.isHidden = true
            hardbutton.isHidden = true
            imagecnt = true
        }
        else{
            gimage.isHidden = false
            easybutton.isHidden = false
            normarlbutton.isHidden = false
            hardbutton.isHidden = false
            imagecnt = false
        }
    }
    
    @IBAction func doneToPickerViewController(segue:UIStoryboardSegue){
    }
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

