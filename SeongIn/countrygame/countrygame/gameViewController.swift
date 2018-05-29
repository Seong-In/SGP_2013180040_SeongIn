//
//  gameViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 5. 25..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit

class gameViewController: UIViewController,XMLParserDelegate {
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var timerlabel: UILabel!
    @IBOutlet var tbData: UIView!
    @IBOutlet weak var startpass: UIButton!
    var score = 0
    var seconds = 0
    var timer = Timer()
    var cnt = 0
    
    @IBAction func passbutton(_ sender: Any) {
        beginParsing()
        score -= 1
        if let urlr = URL(string: String(imageur1)){
            if let data = try? Data(contentsOf: urlr ){
                countryimage.image = UIImage(data: data)
            }
        }
    }
    @IBOutlet weak var start: UIButton!
    @IBAction func startbutton(_ sender: Any) {
        beginParsing()
        setupGame()
        if let urlr = URL(string: String(imageur1)){
            if let data = try? Data(contentsOf: urlr ){
                countryimage.image = UIImage(data: data)
            }
        }
        start.isEnabled = false
    }
    @IBAction func answerbutton(_ sender: Any) {
        sname = answer.text
        
        if(sname == String(title1) ){
            score += 10
            beginParsing()
            if let urlr = URL(string: String(imageur1)){
                if let data = try? Data(contentsOf: urlr ){
                    countryimage.image = UIImage(data: data)
                }
            }
            
        }
        else{
            score -= 5
        }
        print(String(title1))
        
        
    
        
    }
    @IBOutlet weak var answer: UITextView!
    @IBOutlet weak var countryimage: UIImageView!
    
    var sname : String = ""
   
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    var imageur1 = NSMutableString()
    var url : String = ""
    var pageNo : Int = 1
    var startPage : Int = 1
    
    func beginParsing()
    {
        
        pageNo = Int((arc4random() % 197) + 1)
        startPage = Int((arc4random() % 197) + 1)
        
        url = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?serviceKey=ULx0dmA5vWHvXJ4vC79V9c9i2suuEGqXRJdfniXk4p6%2FV9IooCh7SmChiFUm9zmHn0%2BIrCETAP813RCG1le8Dw%3D%3D&numOfRows=1&pageSize=1&pageNo=" + String(pageNo) + "&startPage=" + String(startPage)
        posts = []
        parser = XMLParser(contentsOf:(URL(string:url))!)!
        parser.delegate = self
        parser.parse()
        tbData.reloadInputViews()
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if( elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            title1 = NSMutableString()
            title1 = ""
            date = NSMutableString()
            date = ""
            imageur1 = NSMutableString()
            imageur1 = ""
            
        }
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "countryName"){
            title1.append(string)
        } else if element.isEqual(to: "countryEnName"){
            date.append(string)
        } else if element.isEqual(to: "imgUrl"){
            imageur1.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName as NSString).isEqual(to: "item"){
            if !title1.isEqual(nil){
                elements.setObject(title1, forKey: "title" as NSCopying)
            }
            if !title1.isEqual(nil){
                elements.setObject(date, forKey: "date" as NSCopying)
            }
            if !title1.isEqual(nil){
                elements.setObject(imageur1, forKey: "imageurl" as NSCopying)
            }
            posts.add(elements)
        }
    }
    func setupGame(){
        
        seconds = 30
        score = 0
        
        timerlabel.text = "Time : \(seconds)"
        scorelabel.text = "\(score)"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
            #selector(self.subtractTime) , userInfo: nil, repeats: true)
        
    }
    
    @objc func subtractTime(){
        
        seconds -= 1
        timerlabel.text = "Time:\(seconds)"
        scorelabel.text = "\(score)"
        if(seconds == 10||seconds == 20){
            beginParsing()
            if let urlr = URL(string: String(imageur1)){
                if let data = try? Data(contentsOf: urlr ){
                    countryimage.image = UIImage(data: data)
                }
            }
        }
        if(seconds == 0){
            timer.invalidate()
            
            let alert = UIAlertController(title: " Time is up!",message: "you scored \(score) score", preferredStyle:UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "play Again",style:UIAlertActionStyle.default, handler:{action in self.setupGame()}))
            present(alert, animated: true, completion: nil)
        }
            
            
        
    }
    
    
    override func viewDidLoad() {
        
        beginParsing()
        super.viewDidLoad()
        //setupGame()

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
