//
//  ViewController.swift
//  Avito test
//
//  Created by Gleb Glushok on 22.08.2022.


import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var avito: Avito?
    
    private let employeesTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        parseJSON()
        view.addSubview(employeesTable)
        employeesTable.frame = view.bounds
        employeesTable.delegate = self
        employeesTable.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let avito = avito {
            return avito.company.employees.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = avito?.company.employees[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Name: \(model!.name) , Tel.num: \(model!.phoneNumber), \nSkills: \(model!.skills)"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return avito?.company.name
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


