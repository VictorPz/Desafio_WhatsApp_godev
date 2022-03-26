//
//  ChatsViewController.swift
//  godev_whatsapp_homework
//
//  Created by Victor Pizetta on 25/03/22.
//

import UIKit

class ChatsViewController: UIViewController {
    
    let tableView = CallsTableView()
    let searchBar: UISearchBar = UISearchBar()
    
    override func loadView() {
        super.view = self.tableView
        delegates()
    }
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(contactsNavigate))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
        tableView.tableView.register(ChatsHeader.self, forHeaderFooterViewReuseIdentifier: ChatsHeader.identifier)
        navBar()
    }
    
    @objc func contactsNavigate() {
        let contacts = ContactsViewController()
        present(contacts, animated: true, completion: nil)
    }
    
    func navBar() {
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        tableView.tableView.tableHeaderView = searchBar
    }
    
    func delegates() {
        tableView.tableView.delegate = self
    }
}

extension ChatsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ChatsHeader.identifier) as? ChatsHeader else {return UIView()}
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ChatContentViewController(), animated: true)
    }
}
