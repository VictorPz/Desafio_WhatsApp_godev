//
//  CustomCallsTableViewCell.swift
//  godev_whatsapp_homework
//
//  Created by Victor Pizetta on 25/03/22.
//

import UIKit

protocol action {
    
}

class CustomCallsTableViewCell: UITableViewCell {
    
    //MARK: - Components
    
    static let identifier = "CustomCallsTableViewCell"
    
    private lazy var verticalStack: UIStackView = {
        let stack  = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.contentMode = .top
        stack.spacing = 8
        stack.axis = .vertical
        return stack
    }()
        
    private lazy var personName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    private lazy var chatPreview: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textColor = UIColor.black
        description.numberOfLines = 0
        description.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return description
    }()
    
    private lazy var whatsImage: UIImageView = {
        let chatImage = UIImageView()
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        chatImage.contentMode = .scaleAspectFill
        return chatImage
    }()
    
    func setup(name: String, preview: String, image: String) {
        personName.text = name
        chatPreview.text = preview
        whatsImage.image = UIImage(named: image)
        whatsImage.layer.masksToBounds = true
        whatsImage.layer.cornerRadius = 30
    }
    
    
    //MARK: - Inicialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomCallsTableViewCell: ViewCodable {
    
    func buildHierarchy() {
        addSubview(whatsImage)
        
        verticalStack.addArrangedSubview(personName)
        verticalStack.addArrangedSubview(chatPreview)
        
        addSubview(verticalStack)
        
    }
    
    func setupConstraints() {
        
        whatsImage.layer.cornerRadius = whatsImage.layer.frame.width / 2
        
        NSLayoutConstraint.activate([
            whatsImage.heightAnchor.constraint(equalToConstant: 60),
            whatsImage.widthAnchor.constraint(equalToConstant: 60),
            whatsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            whatsImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        
            verticalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            verticalStack.leadingAnchor.constraint(equalTo: whatsImage.trailingAnchor, constant: 10),
            verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            verticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35)
        ])
    }
}
