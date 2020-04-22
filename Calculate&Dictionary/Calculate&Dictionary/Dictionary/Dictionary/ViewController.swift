//
//  ViewController.swift
//  Dictionary
//
//  Created by hallym-de1111 on 2019. 9. 25..
//  Copyright © 2019년 Hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Dic = [1:["A","B"]] // 1을 검색시 A,B출력
    var Dic2 : [Int : [String]] = [:] // 정수형으로 검색시 문자형으로 내보내는 변수
    var Dic3 = [1:["AAA":"BBB"]] // 1을 key값으로 가지고 또 그 안에 AAA를 key값으로 가지고 BBB를 value로 가진 변수
    var Dic4 = ["김동영":["주소":"1211","전화번호":"010-1111-1111"]] // 김동영을 검색하면 주소화 전화번호를 검색할 수있게 히는 변수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Dic[2] = ["C","D"] // Dic의 dictionary에 2번째 리스트의 값을 C,D로 변경
        for (DicKey, DicValue) in Dic{
            NSLog("DicKey : "+String(DicKey)+", DicValue : "+DicValue[0]+DicValue[1])
        }
        
        Dic2[1] = ["CC","DD"]
        Dic2[2] = ["KK","ZZ"]
        Dic2[3] = ["HHH","AAA"]
        Dic2.updateValue(["DDDD","ZZZZZ"],forKey: 2)
        for (DicKey, DicValue) in Dic2{
            NSLog("DicKey : "+String(DicKey)+", DicValue: "+DicValue[0]+", "+DicValue[1])
        }
        NSLog("Dic3[1] value's key : "+String(Dic3[1]!.keys.randomElement()!)+"Dic3[1] value's value : "+String(Dic3[1].values.randomElement()!)) // keys.randomElenent는 랜덤하게 key값을 가져오게된다. 그러나 Dic3의 key값은AAA밖에 없기 때문에 AAA를 가져오게 된다. 마찬가지로 values.randomElement는 랜덤하게 value값을 출력하게 되는데 Dic3의 1번째 인덱스에는 BBB밖에 없기 때문에 BBB가 나오게 된다.
        NSLog("Dic4[key]'s 주소 : "+Dic4["김동영"]!["주소"]!+" /Dic4[key]'s 전화번호 : "+Dic4["김동영"]!["전화번호"]!)
        // 김동영이라는 key값을 가져왔을 때, 주소와 전화번호가 출력되게 해준다.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

