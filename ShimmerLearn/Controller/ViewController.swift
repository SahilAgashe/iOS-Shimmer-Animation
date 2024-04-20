//
//  ViewController.swift
//  ShimmerLearn
//
//  Created by SAHIL AMRUT AGASHE on 14/04/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    private let games = [
                Game("Roman Reings", "1316"),
                Game("Dean Ambrose", "500"),
                Game("Seth Rollins", "400")
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
        tableView.register(SkeletonCell.self, forCellReuseIdentifier: skeletonCellId)
        return tableView
    }()
    
    private lazy var loadButtonItem: UIBarButtonItem = {
            let barButtonItem = UIBarButtonItem(title: "Load", style: .plain, target: self, action: #selector(loadTapped))
            return barButtonItem
    }()
    
    private var loaded = false {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let cellId = "cellId"
    private let skeletonCellId = "skeletonCellId"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Selectors
    @objc func loadTapped() {
        loaded.toggle()
    }

    // MARK: - Helpers
    private func setup() {
        navigationItem.title = "Practical Table Shimmer Effect"
        navigationItem.rightBarButtonItem = loadButtonItem
        view = tableView
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if loaded {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
            cell.game = games[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: skeletonCellId, for: indexPath) as! SkeletonCell
            cell.game = games[indexPath.row]
            return cell
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
}

// MARK: - Game
struct Game {
    let title: String
    let year: String
    init(_ name: String, _ year: String) {
        self.title = name
        self.year = year
    }
}
