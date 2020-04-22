//
//  ViewController.swift
//  map
//
//  Created by 한림1111 on 2019. 10. 30..
//  Copyright © 2019년 baehongjun. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 추적하기위해 사용자에게 승인을 요구하는 함수
        locationManager.startUpdatingLocation() // 위치 업데이트 시작함수
        myMap.showsUserLocation = true // 위치 보기 값을 true로 설정
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func goLocation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) // 지정된 위치와 관련된 위도와 경도를 반환
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 지도 영역의 넓이 와 높이
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) // 특정 위도와 경도를 중심으로하는 직사각형 지리적 영역.
        
        myMap.setRegion(pRegion, animated: true) // 현재 표시되는 영역을 변경하고 필요에 따라 새 영역을 보고 싶을 경우 animate를 true로 한다.
        return pLocation
    }
    func setAnnotation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double, title strTitle : String,
                       subtitle strSubtitle : String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        
        annotation.title = strTitle //제목
        annotation.subtitle = strSubtitle //부재목
        myMap.addAnnotation(annotation)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        let pLocation = locations.last // 마지막 위치 값을 저장
        
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        // 마지막 위치의 경도 위도 값을 가지고 goLocation함수 호출, dalta 0.01은 지도를 100배 확대의미
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: { (placemarks, error) -> Void in
            let pm = placemarks!.first // 첫 부분만 대입
            let country = pm!.country //  나라 값을 대입
            var address:String = country! // 나라ㅏ 값을 문자열에 대입
            if pm!.locality != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address // 도로 값 추가 대입
        })
        locationManager.stopUpdatingLocation() // 마지막으로 위치가 업데이트 되는 것을 멈추게 하는 함수
    }
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // 세그먼트의 0번째 인덱덱스를 눌렀을 때
            // 위도 경도 값을 설정하여 그 위치로 이동후 레이블에 해당위치 이름 출력
            setAnnotation(latitudeValue: 37.600755, longitudeValue: 127.068118, delta: 1, title: "쌍용아파트", subtitle: "서울특별시 동대문구 한천로 58길 47")
            self.lblLocationInfo1.text = "보고 계산 위치"
            self.lblLocationInfo2.text = "우리집"
        } else if sender.selectedSegmentIndex == 1 { // 세그먼트의 1번째 인덱스를 눌렸을 때
            // 설정된 위도 경도 값의 위치로 이동 후 레이블에 해당 위치 이름 출력
            setAnnotation(latitudeValue: 37.8862292, longitudeValue: 127.7377722, delta: 1, title: "한림대학교", subtitle: "강원도 춘천시 옥천동 한림대학길 1")
            self.lblLocationInfo1.text = "보고 계산 위치"
            self.lblLocationInfo2.text = "한림대학교"
        }
        else if sender.selectedSegmentIndex == 2 { // 세그먼트의 2번째 인덱스를 눌렸을 때
            // 설정된 위도 경도 값의 위치로 이동 후 레이블에 해당 위치 이름 출력
            setAnnotation(latitudeValue: 37.448609, longitudeValue: 126.453264, delta: 1, title: "인천공항", subtitle: "인천광역시 운서동")
            self.lblLocationInfo1.text = "보고 계산 위치"
            self.lblLocationInfo2.text = "인천공항"        }
    }
    

}

