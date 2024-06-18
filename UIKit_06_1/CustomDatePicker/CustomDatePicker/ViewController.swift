//
//  ViewController.swift
//  CustomDatePicker
//
//  Created by 김혜림 on 5/22/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private lazy var datePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        return picker
    }()
    
    // 연월일 범위 정수형 배열로 생성
    let years = [Int](2000...2050)
    let months = [Int](1...12)
    let days = [Int](1...31)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    //MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //스피너 개수 설정
        switch component {
        case 0:
            return years.count
        case 1:
            return months.count
        case 2:
            return days.count
        default:
            return 0
        }
    }
    
    
    //MARK: - UIPickerViewDelegate
    func pickerView(_ pickerVIew: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //연월일을 받아서 문자로 변환
        switch component {
        case 0:
            return String(describing: years[row])
        case 1:
            return String(describing: months[row])
        case 2:
            return String(describing: days[row])
        default:
            return nil
        }
    }


}

