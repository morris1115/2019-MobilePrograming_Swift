//
//  ViewController.swift
//  ImageView
//
//  Created by hallym-de1108 on 2019. 9. 4..
//  Copyright © 2019년 Hallym. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false
    var enOrDisable = false // 사용,제거 버튼 변수
    var imgOn: UIImage?
    var imgOff: UIImage?
    var imgRemove: UIImage? // 사용,제거 이미지
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var useornot: UIButton!
    @IBOutlet var swiOnOff: UISwitch! //스위치 온오프 아울렛변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgOn = UIImage(named: "lamp-on.png") // 램프 온 이미지
        imgOff = UIImage(named: "lamp-off.png") // 램프 오프 이미지
        imgRemove = UIImage(named: "lamp-remove.png") // 램프 제거 이미지
        
        imgView.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (isZoom) { // 확대했을시
            newWidth = imgView.frame.width/scale // 넓이와
            newHeight = imgView.frame.height/scale // 높이 조정
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            
            btnResize.setTitle("확대", for: .normal) // 버튼의 이름을 확대로 지정
        }
        else { // 그렇지 않은경우 ( 축소했을 시)
            newWidth = imgView.frame.width*scale // 넓이와
            newHeight = imgView.frame.height*scale // 높이 조정
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            
            btnResize.setTitle("축소", for: .normal) // 버튼의 이름을 축소로 지정
        }
        
        isZoom = !isZoom
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{ // 센더 메서드로  isOn일 때,
            imgView.image = imgOn // 이미지뷰로 이미지를 불러와 불켜진 전구 출력
        } else { // 그렇지 않은경우 Off일 떄,
            imgView.image = imgOff // 이미지뷰의 불꺼진 이미지를 불러와 출력
        }
    }
    @IBAction func useorremove(_ sender: UIButton) { // 사용, 제거 버튼 액션
        if (swiOnOff.isOn){ // 스위치가 켜져있는 상태에서 다시 사용버튼을 누르면
            imgView.image = imgOn // 켜진 전구 이미지 출력
        } else { // 꺼진 상태에서 사용버튼을 누르면
            imgView.image = imgOff // 꺼진 전구 이미지 출력
        }
        
        var newWidth: CGFloat, newHeight: CGFloat
        
        newWidth = imgView.frame.width
        newHeight = imgView.frame.height
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        if (enOrDisable) { // 사용 버튼을 눌러 사용중일 경우

            btnResize.isEnabled = true // 확대버튼 사용가능
            swiOnOff.isEnabled = true // 스위치 사용가능
            useornot.setTitle("사용", for: .normal)// 버튼 이름을 사용으로 지정
        }
        else { // 그렇지 않고 제거 버튼이라면
            imgView.image = imgRemove //제거 이미지 출력
            
            newWidth = imgView.frame.width
            newHeight = imgView.frame.height
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            
            btnResize.isEnabled = false // 확대버튼 사용불가
            swiOnOff.isEnabled = false // 스위치 버튼 사용불가
            useornot.setTitle("제거", for: .normal) //  버튼 이름을 제거로 지정
        }
        
        enOrDisable = !enOrDisable
    }
}

