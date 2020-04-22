//
//  ViewController.swift
//  Cal
//
//  Created by hallym-de1111 on 2019. 9. 25..
//  Copyright © 2019년 Hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtCal: UITextField! // 계산 과정의 txtField
    @IBOutlet var txtVar: UITextField! // 계산 결과의 txtField
    var result :Int! // 계산 결과를 담기위한 변수
    var num1 : Int! // 연산을 하기위한 변수
    var num2 : Int! // 연산을 하기위한 변수
    var op : String! // 비교를 하기위한 변수
    var isInputNum : Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ButtonUpNum(_ sender: UIButton){ // 숫자를 눌렀을 때 눌린 숫자를 action할 action 변수
        var digit = sender.currentTitle! // 눌린 숫자를 sneder로 받아 digit에 저장한다.
        
        if(op == "" && result == 0){
            NSLog("txtVar : " + txtVar.text!)
            
            txtVar.text = txtVar.text! + digit
            txtCal.text = txtCal.text! + digit
        }
        else if(op == " " && result != 0){
            txtVar.text = txtVar.text! + digit
            txtCal.text = txtVar.text!
        }
        else {
            txtVar.text = txtVar.text! + digit
            txtCal.text = txtCal.text! + digit
        }
        
    }
    
    @IBAction func ButtonUpOperation(_ sender: UIButton){ // 사칙연산을 하기위한 변수
        let digit = sender.currentTitle
        if digit == "=" {
            num2 = 0
            if(txtVar.text! == ""){
                num2 = 0
            }
            else{
                num2 = Int(txtVar.text!)
            }
            NSLog("txtVar.text = " + txtVar.text!)
            if(num2 == 0) {
                result = num1
                txtVar.text = String(result)
                txtCal.text = ""
            }
            else {
                if(op == "+"){ // 덧셈 연산
                    result = num1 + num2 // 연산
                    txtVar.text = String(result) //txtVar에 출력
                    txtCal.text = ""
                }
                else if(op == "-") { // 뺄셈연산
                    result = num1 - num2 //연산
                    txtVar.text = String(result) // txtVar에 출력
                    txtCal.text = ""
                }
                else if(op == "x") { // 곱셈 연산
                    result = num1 * num2 // 연산
                    txtVar.text = String(result) //txtVar에 출력
                    txtCal.text = ""
                }
                else if(op == "/"){ // 나눗셈연산
                    result = num1 / num2 //연산
                    txtVar.text = String(result) // txtVar에 출력
                    txtCal.text = ""
                }
            }
            op = "" // 초기화
            num1 = 0 // 초기화
            num2 = 0 // 초기화
        }
        else {
            if(op == ""){
                op = digit // 연산자를 op에 추가
                num1 = Int(txtVar.text!)
                txtVar.text = ""
                txtCal.text = String(num1) + op
            }
            else {
                op = digit
                
                var txtNum = txtCal.text!
                let startIndex = txtNum.startIndex
                let endIndex = txtNum.index(before: txtNum.endIndex)
                let range = startIndex..<endIndex
                num1 = Int(txtNum[range])
                NSLog(String(txtNum))
                NSLog(String(num1))
                txtVar.text = nil
                txtCal.text = String(num1) + op
            }
        }
        
    }
    @IBAction func ButtonUpClear(_ sender: UIButton){ // C를 눌렀을 경우 모든 값 초기화
        txtVar.text = "" //초기화
        txtCal.text = "" //초기화
        num1 = 0 //초기화
        num2 = 0 //초기화
        op = "" //초기화
        result = 0 //초기화
        
    }
    @IBAction func ButtonUpCancel(_ sender: UIButton){ // 취소(<-) 버튼을 눌렀을 경우 변수
        if txtVar.text != "" {
            if(txtVar.text!.count >= 2){
                let upperBound1 = String.Index(encodedOffset: txtVar.text!.count-2)
                let text1 = txtVar.text![...upperBound1]
                NSLog(String(text1))
                txtVar.text = String(text1)
            }
            else {
                txtVar.text = nil
            }
            if(txtCal.text!.count >= 2) {
                let upperBound2 = String.Index(encodedOffset: txtCal.text!.count-2)
                let text2 = txtCal.text![...upperBound2]
                txtCal.text = String(text2)
            }
            else {
                txtCal.text = nil
            }
        }    }

}

