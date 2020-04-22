//
//  ViewController.swift
//  lamp
//
//  Created by hallym-de1111 on 2019. 10. 2..
//  Copyright © 2019년 Hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    var isLampOn = true
    @IBOutlet var lampImg: UIImageView!
    @IBOutlet var lampNew: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnLampOn(_ sender: UIButton) { // 켜기 버튼을 눌렀을때의 액션함수
        if(isLampOn == true){ //램프가 켜진것 이라면
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle:  UIAlertControllerStyle.alert) // 경고라는 제목의 현제 on상태라는 메시지 출력
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler: nil)
            lampOnAlert.addAction(onAction) // 램프 켜기를 누르면 네 알겠습니다 라는 제목의 일반 스타일의 문구 출력
            present(lampOnAlert, animated: true, completion: nil)
        }
        else {
            let lampOnAlert = UIAlertController(title: "경고", message: "해당버튼을 사용할 수 없습니다.", preferredStyle: UIAlertControllerStyle.alert) // 램프가 켜져 있는 상태에서 다시 한번 켜기를 누르게 되면 경고문구 출력
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler: nil)
            lampOnAlert.addAction(onAction) // 스타일 일반형태로 출력
            present(lampOnAlert, animated: true,completion:  nil)
        }
    }
    @IBAction func btnLampOff(_ sender: UIButton) { // 끄기 버튼 액션함수
        if (isLampOn == false) { // 램프가 꺼져있다면
            let lampOffAlert = UIAlertController(title : "램프끄기" , message: "램프르 끄시겠습니까?", preferredStyle: UIAlertControllerStyle.alert) // 끄기 버튼을 눌렸을때 램프끄기 제목의 램프를끄시겠습니까 메세지 출력
            
            let offAction = UIAlertAction(title: "네", style: UIAlertActionStyle.default, handler: { ACTION in self.lampImg.image = self.imgOff // 끄기 버튼을 누르면 default스타일의 이미지로 출력 후 꺼진 램프이미지 출력
                self.isLampOn=false // 램프가 켜져있는것에대한 false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertActionStyle.default, handler: nil)
            // 아니오를 선택했을때 아무반응을 일으키지 않는 handler nil값 설정
            
            lampOffAlert.addAction(offAction) // off액션
            lampOffAlert.addAction(cancelAction) // cancel액션
            
            present(lampOffAlert, animated: true, completion: nil)
        } else {
            let lampOffAlert = UIAlertController(title: "경고", message: "해당버튼을 사용할 수 없습니다.", preferredStyle: UIAlertControllerStyle.alert) // 램프가 꺼져있음에도 불구하고 끄기 버튼을 눌렀을시 경고문 출력
            let offAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler: nil)
            lampOffAlert.addAction(offAction)
            present(lampOffAlert, animated: true,completion:  nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) { // 제거 버튼 액션함수
        
        if(sender.currentTitle! == "제거"){ // sender가 제거 상태라면
            
        let lampRemoveAlert = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertControllerStyle.alert) // 램프 제거버튼을 눌렸을때 나타나는 문구
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).",style: UIAlertActionStyle.default, handler: {
            ACTION in self.lampImg.image = self.imgOff // 전구를 제거 버튼을 누른 후 나타나는 문구에 아니오 끕니다의 스타일을 default로하고 handler를 램프가 꺼진 이미지로 출력
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertActionStyle.default) {
            ACTION in self.lampImg.image = self.imgOn // 마찬가지로 아니오 켭니다를 눌렀을 경우 handler를 램프가 켜진 이미지로 출력
            self.isLampOn = true
    }
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertActionStyle.destructive, handler: { ACTION in self.lampImg.image = self.imgRemove // handler를 제거 이미지로 출력
            self.isLampOn = false
        })
        let cancelAction = UIAlertAction(title: "취소(cancel)",style: UIAlertActionStyle.default, handler: nil)
            // 취소 버튼을 눌렸을 경우 handler를 아무 반응 없는 nil로 설정
    
        if (sender.currentTitle! == "제거") { // 현제 제거 상태일때
            sender.setTitle("생성", for: UIControlState.normal) // 생성을 다시 변경
            self.lampImg.image = imgOn // 이미지가 켜진 이미지 생성
        }
    
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        lampRemoveAlert.addAction(cancelAction)
        present(lampRemoveAlert, animated: true, completion: nil)
        } else {
            let lampNewAlert = UIAlertController(title: "램프생성", message: "램프를 생성하시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
            
            let newCreate = UIAlertAction(title: "네,생성합니다(create)",style:UIAlertActionStyle.default, handler: { ACTION in self.lampImg.image = self.imgOn
                self.isLampOn = true
                if (sender.currentTitle! == "생성"){
                    sender.setTitle("제거", for: UIControlState.normal)
                    self.lampImg.image = self.imgOn
                }
            })
            let cancelAction = UIAlertAction(title: "취소(cancel)",style: UIAlertActionStyle.default, handler: nil)
            
            lampNewAlert.addAction(newCreate)
            lampNewAlert.addAction(cancelAction)
            present(lampNewAlert, animated: true, completion: nil)
        }
    }

}


