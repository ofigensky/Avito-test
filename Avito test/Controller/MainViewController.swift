//
//  ViewController.swift
//  Avito test
//
//  Created by Gleb Glushok on 22.08.2022.


import UIKit

class MainViewController: UIViewController {
    
    var networkManager = NetworkManager()
    private var companyModel: CompanyModel? // модель парсинга для данных
    private lazy var employeesTable: UITableView = { // инициализация таблицы и регистрация ячейки
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(employeesTable)
        employeesTable.frame = view.bounds
        employeesTable.delegate = self
        employeesTable.dataSource = self
        
        initTableViewData()
    }
    
    private func initTableViewData() {
        networkManager.parseJSON { companyModel in
            self.companyModel = companyModel
            self.employeesTable.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // количество ячеек равняется количеству работников
        return companyModel?.company.employees.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = employeesTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        if let model = companyModel?.company.employees[indexPath.row] {
            cell.textLabel?.text = "Name: \(model.name) \nPhone: \(model.phoneNumber) \nSkills: \(model.skills.joined(separator: ", "))"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return companyModel?.company.name
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .center
    }
}
