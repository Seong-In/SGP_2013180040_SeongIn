//
//  wholeTableViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 5. 25..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit

class wholeTableViewController: UITableViewController,XMLParserDelegate {

    
    @IBOutlet var tbData: UITableView!
    
    
    var url : String?
    
    var parser = XMLParser()
    
    let postsname : [String] = ["병원명", "주소", "전화번호", "홈페이지" ,"종별코드명" ,"개설일자" ,"의사총수", "전문의 인원수",
                                "일반의 인원수", "레지던트 인원수", "인턴 인원수"]
    
    var posts : [String] = ["","","","","","","","","","",""]
    
    var element = NSString()
    var yadmNm = NSMutableString()
    var addr = NSMutableString()
    var telno = NSMutableString()
    var hospUrl = NSMutableString()
    var clCdNm = NSMutableString()
    var estbDd = NSMutableString()
    var drToCnt = NSMutableString()
    var sdrCnt = NSMutableString()
    var gdrCnt = NSMutableString()
    var resdntCnt = NSMutableString()
    var intnCnt = NSMutableString()
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf:(URL(string:"http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?pageNo=1&numOfRows=10&serviceKey=sea100UMmw23Xycs33F1EQnumONR%2F9ElxBLzkilU9Yr1oT4TrCot8Y2p0jyuJP72x9rG9D8CN5yuEs6AS2sAiw%3D%3D&sidoCd=110000&sgguCd=110023"))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "item")
        {
            posts = ["","","","","","","","","","",""]
            
            yadmNm = NSMutableString()
            yadmNm = ""
            
            addr = NSMutableString()
            addr = ""
            telno = NSMutableString()
            telno = ""
            hospUrl = NSMutableString()
            hospUrl = ""
            clCdNm = NSMutableString()
            clCdNm = ""
            estbDd = NSMutableString()
            estbDd = ""
            drToCnt = NSMutableString()
            drToCnt = ""
            sdrCnt = NSMutableString()
            sdrCnt = ""
            gdrCnt = NSMutableString()
            gdrCnt = ""
            resdntCnt = NSMutableString()
            resdntCnt = ""
            intnCnt = NSMutableString()
            intnCnt = ""
            
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "yadmNm"){
            yadmNm.append(string)
        } else if element.isEqual(to: "addr"){
            addr.append(string)
            
        } else if element.isEqual(to: "telno"){
            telno.append(string)
            
        } else if element.isEqual(to: "hospUrl"){
            hospUrl.append(string)
        } else if element.isEqual(to: "clCdNm"){
            clCdNm.append(string)
        } else if element.isEqual(to: "estbDd"){
            estbDd.append(string)
        } else if element.isEqual(to: "drTotCnt"){
            drToCnt.append(string)
        } else if element.isEqual(to: "sdrCnt"){
            sdrCnt.append(string)
        } else if element.isEqual(to: "gdrCnt"){
            gdrCnt.append(string)
        } else if element.isEqual(to: "resdntCnt"){
            resdntCnt.append(string)
        } else if element.isEqual(to: "intnCnt"){
            intnCnt.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqual(to: "item"){
            if !yadmNm.isEqual(nil) {
                posts[0] = yadmNm as String
            }
            if !addr.isEqual(nil) {
                posts[1] = addr as String
            }
            if !telno.isEqual(nil) {
                posts[2] = telno as String
            }
            if !hospUrl.isEqual(nil) {
                posts[3] = hospUrl as String
            }
            if !clCdNm.isEqual(nil) {
                posts[4] = clCdNm as String
            }
            if !estbDd.isEqual(nil) {
                posts[5] = estbDd as String
            }
            if !drToCnt.isEqual(nil) {
                posts[6] = drToCnt as String
            }
            if !sdrCnt.isEqual(nil) {
                posts[7] = sdrCnt as String
            }
            if !gdrCnt.isEqual(nil) {
                posts[8] = gdrCnt as String
            }
            if !resdntCnt.isEqual(nil) {
                posts[9] = resdntCnt as String
            }
            if !intnCnt.isEqual(nil) {
                posts[10] = intnCnt as String
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       //cell.textLabel?.text = "mmmmm"
        cell.textLabel?.text = postsname[indexPath.row]
        cell.detailTextLabel?.text = posts[indexPath.row]
        
        // Configure the cell...
        
        return cell
    }

}
