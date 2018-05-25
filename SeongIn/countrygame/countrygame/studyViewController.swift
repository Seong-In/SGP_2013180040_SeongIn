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
    var pickerDataSource = ["전체보기","10개씩보기","20개씩보기","원하는 만큼보가"]
    
    var url : String = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?serviceKey=ULx0dmA5vWHvXJ4vC79V9c9i2suuEGqXRJdfniXk4p6%2FV9IooCh7SmChiFUm9zmHn0%2BIrCETAP813RCG1le8Dw%3D%3D&numOfRows=197&pageSize=197&pageNo=1&startPage=1"
    var pageSize : Int = 10
    var pageNo : Int = 1
    
    
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
          
        } else if row == 1{
            
        } else if row == 2{
            
        } else {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTableView"{
            if let navController = segue.destination as? UINavigationController {
                if let wTableViewController = navController.topViewController as?
                    wholeTableViewController{
                    wTableViewController.url = url
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
