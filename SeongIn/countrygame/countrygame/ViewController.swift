//
//  ViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 5. 23..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit
import Foundation
import Speech

class ViewController: UIViewController {
    
    var imagecnt = true // 게임 버튼 활성화
    var helpcnt = true
    private let audioEngine = AVAudioEngine()

    @IBAction func studybutton(_ sender: Any) {
        audioController.playerEffect(name: Soundbutton)
    }
    @IBAction func searchbutton(_ sender: Any) {
        audioController.playerEffect(name: Soundbutton)
    }
    @IBOutlet weak var easybutton: UIButton!
    @IBOutlet weak var normarlbutton: UIButton!
    @IBOutlet weak var searchimage: UIImageView!
    @IBOutlet weak var studyimage: UIImageView!
    @IBOutlet weak var gameimage: UIImageView!
    @IBOutlet weak var himage: UIImageView! // 도움말 이미지
    @IBOutlet weak var gimage: UIImageView! // game 선택 이미지
    @IBOutlet weak var hardbutton: UIButton!
    
    @IBOutlet weak var gametext: UILabel!
    @IBOutlet weak var searchtext: UILabel!
    @IBOutlet weak var studytext: UILabel!
    @IBOutlet weak var hardtext: UILabel!
    @IBOutlet weak var normaltext: UILabel!
    @IBOutlet weak var easytext: UILabel!
    
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    @IBAction func helpbutton(_ sender: Any) {
        audioController.playerEffect(name: Soundbutton)
        if(helpcnt == false){
            himage.isHidden = true
            searchtext.isHidden = true
            searchimage.isHidden = true
            studytext.isHidden = true
            studyimage.isHidden = true
            gameimage.isHidden = true
            easytext.isHidden = true
            normaltext.isHidden = true
            hardtext.isHidden = true
            gametext.isHidden = true
            
            helpcnt = true
        }
        else{
            himage.isHidden = false
            searchtext.isHidden = false
            searchimage.isHidden = false
            studytext.isHidden = false
            studyimage.isHidden = false
            gameimage.isHidden = false
            easytext.isHidden = false
            normaltext.isHidden = false
            hardtext.isHidden = false
            gametext.isHidden = false
            
            helpcnt = false
            
        }
        
    }
    @IBAction func gamebutton(_ sender: Any) {
        audioController.playerEffect(name: Soundbutton)
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

