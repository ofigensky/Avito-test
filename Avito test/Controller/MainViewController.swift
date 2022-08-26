//
//  ViewController.swift
//  Avito test
//
//  Created by Gleb Glushok on 22.08.2022.
// https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c

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
        view.addSubview(employeesTable)
        employeesTable.frame = view.bounds
        employeesTable.delegate = self
        employeesTable.dataSource = self
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
        
        APICaller.shared.getData { result in
            switch result {
            case .success(let result):
                print(result)
            case.failure(let error):
                print(error.localizedDescription)
            }

        }
    return cell
    }
}
