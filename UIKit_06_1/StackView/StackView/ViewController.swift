//
//  ViewController.swift
//  StackView
//
//  Created by 김혜림 on 5/20/24.
//

//실습1: VStack, HStack
import UIKit

class ViewController: UIViewController {
    
    let toggleSwitch = UISwitch()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //뷰 생성
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .systemBlue
        
        let topLabel = UILabel()
        topLabel.text = "위"
        topLabel.textAlignment = .center
        topLabel.backgroundColor = .lightGray
        
        let leftLabel = UILabel()
        leftLabel.text = "왼쪽"
        leftLabel.textAlignment = .center
        leftLabel.backgroundColor = .lightGray
        
        let rightLabel = UILabel()
        rightLabel.text = "오른쪽"
        rightLabel.textAlignment = .center
        rightLabel.backgroundColor = .lightGray
        
        let hStackView = UIStackView(arrangedSubviews: [leftLabel, rightLabel])
        hStackView.axis = .horizontal
        hStackView.spacing = 10
        
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(hStackView)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

