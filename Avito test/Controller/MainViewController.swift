//
//  ViewController.swift
//  Avito test
//
//  Created by Gleb Glushok on 22.08.2022.


import UIKit

class MainViewController: UIViewController {
    
    private var employees: [Employee] = [Employee]()
    
    private let employeesTable: UITableView = {
        let table = UITableView()
        table.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        APICaller.shared.parseJSON()
    }
}

