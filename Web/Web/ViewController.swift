//
//  ViewController.swift
//  Web
//
//  Created by 최승민 on 2021/12/07.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var mainWebView: WKWebView!
    @IBOutlet var mainActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let webUrl = URL(string:  url)
        let request = URLRequest(url: webUrl!)
        mainWebView.load(request)
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainWebView.navigationDelegate = self
        loadWebPage("https://scarlet-derby-10c.notion.site/Blog-d84b8b9381604112a3a75234c738a2c0")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        mainActivityIndicator.startAnimating()
        mainActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        mainActivityIndicator.stopAnimating()
        mainActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        mainActivityIndicator.stopAnimating()
        mainActivityIndicator.isHidden = true
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let webUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(webUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://scarlet-derby-10c.notion.site/Blog-d84b8b9381604112a3a75234c738a2c0")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://scarlet-derby-10c.notion.site/Profile-c23a6f88cf6a47c0bff11e773d0990be")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p> <p><a href=\"https://scarlet-derby-10c.notion.site/Blog-d84b8b9381604112a3a75234c738a2c0\">Blog</a>으로 이동</p>"
        mainWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let fileUrl = URL(fileURLWithPath: filePath!)
        let request = URLRequest(url: fileUrl)
        mainWebView.load(request)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        mainWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        mainWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        mainWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        mainWebView.goForward()
    }
}

