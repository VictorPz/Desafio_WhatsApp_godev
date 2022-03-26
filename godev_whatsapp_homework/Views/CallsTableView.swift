//
//  CallsTableView.swift
//  godev_whatsapp_homework
//
//  Created by Victor Pizetta on 25/03/22.
//

import UIKit

class CallsTableView: UIView {
        
    var person1 = [Person(name: "Whatsapp", description: "Hello! Welcome to Whatsapp", image: "person1"), Person(name: "Whatsapp", description: "Hello! Welcome to Whatsapp", image: "person1")]
    
    //MARK: - Components
    
            lazy var tableView: UITableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(CustomCallsTableViewCell.self, forCellReuseIdentifier: CustomCallsTableViewCell.identifier)
            tableView.dataSource = self
            return tableView
        }()
    
    //MARK: - Init
    
        init() {
            super.init(frame: .zero)
            tableView.reloadData()
            tableView.showsVerticalScrollIndicator = false
            tableView.dataSource = self
            setupView()
}
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    //MARK: - Protocols

extension CallsTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person1.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCallsTableViewCell.identifier, for: indexPath) as? CustomCallsTableViewCell else {return UITableViewCell()}
        let person = person1[indexPath.row]
        cell.setup(name: person.name, preview: person.description, image: person.image)
        return cell
    }
}

extension CallsTableView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}
