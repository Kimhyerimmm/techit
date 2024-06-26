//
//  ViewController.swift
//  List
//
//  Created by 김혜림 on 5/22/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let items = ["고양이", "강아지", "새", "파충류", "물고기 "]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        //재사용 가능한 셀 만들기
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //재사용 가능한 셀에 디큐
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        var config = cell.defaultContentConfiguration()
        config.text = items[indexPath.row]
        cell.contentConfiguration = config
        
        return cell
    }


}

