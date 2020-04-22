//
//  ViewController.swift
//  20155138_안춘모
//
//  Created by 한림1111 on 2019. 10. 23..
//  Copyright © 2019년 hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: UIWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.delegate = self as? UIWebViewDelegate
        loadWebPage("http://www.hallym.ac.kr") // loadWebPage함수 호출
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnGo(_ sender: UIButton) { // TextField에 url주소를 입력하면 입력한 주소로 이동
        let myUrl = checkUrl(txtUrl.text!) // check 함수 호출
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://smart.hallym.ac.kr") // 버튼 1을 누르면 한림대학교 스마트캠퍼스로 이동(loadWebPage함수 호출)
    }
    @IBAction func btnGoSite2(_ sender: UIButton) { // 버튼 2을 누르면 한림대 메일로 이동(loadWebPage 함수 호출)
        loadWebPage("http://mail.hallym.ac.kr")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) { // html버튼을 누르면 html형식의 페에지로 이동해 그 안에서 2sam을 클릭하면 웹페이지로 이동
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let myHtmlBundle = Bundle.main
        let filepath = myHtmlBundle.path(forResource: "htmlView", ofType: "html")
        loadWebPage(filepath!)
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) { // x(stop)버튼을 누르면 stopLoading을 호출해 중지
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) { // 되돌리기 버튼을 누르면 reload를 호출해 되돌림
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) { // 뒤로가기 버튼을 누르면 goBack을 호출해 뒤로감
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) { // 앞으로 가기 버튼을누르면 goForward를 호출해 앞으로 감
        myWebView.goForward()
    }
    func loadWebPage(_ url : String)
    {
        let myUrl = URL(string : url)
        let myRequest = URLRequest(url : myUrl!)
        myWebView.loadRequest(myRequest)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView)
    {
        myActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        myActivityIndicator.stopAnimating()
    }
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
}

