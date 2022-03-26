//
//  ChatsHeader.swift
//  godev_whatsapp_homework
//
//  Created by Victor Pizetta on 26/03/22.
//

import UIKit

class ChatsHeader: UITableViewHeaderFooterView {

    static let identifier = "ChatsHeader"
    
    lazy var broadcastList: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New Group", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    lazy var newGroupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Broadcast List", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatsHeader: ViewCodable {
    
    func buildHierarchy() {
        addSubview(newGroupButton)
        addSubview(broadcastList)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            broadcastList.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            broadcastList.heightAnchor.constraint(equalToConstant: 20),
            
            newGroupButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            newGroupButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
