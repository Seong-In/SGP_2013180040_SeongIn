//
//  SearchViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 5. 27..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit
import Speech
class SearchViewController: UIViewController,XMLParserDelegate {
    var change = true
    var cnt = true
    @IBOutlet var tbData: UIView!
    @IBOutlet weak var check: UIButton!
    @IBOutlet weak var simage: UIImageView!
    @IBOutlet weak var name: UITextView!
    @IBOutlet weak var Detail: UITextView!
    
   
    @IBOutlet weak var kosearch: UIButton!
    @IBOutlet weak var ensearch: UIButton!
    
    @IBOutlet weak var setting: UIImageView!
    @IBAction func Kobutton(_ sender: Any) {
        audioController.playerEffect(name: Soundbutton)
        change = true
        setting.isHidden = true
        kosearch.isHidden = true
        ensearch.isHidden = true
        cnt = true
    }
    
    @IBAction func Enbutton(_ sender: Any) {
        audioController.playerEffect(name: Soundbutton)
        change = false
        setting.isHidden = true
        kosearch.isHidden = true
        ensearch.isHidden = true
        cnt = true
    }
    @IBAction func settingbutton(_ sender: Any) {
        audioController.playerEffect(name: Soundbutton)
        if(cnt == true)
        {
            setting.isHidden = false
            kosearch.isHidden = false
            ensearch.isHidden = false
            cnt = false
        }
        else{
            setting.isHidden = true
            kosearch.isHidden = true
            ensearch.isHidden = true
            cnt = true
        }
    }
    
    var countryname_utf8 = ""
    private let audioEngine = AVAudioEngine()
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    @IBAction func checkbutton(_ sender: Any) {
        searchname = name.text
        if(change == true)
        {
            beginParsing()
        }
        else
        {
            enbeginParsing()
        }
        if(searchname == "대한민국" || searchname == "한국" || searchname == "Korea"){
            audioController.playerEffect(name: Soundbutton)
            simage.image = UIImage(named: "korea.jpg")
            Detail.text = "    명칭 : 대한민국(Republic of Korea)\n    국기 : 태극기    국화 : 무궁화   수도 : 서울\n    언어 : 한국어   면적 : 99,720Km^2\n    인구 : 약 51,796,179명    세계:27위\n   GDP : 1조 6,932억$ 세계 12위 1인당 GDP : 3만2,774$ 세계29위 (2018 IMF기준)"
        } else if(searchname == "북한" || searchname == "조선민주주의인민공화국" || searchname == "NorthKorea"){
            audioController.playerEffect(name: Soundbutton)
            simage.image = UIImage(named: "north.jpeg")
            Detail.text = "    명칭 : 북한(조선민주주의인민공화국)\n    국기 : 인공기    수도 : 평양\n    언어 : 한국어  면적 : 120,538Km^2 (세계99위)\n    인구 : 25,611,000명(세계52위)"
        }
        else if(searchname == String(title1)||searchname == String(date))
        {
            audioController.playerEffect(name: Soundbutton)
            if let url = URL(string: String(imageur1)){
                if let data = try? Data(contentsOf: url ){
                    simage.image = UIImage(data: data)
                }
            }
            
            Detail.text = String(detail).replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "&nbsp;", with: "", options: .regularExpression, range: nil)
        } else {
            audioController.playerEffect(name: Soundfail)
            simage.image = UIImage(named: "x.png")
            Detail.text = ""
        }
        
    }
    var mapX = 0.0
    var mapY = 0.0
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
       
        countryname_utf8 = searchname.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        url = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?serviceKey=ULx0dmA5vWHvXJ4vC79V9c9i2suuEGqXRJdfniXk4p6%2FV9IooCh7SmChiFUm9zmHn0%2BIrCETAP813RCG1le8Dw%3D%3D&numOfRows=1&pageSize=1&pageNo=1&startPage=1&countryName=" + countryname_utf8
        posts = []
        parser = XMLParser(contentsOf:(URL(string:url))!)!
        parser.delegate = self
        parser.parse()
        tbData.reloadInputViews()
        
    }
    func enbeginParsing()
    {
        url = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?serviceKey=ULx0dmA5vWHvXJ4vC79V9c9i2suuEGqXRJdfniXk4p6%2FV9IooCh7SmChiFUm9zmHn0%2BIrCETAP813RCG1le8Dw%3D%3D&numOfRows=1&pageSize=1&pageNo=1&startPage=1&countryEnName=" + searchname
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
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMapView" {
            if let mapViewController = segue.destination as? MapViewController {
                mapViewController.posts = posts
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        
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






















