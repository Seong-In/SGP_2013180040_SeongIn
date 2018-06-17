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
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    var imageur1 = NSMutableString()
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf:(URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"title") as!
            NSString as String
        
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"date") as!
            NSString as String
        
        
        if let url = URL(string:(posts.object(at: indexPath.row) as AnyObject).value(forKey: "imageurl") as! NSString as String)
        {
            if let data = try? Data(contentsOf: url)
            {
                cell.imageView?.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
