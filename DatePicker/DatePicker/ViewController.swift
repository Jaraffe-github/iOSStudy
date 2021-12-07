//
//  ViewController.swift
//  DataPicker
//
//  Created by 최승민 on 2021/12/07.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmConfirmd = false
    var timeConfirmd: String = ""
    var alarmTime: String = ""
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        if alarmConfirmd {
            if timeConfirmd != formatter.string(from: date as Date) {
                alarmConfirmd = false
            }
        }
        
        if alarmConfirmd == false {
            if alarmTime == formatter.string(from: date as Date)
            {
                let alert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
                let confirmAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default) {
                    ACTION in self.alarmConfirmd = true
                    self.timeConfirmd = self.alarmTime
                }
                alert.addAction(confirmAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
}

