//
//  studyViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 5. 24..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit

class studyViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    
    @IBAction func search(_ sender: Any) {
        
    }
    @IBAction func doneToPickerViewController(segue:UIStoryboardSegue){
        
    }
    @IBOutlet weak var searchbutton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var wantnum: UITextView!
    var pickerDataSource = ["전체보기","10개씩보기","20개씩보기","원하는 만큼보기"]
    var numOfRows : String = ""
    var pageSize : String = ""
    var pageNo : Int = 0
    var starPage : Int = 0
    
    
    var url : String = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?serviceKey=ULx0dmA5vWHvXJ4vC79V9c9i2suuEGqXRJdfniXk4p6%2FV9IooCh7SmChiFUm9zmHn0%2BIrCETAP813RCG1le8Dw%3D%3D&"
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            wantnum.isScrollEnabled = false
            numOfRows = "197"
            pageSize = "197"
            pageNo = 1
            starPage = 1
          
        } else if row == 1{
            wantnum.isScrollEnabled = false
            numOfRows = "10"
            pageSize = "10"
            pageNo = Int((arc4random() % 20) + 1)
            starPage = Int((arc4random() % 20) + 1)
            
        } else if row == 2{
            wantnum.isScrollEnabled = false
            numOfRows = "20"
            pageSize = "20"
            pageNo = Int((arc4random() % 10) + 1)
            starPage = Int((arc4random() % 10) + 1)
        } else {
            wantnum.isScrollEnabled = true
            numOfRows = wantnum.text
            pageSize = wantnum.text
            pageNo = Int((arc4random() % 10) + 1)
            starPage = Int((arc4random() % 10) + 1)
         
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTableView"{
            if let navController = segue.destination as? UINavigationController {
                if let wTableViewController = navController.topViewController as?
                    wholeTableViewController{
                    wTableViewController.url = url + "numOfRows=" + String(numOfRows) + "&pageSize=" + String(pageSize) + "&pageNo=" + String(pageNo) + "&startPage=" + String(starPage)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;

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
