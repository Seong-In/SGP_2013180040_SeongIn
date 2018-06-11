//
//  MapViewController.swift
//  countrygame
//
//  Created by KPU_GAME on 2018. 6. 11..
//  Copyright © 2018년 KPU_GAME. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var posts = NSMutableArray()
    var mapX = 0.0
    var mapY = 0.0
    let regionRadius: CLLocationDistance = 1000000 // 축적
    
    func centerMapOnLocation(location: CLLocation) {
        let coordnateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        
        mapView.setRegion(coordnateRegion, animated: true)
    }
    
    var hospitals : [SearchMap] = []
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! SearchMap
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    
    func mapView(_mapView: MKMapView, viewFor annotation: MKAnnotation) ->MKAnnotationView? {
        guard let annotation = annotation as? SearchMap else { return nil}
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView{
            dequeuedView.annotation = annotation
            view = dequeuedView
            
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y:5)
            view.rightCalloutAccessoryView = UIButton(type:.detailDisclosure)
            
        }
        return view
        
    }
    
    func loaction()
    {
        if(searchname == "가나"){
        }
        if(searchname == "니우에"){
        }
        if(searchname == "마카오(중국)"){
        }
        if(searchname == "홍콩(중국)"){
        }
        if(searchname == "리비아"){
        }
        if(searchname == "콜롬비아"){
        }
        if(searchname == "시리아"){
        }
        if(searchname == "쿡제도"){
        }
        if(searchname == "나이지리아"){
        }
        if(searchname == "소말리아"){
        }
        if(searchname == "이라크"){
        }
        if(searchname == "예멘"){
        }
        if(searchname == "아프가니스탄"){
        }
        if(searchname == "아제르바이잔"){
        }
        if(searchname == "라이베리아"){
        }
        if(searchname == "르완다"){
        }
        if(searchname == "부르키나파소"){
        }
        if(searchname == "수단"){
        }
        if(searchname == "바레인"){
        }
        if(searchname == "에리트레아"){
        }
        if(searchname == "남수단"){
        }
        if(searchname == "미얀마"){
        }
        if(searchname == "방글라데시"){
        }
        if(searchname == "키르기스스탄"){
        }
        if(searchname == "타지키스탄"){
        }
        if(searchname == "코소보"){
        }
        if(searchname == "탄자니아"){
        }
        if(searchname == "태국"){
        }
        if(searchname == "조지아"){
        }
        if(searchname == "중국"){
        }
        if(searchname == "그레나다"){
        }
        if(searchname == "필리핀"){
        }
        if(searchname == "코트디부아르"){
        }
        if(searchname == "일본"){
        }
        if(searchname == "러시아"){
        }
        if(searchname == "아랍에미리트"){
        }
        if(searchname == "벨리즈"){
        }
        if(searchname == "쿠바"){
        }
        if(searchname == "캄보디아"){
        }
        if(searchname == "리투아니아"){
        }
        if(searchname == "칠레"){
        }
        if(searchname == "알제리"){
        }
        if(searchname == "남아프리카공화국"){
        }
        if(searchname == "체코"){
        }
        if(searchname == "인도"){
        }
        if(searchname == "요르단"){
        }
        if(searchname == "지부티"){
        }
        if(searchname == "미국"){
        }
        if(searchname == "엘살바도르"){
        }
        if(searchname == "캐나다"){
        }
        if(searchname == "스리랑카"){
        }
        if(searchname == "피지"){
        }
        if(searchname == "호주"){
        }
        if(searchname == "나우루"){
        }
        if(searchname == "마셜제도"){
        }
        if(searchname == "미크로네시아"){
        }
        if(searchname == "몰디브"){
        }
        if(searchname == "키리바시"){
        }
        if(searchname == "투발루"){
        }
        if(searchname == "덴마크"){
        }
        if(searchname == "이탈리아"){
        }
        if(searchname == "몰타"){
        }
        if(searchname == "산마리노"){
        }
        if(searchname == "벨라루스"){
        }
        if(searchname == "페루"){
        }
        if(searchname == "파키스탄"){
        }
        if(searchname == "팔라우"){
        }
        if(searchname == "폴란드"){
        }
        if(searchname == "아르메니아"){
        }
        if(searchname == "이란"){
        }
        if(searchname == "이스라엘"){
        }
        if(searchname == "토고"){
        }
        if(searchname == "도미니카공화국"){
        }
        if(searchname == "코스타리카"){
        }
        if(searchname == "파라과이"){
        }
        if(searchname == "세인트키츠네비스"){
        }
        if(searchname == "아이티"){
        }
        if(searchname == "앤티가바부다"){
        }
        if(searchname == "도미니카연방"){
        }
        if(searchname == "인도네시아"){
        }
        if(searchname == "투르크메니스탄"){
        }
        if(searchname == "앙골라"){
        }
        if(searchname == "쿠웨이트"){
        }
        if(searchname == "우루과이"){
        }
        if(searchname == "우즈베키스탄"){
        }
        if(searchname == "독일"){
        }
        if(searchname == "슬로베니아"){
        }
        if(searchname == "오스트리아"){
        }
        if(searchname == "알바니아"){
        }
        if(searchname == "안도라"){
        }
        if(searchname == "감비아"){
        }
        if(searchname == "기니비사우"){
        }
        if(searchname == "모로코"){
        }
        if(searchname == "모리타니"){
        }
        if(searchname == "부룬디"){
        }
        if(searchname == "세네갈"){
        }
        if(searchname == "에티오피아"){
        }
        if(searchname == "이집트"){
        }
        if(searchname == "베냉"){
        }
        if(searchname == "부탄"){
        }
        if(searchname == "키프로스(사이프러스)"){
        }
        if(searchname == "세르비아"){
        }
        if(searchname == "몬테네그로"){
        }
        if(searchname == "기니"){
        }
        if(searchname == "나미비아"){
        }
        if(searchname == "레바논"){
        }
        if(searchname == "카보베르데"){
        }
        if(searchname == "과테말라"){
        }
        if(searchname == "라오스"){
        }
        if(searchname == "말레이시아"){
        }
        if(searchname == "브루나이"){
        }
        if(searchname == "동티모르"){
        }
        if(searchname == "우크라이나"){
        }
        if(searchname == "포르투갈"){
        }
        if(searchname == "룩셈부르크"){
        }
        if(searchname == "말리"){
        }
        if(searchname == "볼리비아"){
        }
        if(searchname == "대만"){
        }
        if(searchname == "루마니아"){
        }
        if(searchname == "스페인"){
        }
        if(searchname == "헝가리"){
        }
        if(searchname == "멕시코"){
        }
        if(searchname == "브라질"){
        }
        if(searchname == "그리스"){
        }
        if(searchname == "벨기에"){
        }
        if(searchname == "터키"){
        }
        if(searchname == "프랑스"){
        }
        if(searchname == "몰도바"){
        }
        if(searchname == "튀니지"){
        }
        if(searchname == "짐바브웨"){
        }
        if(searchname == "슬로바키아"){
        }
        if(searchname == "니제르"){
        }
        if(searchname == "베트남"){
        }
        if(searchname == "케냐"){
        }
        if(searchname == "사우디아라비아"){
        }
        if(searchname == "바누아투"){
        }
        if(searchname == "바베이도스"){
        }
        if(searchname == "우간다"){
        }
        if(searchname == "자메이카"){
        }
        if(searchname == "트리니다드토바고"){
        }
        if(searchname == "시에라리온"){
        }
        if(searchname == "세인트루시아"){
        }
        if(searchname == "세인트빈센트그레나딘"){
        }
        if(searchname == "카자흐스탄"){
        }
        if(searchname == "카메룬"){
        }
        if(searchname == "중앙아프리카공화국"){
        }
        if(searchname == "네팔"){
        }
        if(searchname == "불가리아"){
        }
        if(searchname == "영국"){
        }
        if(searchname == "마케도니아"){
        }
        if(searchname == "차드"){
        }
        if(searchname == "코모로"){
        }
        if(searchname == "라트비아"){
        }
        if(searchname == "카타르"){
        }
        if(searchname == "모리셔스"){
        }
        if(searchname == "세이셸"){
        }
        if(searchname == "아일랜드"){
        }
        if(searchname == "모나코"){
        }
        if(searchname == "스웨덴"){
        }
        if(searchname == "오만"){
        }
        if(searchname == "니카라과"){
        }
        if(searchname == "싱가포르"){
        }
        if(searchname == "네덜란드"){
        }
        if(searchname == "스위스"){
        }
        if(searchname == "베네수엘라"){
        }
        if(searchname == "온두라스"){
        }
        if(searchname == "에스토니아"){
        }
        if(searchname == "핀란드"){
        }
        if(searchname == "레소토"){
        }
        if(searchname == "상투메프린시페"){
        }
        if(searchname == "가봉"){
        }
        if(searchname == "모잠비크"){
        }
        if(searchname == "보츠와나"){
        }
        if(searchname == "스와질랜드"){
        }
        if(searchname == "적도기니"){
        }
        if(searchname == "콩고"){
        }
        if(searchname == "공코민주공화국"){
        }
        if(searchname == "노르웨이"){
        }
        if(searchname == "리히텐슈타인"){
        }
        if(searchname == "아이슬란드"){
        }
        if(searchname == "크로아티아"){
        }
        if(searchname == "파나마"){
        }
        if(searchname == "가이아나공화국"){
        }
        if(searchname == "수리남"){
        }
        if(searchname == "통가"){
        }
        if(searchname == "파푸아뉴기니"){
        }
        if(searchname == "마다가스카르"){
        }
        if(searchname == "말라위"){
        }
        if(searchname == "몽골"){
        }
        if(searchname == "사모아"){
        }
        if(searchname == "솔로몬제도"){
        }
        if(searchname == "뉴질랜드"){
        }
        if(searchname == "보스니아-헤르체고비나"){
        }
        if(searchname == "잠비아"){
        }
        if(searchname == "아르헨티나"){
        }
        if(searchname == "에콰도르"){
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(searchname == "미국")
        {
            mapX = 35.907757
            mapY = 127.76692200000002
        }
        else{
            mapX = 0
            mapY = 0
        }
        let initialLocation = CLLocation(latitude: mapX, longitude: mapY)
        centerMapOnLocation(location: initialLocation)
        mapView.delegate = self
       
        mapView.addAnnotations(hospitals)
        
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
