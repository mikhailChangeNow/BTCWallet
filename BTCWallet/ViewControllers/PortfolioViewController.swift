//
//  PortfolioViewController.swift
//  BTCWallet
//
//  Created by Alexander Kovzhut on 19.03.2022.
//

import UIKit

class PortfolioViewController: UIViewController {
    // MARK: - Private properties
    private let titleLabel = UILabel()
    private let contentView = UIView()
    private let tableView = UITableView()
    private let addButton = UIButton()
    
    // MARK: - Public properties
    public var wallet = [Wallet]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        setup()
        setNavigationBar()
        setStyle()
        setLayout()
        addWalletPropertyToTableView()
    }
}
    // MARK: - Private Methods
extension PortfolioViewController {
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setNavigationBar() {
        titleLabel.text = "Portfolio"
        titleLabel.font = .systemFont(ofSize: 20, weight: .light)
        navigationItem.titleView = titleLabel
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(WalletTableViewCell.self, forCellReuseIdentifier: WalletTableViewCell.identifier)
        tableView.rowHeight = 95
        tableView.separatorStyle = .none
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Add Wallet", for: .normal)
        addButton.backgroundColor = .systemGreen
        addButton.layer.cornerRadius = 18
        addButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private func setLayout() {
        view.addSubview(contentView)
        contentView.addSubview(tableView)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -24),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3.5 / 4),
            addButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
    private func addWalletPropertyToTableView() {
        wallet.append(contentsOf: [
                Wallet(walletAddress: "bc1qdty3ms6psftl63nyk5wvnz7yz8vmuy87fcpn3kw7ecuuwe83j76sl0f9x4", walletAmount: "0.00 BTC"),
                Wallet(walletAddress: "bc1qdty3ms6psftl63nyk5wvnz7yz8vmuy87fcpn3kw7ecuuwe83j76sl0f9x4", walletAmount: "0.00 BTC")
            ])
        }
}

    // MARK: - TableView Data Source
extension PortfolioViewController: UITableViewDataSource {
    // Configure row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wallet.count
    }

    // Configure cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wallet = wallet[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WalletTableViewCell.identifier, for: indexPath) as! WalletTableViewCell
        
        cell.selectionStyle = .none
        cell.configure(with: wallet)
          
        return cell
    }
}

    // MARK: - TableView Delegate
extension PortfolioViewController: UITableViewDelegate {
    // Configure select cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
