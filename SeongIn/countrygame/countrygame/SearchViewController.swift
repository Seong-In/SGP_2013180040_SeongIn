//
//  SearchViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 5. 27..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var simage: UIImageView!
    @IBOutlet weak var name: UITextView!
    
    
    
    
    
    override func viewDidLoad() {
        name.text = " ddd"
        if let url = URL(string: "http://cafefiles.naver.net/20121211_227/fhrhcjsrnr_1355153389025C3iba_JPEG/%C5%C2%B1%D8%B1%E2%C0%CF%B7%AF%BD%BA%C6%AE4.jpg"){
            if let data = try? Data(contentsOf: url ){
                simage.image = UIImage(data: data)
            }
        }
        
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
