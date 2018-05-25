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
    var hospitalname = ""
    var hospitalname_utf8 = ""
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var yadmNm = NSMutableString()
    var addr = NSMutableString()
    
    var url : String?
    
    var XPos = NSMutableString()
    var YPos = NSMutableString()
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf:(URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadInputViews()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if( elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            yadmNm = NSMutableString()
            yadmNm = ""
            addr = NSMutableString()
            addr = ""
            XPos = NSMutableString()
            XPos = ""
            YPos = NSMutableString()
            YPos = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "countryName"){
            yadmNm.append(string)
        } else if element.isEqual(to: "countryName"){
            addr.append(string)
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName as NSString).isEqual(to: "item"){
            if !yadmNm.isEqual(nil){
                elements.setObject(yadmNm, forKey: "countryName" as NSCopying)
            }
            if !addr.isEqual(nil){
                elements.setObject(addr, forKey: "countryName" as NSCopying)
            }
            
            
            posts.add(elements)
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
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"countryName") as!
            NSString as String
        
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"countryName") as!
            NSString as String
        
        return cell
    }

}
