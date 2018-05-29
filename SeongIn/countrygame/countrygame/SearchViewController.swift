//
//  SearchViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 5. 27..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,XMLParserDelegate {

    @IBOutlet var tbData: UIView!
    @IBOutlet weak var check: UIButton!
    @IBOutlet weak var simage: UIImageView!
    @IBOutlet weak var name: UITextView!
    @IBOutlet weak var Detail: UITextView!
    
    @IBAction func checkbutton(_ sender: Any) {
        sname = name.text
        beginParsing()
        if(sname == String(date))
        {
            if let url = URL(string: String(imageur1)){
                if let data = try? Data(contentsOf: url ){
                    simage.image = UIImage(data: data)
                }
            }
            Detail.text = String(detail)
            
        } else {
            simage.image = UIImage(named: "x.png")
        }
    }
    var sname : String = ""
    var url : String = ""
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    var detail = NSMutableString()
    var imageur1 = NSMutableString()
    func beginParsing()
    {
        
        url = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?serviceKey=ULx0dmA5vWHvXJ4vC79V9c9i2suuEGqXRJdfniXk4p6%2FV9IooCh7SmChiFUm9zmHn0%2BIrCETAP813RCG1le8Dw%3D%3D&numOfRows=1&pageSize=1&pageNo=1&startPage=1&countryEnName=" + sname
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
            detail = NSMutableString()
            detail = ""
            
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "countryName"){
            title1.append(string)
        } else if element.isEqual(to: "countryEnName"){
            date.append(string)
        } else if element.isEqual(to: "imgUrl"){
            imageur1.append(string)
        } else if element.isEqual(to: "basic"){
            detail.append(string)
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
            if !title1.isEqual(nil){
                elements.setObject(detail, forKey: "detail" as NSCopying)
            }
            posts.add(elements)
        }
    }
    
   
    
    
    
    override func viewDidLoad() {
        
        //name.text = " ddd"
       // sname = name.text
      
      
        
       
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
