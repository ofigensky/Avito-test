//
//  ViewController.swift
//  Avito test
//
//  Created by Gleb Glushok on 22.08.2022.


import UIKit

class MainViewController: UIViewController {
    
    var avito: Avito? // модель парсинга для данных

    private let employeesTable: UITableView = { // инициализация таблицы и регистрация ячейки
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseJSON()
        view.addSubview(employeesTable)
        employeesTable.frame = view.bounds
        employeesTable.delegate = self
        employeesTable.dataSource = self
    }
    
    private func parseJSON() {
        
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else { return }
        
        do {
            let jsonData = try Data(contentsOf: url)
            avito = try JSONDecoder().decode(Avito.self, from: jsonData)
            
        } catch {
            print(error)
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // количество ячеек равняется количеству работников
        if let avito = avito {
            return avito.company.employees.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // наполнение ячейки данными и сортировка по алфавиту
        let model = avito?.company.employees.sorted(by: { $0.name < $1.name })[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Name: \(model!.name) \nTel.num: \(model!.phoneNumber) \nSkills: \(model!.skills.joined(separator: ", "))"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let companyName = avito?.company.name else { return "" }
        return "Company name: \(companyName)"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .center
    }
}
