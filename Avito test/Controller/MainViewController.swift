//
//  ViewController.swift
//  Avito test
//
//  Created by Gleb Glushok on 22.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var employee: [Employee] = [Employee]()
    
    private let employeesTable: UITableView = {
        let table = UITableView()
        table.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(employeesTable)
        employeesTable.delegate = self
        employeesTable.dataSource = self
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
