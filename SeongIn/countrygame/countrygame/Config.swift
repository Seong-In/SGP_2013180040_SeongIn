//
//  Config.swift
//  Anagrams
//
//  Created by Caroline on 1/08/2014.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

import Foundation
import UIKit

//UI Constants
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height
let TileMargin: CGFloat = 20

let FontHUD = UIFont(name: "comic andy", size: 25.0)
let FontHUDBig = UIFont(name: "comic andy", size: 120.0)


let SoundWrong = "wrong.m4a" // pass 할때 나오는 음
let SoundWin = "success.mp3" // 맞췄을시 나오는 음
let Soundfail = "failsound.mp3"  // 틀렸을시 나오는 음
let Soundbutton = "win.mp3"  // 버튼 누를 시 나오는 음
let Soundbg = "bgsound.mp3" // 시작화면 배경음


let AudioEffectFiles = [Soundfail,SoundWrong,SoundWin,Soundbutton,Soundbg]



//Random number generator
func randomNumber(minX:UInt32, maxX:UInt32) -> Int {
  let result = (arc4random() % (maxX - minX + 1)) + minX
  return Int(result)
}

