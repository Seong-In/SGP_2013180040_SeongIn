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
    var mapXY : [Double] = [35.907757, 127.76692200000002]
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
    
    func maploaction()
    {
        
        if(searchname == "가나"){
            mapXY = [7.946527,-1.0231939999999895]
        }
        if(searchname == "니우에"){
            mapXY = [19.054445, -169.867233]
        }
        if(searchname == "마카오(중국)"){
           mapXY = [ 22.198745, 113.54387300000008]
        }
        if(searchname == "홍콩(중국)"){
           mapXY = [22.396428, 114.10949700000003]
        }
        if(searchname == "리비아"){
            mapXY = [ 26.3351, 17.228331000000026]
        }
        if(searchname == "콜롬비아"){
            mapXY = [4.570868, -74.29733299999998]
        }
        if(searchname == "시리아"){
            mapXY = [ 34.80207499999999, 38.99681499999997]
        }
        if(searchname == "쿡제도"){
            mapXY = [ -21.236736, -159.777671]
        }
        if(searchname == "나이지리아"){
            mapXY = [9.081999, 8.675277000000051]
        }
        if(searchname == "소말리아"){
            mapXY = [5.152149, 46.19961599999999]
        }
        if(searchname == "이라크"){
            mapXY = [33.223191, 43.679291000000035]
         
        }
        if(searchname == "예멘"){
            mapXY = [15.552727, 48.516388000000006]
        }
        if(searchname == "아프가니스탄"){
            mapXY = [33.93911, 67.70995300000004]
        }
        if(searchname == "아제르바이잔"){
            mapXY = [ 40.143105, 47.57692700000007]
        }
        if(searchname == "라이베리아"){
           mapXY = [ 6.428055, -9.429498999999964]
        }
        if(searchname == "르완다"){
            mapXY = [-1.940278, 29.873887999999965]
        }
        if(searchname == "부르키나파소"){
           mapXY = [ 12.238333, -1.5615930000000162]
        }
        if(searchname == "수단"){
            mapXY = [12.862807, 30.21763599999997]
        }
        if(searchname == "바레인"){
            mapXY = [26.0667, 50.55770000000007]
        }
        if(searchname == "에리트레아"){
            mapXY = [15.179384, 39.78233399999999]
        }
        if(searchname == "남수단"){
            mapXY = [6.876991899999999, 31.306978800000024]
        }
        if(searchname == "미얀마"){
            mapXY = [21.916221, 95.95597399999997]
        }
        if(searchname == "방글라데시"){
            mapXY = [23.684994, 90.35633099999995]
        }
        if(searchname == "키르기스스탄"){
            mapXY = [41.20438, 74.76609800000006]
        }
        if(searchname == "타지키스탄"){
            mapXY = [38.861034, 71.27609299999995]
        }
        if(searchname == "코소보"){
            mapXY = [42.6026359, 20.902976999999964]
        }
        if(searchname == "탄자니아"){
            mapXY = [-6.369028, 34.888822000000005]
        }
        if(searchname == "태국"){
            mapXY = [15.870032, 100.99254100000007]
        }
        if(searchname == "조지아"){
            mapXY = [42.315407, 43.356892000000016]
        }
        if(searchname == "중국"){
            mapXY = [35.86166, 104.19539699999996]
        }
        if(searchname == "그레나다"){
            mapXY = [12.1165, -61.678999999999974]
        }
        if(searchname == "필리핀"){
            mapXY = [12.879721, 121.77401699999996]
        }
        if(searchname == "코트디부아르"){
            mapXY = [7.539988999999999, -5.547080000000051]
        }
        if(searchname == "일본"){
            mapXY = [36.204824, 138.252924]
        }
        if(searchname == "러시아"){
            mapXY = [61.52401, 105.31875600000001]
        }
        if(searchname == "아랍에미리트"){
            mapXY = [23.424076, 53.84781799999996]
        }
        if(searchname == "벨리즈"){
            mapXY = [17.189877, -88.49765000000002]
        }
        if(searchname == "쿠바"){
            mapXY = [21.521757, -77.78116699999998]
        }
        if(searchname == "캄보디아"){
            mapXY = [12.565679, 104.99096299999997]
        }
        if(searchname == "리투아니아"){
            mapXY = [55.169438, 23.88127499999996]
        }
        if(searchname == "칠레"){
            mapXY = [-35.675147, -71.54296899999997]
        }
        if(searchname == "알제리"){
            mapXY = [28.033886, 1.659626000000003]
        }
        if(searchname == "남아프리카공화국"){
            mapXY = [-30.559482, 22.937505999999985]
        }
        if(searchname == "체코"){
            mapXY = [49.81749199999999, 15.472962000000052]
        }
        if(searchname == "인도"){
            mapXY = [20.593684, 78.96288000000004]
        }
        if(searchname == "요르단"){
            mapXY = [30.585164, 36.238414000000034]
        }
        if(searchname == "지부티"){
            mapXY = [11.825138, 42.59027500000002]
        }
        if(searchname == "미국"){
            mapXY = [37.09024, -95.71289100000001]
        }
        if(searchname == "엘살바도르"){
            mapXY = [13.794185, -88.89652999999998]
        }
        if(searchname == "캐나다"){
            mapXY = [56.130366, -106.34677099999999]
        }
        if(searchname == "스리랑카"){
            mapXY = [7.873053999999999, 80.77179699999999]
        }
        if(searchname == "피지"){
            mapXY = [-17.713371, 178.06503199999997]
        }
        if(searchname == "호주"){
            mapXY = [-25.274398, 133.77513599999997]
        }
        if(searchname == "나우루"){
            mapXY = [-0.522778, 166.93150300000002]
        }
        if(searchname == "마셜제도"){
            mapXY = [7.131474, 171.184478]
        }
        if(searchname == "미크로네시아"){
            mapXY = [7.425554, 150.55081199999995]
        }
        if(searchname == "몰디브"){
            mapXY = [3.202778, 73.22068000000002]
        }
        if(searchname == "키리바시"){
            mapXY = [ -3.370417, -168.734039]
        }
        if(searchname == "투발루"){
            mapXY = [-7.109534999999999, 177.64932999999996]
        }
        if(searchname == "덴마크"){
            mapXY = [56.26392, 9.50178500000004]
        }
        if(searchname == "이탈리아"){
            mapXY = [41.87194, 12.567379999999957]
        }
        if(searchname == "몰타"){
            mapXY = [35.937496, 14.375415999999973]
        }
        if(searchname == "산마리노"){
            mapXY = [43.94236, 12.457776999999965]
        }
        if(searchname == "벨라루스"){
            mapXY = [53.709807, 27.953389000000016]
        }
        if(searchname == "페루"){
            mapXY = [9.189967, -75.015152]
        }
        if(searchname == "파키스탄"){
            mapXY = [ 30.375321, 69.34511599999996]
        }
        if(searchname == "팔라우"){
            mapXY = [7.514979999999999, 134.58251999999993]
        }
        if(searchname == "폴란드"){
            mapXY = [51.919438, 19.14513599999998]
        }
        if(searchname == "아르메니아"){
            mapXY = [40.069099, 45.03818899999999]
        }
        if(searchname == "이란"){
            mapXY = [32.427908, 53.688045999999986]
        }
        if(searchname == "이스라엘"){
            mapXY = [31.046051, 34.85161199999993]
        }
        if(searchname == "토고"){
            mapXY = [8.619543, 0.8247820000000274]
        }
        if(searchname == "도미니카공화국"){
            mapXY = [18.735693, -70.16265099999998]
        }
        if(searchname == "코스타리카"){
            mapXY = [9.748916999999999, -83.75342799999999]
        }
        if(searchname == "파라과이"){
            mapXY = [-23.442503, -58.443831999999986]
        }
        if(searchname == "세인트키츠네비스"){
            mapXY = [17.357822, -62.78299800000002]
        }
        if(searchname == "아이티"){
            mapXY = [18.971187, -72.285215]
        }
        if(searchname == "앤티가바부다"){
            mapXY = [17.060816, -61.79642799999999]
        }
        if(searchname == "도미니카연방"){
            mapXY = [15.414999, -61.37097600000004]
        }
        if(searchname == "인도네시아"){
            mapXY = [-0.789275, 113.92132700000002]
        }
        if(searchname == "투르크메니스탄"){
            mapXY = [38.969719, 59.55627800000002]
        }
        if(searchname == "앙골라"){
            mapXY = [-11.202692, 17.873886999999968]
        }
        if(searchname == "쿠웨이트"){
            mapXY = [29.31166, 47.48176599999999]
        }
        if(searchname == "우루과이"){
            mapXY = [ -32.522779, -55.76583500000004]
        }
        if(searchname == "우즈베키스탄"){
            mapXY = [41.377491, 64.58526200000006]
        }
        if(searchname == "독일"){
            mapXY = [51.165691, 10.451526000000058]
        }
        if(searchname == "슬로베니아"){
            mapXY = [46.151241, 14.995462999999972]
        }
        if(searchname == "오스트리아"){
            mapXY = [47.516231, 14.550072]
        }
        if(searchname == "알바니아"){
            mapXY = [41.153332, 20.168330999999966]
        }
        if(searchname == "안도라"){
            mapXY = [42.506285, 1.5218009999999822]
        }
        if(searchname == "감비아"){
            mapXY = [13.443182, -15.310138999999936]
        }
        if(searchname == "기니비사우"){
            mapXY = [11.803749, -15.180413000000044]
        }
        if(searchname == "모로코"){
            mapXY = [31.791702, -7.092620000000011]
        }
        if(searchname == "모리타니"){
            mapXY = [21.00789, -10.940834999999993]
        }
        if(searchname == "부룬디"){
            mapXY = [-3.373056, 29.91888599999993]
        }
        if(searchname == "세네갈"){
            mapXY = [ 14.497401, -14.452361999999994]
        }
        if(searchname == "에티오피아"){
            mapXY = [9.145000000000001, 40.48967300000004]
        }
        if(searchname == "이집트"){
            mapXY = [26.820553, 30.802498000000014]
        }
        if(searchname == "베냉"){
            mapXY = [9.30769, 2.3158339999999953]
        }
        if(searchname == "부탄"){
            mapXY = [27.514162, 90.43360099999995]
        }
        if(searchname == "키프로스(사이프러스)"){
            mapXY = [35.126413, 33.429858999999965]
        }
        if(searchname == "세르비아"){
            mapXY = [44.016521, 21.005858999999987]
        }
        if(searchname == "몬테네그로"){
            mapXY = [42.708678, 19.37438999999995]
        }
        if(searchname == "기니"){
            mapXY = [ 9.945587, -9.69664499999999]
        }
        if(searchname == "나미비아"){
            mapXY = [ -22.95764, 18.490409999999997]
        }
        if(searchname == "레바논"){
            mapXY = [33.854721, 35.86228499999993]
        }
        if(searchname == "카보베르데"){
            mapXY = [6.5388, -23.041799999999967]
        }
        if(searchname == "과테말라"){
            mapXY = [15.783471, -90.23075899999998]
        }
        if(searchname == "라오스"){
            mapXY = [19.85627, 102.495496]
        }
        if(searchname == "말레이시아"){
            mapXY = [4.210484, 101.97576600000002]
        }
        if(searchname == "브루나이"){
            mapXY = [4.535277, 114.72766899999999]
        }
        if(searchname == "동티모르"){
            mapXY = [-8.874217, 125.72753899999998]
        }
        if(searchname == "우크라이나"){
            mapXY = [48.379433, 31.16557990000001]
        }
        if(searchname == "포르투갈"){
            mapXY = [39.39987199999999, -8.224454000000037]
        }
        if(searchname == "룩셈부르크"){
            mapXY = [ 49.815273, 6.129583000000025]
        }
        if(searchname == "말리"){
            mapXY = [17.570692, -3.9961660000000165]
        }
        if(searchname == "볼리비아"){
            mapXY = [ -16.290154, -63.58865300000002]
        }
        if(searchname == "대만"){
            mapXY = [23.69781, 120.96051499999999]
        }
        if(searchname == "루마니아"){
            mapXY = [45.943161, 24.966760000000022]
        }
        if(searchname == "스페인"){
            mapXY = [40.46366700000001, -3.7492200000000366]
        }
        if(searchname == "헝가리"){
            mapXY = [47.162494, 19.503304100000037]
        }
        if(searchname == "멕시코"){
            mapXY = [23.634501, -102.55278399999997]
        }
        if(searchname == "브라질"){
            mapXY = [-14.235004, -51.92527999999999]
        }
        if(searchname == "그리스"){
            mapXY = [39.074208, 21.824311999999964]
        }
        if(searchname == "벨기에"){
            mapXY = [50.503887, 4.4699359999999615]
        }
        if(searchname == "터키"){
            mapXY = [38.963745, 35.243322000000035]
        }
        if(searchname == "프랑스"){
            mapXY = [ 46.227638, 2.213749000000007]
        }
        if(searchname == "몰도바"){
            mapXY = [47.411631, 28.369885000000068]
        }
        if(searchname == "튀니지"){
            mapXY = [33.886917, 9.537499000000025]
        }
        if(searchname == "짐바브웨"){
            mapXY = [-19.015438, 29.154856999999993]
        }
        if(searchname == "슬로바키아"){
            mapXY = [48.669026, 19.69902400000001]
        }
        if(searchname == "니제르"){
            mapXY = [17.607789, 8.081666000000041]
        }
        if(searchname == "베트남"){
            mapXY = [14.058324, 108.277199]
        }
        if(searchname == "케냐"){
            mapXY = [ -0.023559, 37.90619300000003]
        }
        if(searchname == "사우디아라비아"){
            mapXY = [23.885942, 45.079162]
        }
        if(searchname == "바누아투"){
            mapXY = [-15.376706, 166.959158]
        }
        if(searchname == "바베이도스"){
            mapXY = [13.193887, -59.54319799999996]
        }
        if(searchname == "우간다"){
            mapXY = [1.373333, 32.290275000000065]
        }
        if(searchname == "자메이카"){
            mapXY = [18.109581, -77.297508]
        }
        if(searchname == "트리니다드토바고"){
            mapXY = [10.691803, -61.22250300000002]
        }
        if(searchname == "시에라리온"){
            mapXY = [8.460555, -11.779889000000026]
        }
        if(searchname == "세인트루시아"){
            mapXY = [13.909444, -60.97889299999997]
        }
        if(searchname == "세인트빈센트그레나딘"){
            mapXY = [12.984305, -61.28722800000003]
        }
        if(searchname == "카자흐스탄"){
            mapXY = [48.019573, 66.92368399999998]
        }
        if(searchname == "카메룬"){
            mapXY = [7.369721999999999, 12.354722000000038]
        }
        if(searchname == "중앙아프리카공화국"){
            mapXY = [ 6.611110999999999, 20.93944399999998]
        }
        if(searchname == "네팔"){
            mapXY = [28.394857, 84.124008]
        }
        if(searchname == "불가리아"){
            mapXY = [42.7385204, 25.425099300000056]
        }
        if(searchname == "영국"){
            mapXY = [55.378051, -3.43597299999999]
        }
        if(searchname == "마케도니아"){
            mapXY = [41.608635, 21.745274999999992]
        }
        if(searchname == "차드"){
            mapXY = [15.454166, 18.732207000000017]
        }
        if(searchname == "코모로"){
            mapXY = [-11.6455, 43.33330000000001]
        }
        if(searchname == "라트비아"){
            mapXY = [56.879635, 24.60318899999993]
        }
        if(searchname == "카타르"){
            mapXY = [ 25.354826, 51.183884000000035]
        }
        if(searchname == "모리셔스"){
            mapXY = [ -20.348404, 57.55215199999998]
        }
        if(searchname == "세이셸"){
            mapXY = [-4.679574, 55.49197700000002]
        }
        if(searchname == "아일랜드"){
            mapXY = [53.41291, -8.243889999999965]
        }
        if(searchname == "모나코"){
            mapXY = [43.73841760000001, 7.42461579999997]
        }
        if(searchname == "스웨덴"){
            mapXY = [60.12816100000001, 18.643501000000015]
        }
        if(searchname == "오만"){
            mapXY = [21.4735329, 55.975413]
        }
        if(searchname == "니카라과"){
            mapXY = [12.865416, -85.20722899999998]
        }
        if(searchname == "싱가포르"){
            mapXY = [1.352083, 103.81983600000001]
        }
        if(searchname == "네덜란드"){
            mapXY = [52.132633, 5.2912659999999505]
        }
        if(searchname == "스위스"){
            mapXY = [46.818188, 8.227511999999933]
        }
        if(searchname == "베네수엘라"){
            mapXY = [ 6.42375, -66.58973000000003]
        }
        if(searchname == "온두라스"){
            mapXY = [15.199999, -86.24190499999997]
        }
        if(searchname == "에스토니아"){
            mapXY = [58.595272, 25.013607099999945]
        }
        if(searchname == "핀란드"){
            mapXY = [61.92410999999999, 25.748151099999973]
        }
        if(searchname == "레소토"){
            mapXY = [ -29.609988, 28.233608000000004]
        }
        if(searchname == "상투메프린시페"){
            mapXY = [0.18636, 6.613080999999966]
        }
        if(searchname == "가봉"){
            mapXY = [-0.803689, 11.60944399999994]
        }
        if(searchname == "모잠비크"){
            mapXY = [-18.665695, 35.52956199999994]
        }
        if(searchname == "보츠와나"){
            mapXY = [ -22.328474, 24.684866000000056]
        }
        if(searchname == "스와질랜드"){
            mapXY = [-26.522503, 31.465866000000005]
        }
        if(searchname == "적도기니"){
            mapXY = [1.650801, 10.267894999999953]
        }
        if(searchname == "콩고"){
            mapXY = [4.038333, 21.758663999999953]
        }
        if(searchname == "콩고민주공화국"){
            mapXY = [-4.038333, 21.758663999999953]
        }
        if(searchname == "노르웨이"){
            mapXY = [60.47202399999999, 8.46894599999996]
        }
        if(searchname == "리히텐슈타인"){
            mapXY = [47.166, 9.555373000000031]
        }
        if(searchname == "아이슬란드"){
            mapXY = [ 64.963051, -19.020835000000034]
        }
        if(searchname == "크로아티아"){
            mapXY = [45.1, 15.200000100000011]
        }
        if(searchname == "파나마"){
            mapXY = [8.537981, -80.782127]
        }
        if(searchname == "가이아나공화국"){
            mapXY = [4.860416, -58.93018000000001]
        }
        if(searchname == "수리남"){
            mapXY = [3.919305, -56.027783]
        }
        if(searchname == "통가"){
            mapXY = [-21.178986, -175.198242]
        }
        if(searchname == "파푸아뉴기니"){
            mapXY = [-6.314992999999999, 143.95555000000002]
        }
        if(searchname == "마다가스카르"){
            mapXY = [-18.766947, 46.869106999999985]
        }
        if(searchname == "말라위"){
            mapXY = [13.254308, 34.30152499999997]
        }
        if(searchname == "몽골"){
            mapXY = [46.862496, 103.84665599999994]
        }
        if(searchname == "사모아"){
            mapXY = [-13.759029, -172.104629]
        }
        if(searchname == "솔로몬제도"){
            mapXY = [-9.64571, 160.15619400000003]
        }
        if(searchname == "뉴질랜드"){
            mapXY = [-40.900557, 174.88597100000004]
        }
        if(searchname == "보스니아-헤르체고비나"){
            mapXY = [44.4489996, 18.16779109999993]
        }
        if(searchname == "잠비아"){
            mapXY = [-13.133897, 27.849332000000004]
        }
        if(searchname == "아르헨티나"){
            mapXY = [ -38.416097, -63.616671999999994]
        }
        if(searchname == "에콰도르"){
            mapXY = [-1.831239, -78.18340599999999]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maploaction()
        
        let initialLocation = CLLocation(latitude: mapXY[0], longitude: mapXY[1])
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
