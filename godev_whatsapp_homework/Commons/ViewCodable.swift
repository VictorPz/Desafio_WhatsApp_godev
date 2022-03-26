//
//  ViewCodable.swift
//  godev_whatsapp_homework
//
//  Created by Victor Pizetta on 25/03/22.
//

import UIKit

public protocol ViewCodable {

    func buildHierarchy()

    func setupConstraints()

    func applyAdditionalChanges()
}

public extension ViewCodable {

    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

    func buildHierarchy() {}

    func setupConstraints() {}

    func applyAdditionalChanges() {}
}
