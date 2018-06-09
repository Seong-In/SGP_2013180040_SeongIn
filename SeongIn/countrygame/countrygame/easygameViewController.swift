//
//  easygameViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 6. 9..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit
import Speech

class easygameViewController: UIViewController,XMLParserDelegate {
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var timerlabel: UILabel!
    @IBOutlet var tbData: UIView!
    @IBOutlet weak var startpass: UIButton!
    
    private var speechRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))!
    private var speechRecognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    
    var score = 0
    var seconds = 0
    var timer = Timer()
    var failcounter = 0
    var passcounter = 0
    var wincounter = 0
    
    
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    
    @IBAction func passbutton(_ sender: Any) {
        beginParsing()
        passcounter += 1
        if(score > 0){
            score -= 1
        }
        if let urlr = URL(string: String(imageur1)){
            if let data = try? Data(contentsOf: urlr ){
                countryimage.image = UIImage(data: data)
                audioController.playerEffect(name: SoundDing)
                answer.text = ""
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
        try! startSession()
        
    }
    @IBAction func answerbutton(_ sender: Any) {
        sname = answer.text
        
        if(sname == String(title1) ){
            
            score += 10
            wincounter += 1
            beginParsing()
            if let urlr = URL(string: String(imageur1)){
                if let data = try? Data(contentsOf: urlr ){
                    countryimage.image = UIImage(data: data)
                    audioController.playerEffect(name: SoundWin)
                    answer.text = ""
                }
            }
            
        }
        else{
            if(score>0)
            {
                score -= 5
            }
            failcounter += 1
            audioController.playerEffect(name: SoundWrong)
            beginParsing()
            if let urlr = URL(string: String(imageur1)){
                if let data = try? Data(contentsOf: urlr ){
                    countryimage.image = UIImage(data: data)
                    answer.text = ""
                }
            }
        }
        
        
        
        
        
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
        
        seconds = 120
        score = 0
        failcounter = 0
        wincounter = 0
        passcounter = 0
        timerlabel.text = " Time :  \(seconds)"
        scorelabel.text = "\(score)"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
            #selector(self.subtractTime) , userInfo: nil, repeats: true)
        
    }
    
    func regame()
    {
        if(seconds == 0 || failcounter == 5 || wincounter == 10 || (failcounter + wincounter + passcounter == 10)){
            timer.invalidate()
            
            let alert = UIAlertController(title: " Time is up!",message: " 정답횟수 : \(wincounter), 틀린횟수 : \(failcounter)   넘어간 횟수 \(passcounter), score : \(score).", preferredStyle:UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "continue?",style:UIAlertActionStyle.default, handler:{action in self.setupGame()}))
            alert.addAction(UIAlertAction(title: "cancle",style:UIAlertActionStyle.default))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func subtractTime(){
        
        seconds -= 1
        timerlabel.text = "Time:\(seconds)"
        scorelabel.text = "\(score)"
        
        regame()
    }
    func authorizeSR() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.start.isEnabled = true
                    
                case .denied:
                    self.start.isEnabled = false
                    self.start.setTitle("Speech recognition access denied by user", for: .disabled)
                    
                case .restricted:
                    self.start.isEnabled = false
                    self.start.setTitle("Speech recognition restricted on device", for: .disabled)
                    
                case .notDetermined:
                    self.start.isEnabled = false
                    self.start.setTitle("Speech recognition not authorized", for: .disabled)
                }
            }
        }
    }
    
    func startSession() throws {
        
        if let recognitionTask = speechRecognitionTask {
            recognitionTask.cancel()
            self.speechRecognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(AVAudioSessionCategoryRecord)
        
        speechRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let recognitionRequest = speechRecognitionRequest else { fatalError("SFSpeechAudioBufferRecognitionRequest object creation failed") }
        
        let inputNode = audioEngine.inputNode //else { fatalError("Audio engine has no input node") }
        
        recognitionRequest.shouldReportPartialResults = true
        
        speechRecognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
            
            var finished = false
            
            if let result = result {
                self.answer.text =
                    result.bestTranscription.formattedString
                finished = result.isFinal
            }
            
            if error != nil || finished {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.speechRecognitionRequest = nil
                self.speechRecognitionTask = nil
                
                self.start.isEnabled = true
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            
            self.speechRecognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
    }
    
    
    override func viewDidLoad() {
        authorizeSR()
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
