//
//  ChantsViewController.swift
//  FootballChants
//
//  Created by ByteDance on 23/5/25.
//

import UIKit

class ChantsViewController: UIViewController {
    // what mark does is to create section in the code for developer to find the section easier
    // MARK: -UI
    
    // lazy allow the component to compile and load only when needed, helps with build time
    private lazy var tableVw: UITableView = {
        // creating a table view
        let tv = UITableView()
        // this is very important. i need this to set my auto layout
        // It controls whether the view’s autoresizing mask is translated into Auto Layout constraints automatically
        // You disable automatic conversion of autoresizing masks into constraints.
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        // size of the cell is dynamic
        tv.rowHeight = UITableView.automaticDimension
        // min height of the row
        tv.estimatedRowHeight = 44
        // do not like any line in between the rows(cell)
        tv.separatorStyle = .none
//        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tv
    }()
    
    private lazy var teamsViewModel: TeamsViewModel = TeamsViewModel()
    private lazy var audioManagerViewModel: AudioManagerViewModel = AudioManagerViewModel()
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
    }


}


private extension ChantsViewController {
    func setup() {
        self.navigationController?.navigationBar.topItem?.title = "Football chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // adding the data to the table
        tableVw.dataSource = self
        tableVw.delegate = self
        // adding tableVw to view
        self.view.addSubview(tableVw)
        NSLayoutConstraint.activate([
            tableVw.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableVw.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableVw.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableVw.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}


// MARK: - UITableViewDataSource
extension ChantsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsViewModel.teams.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // `indexPath.row` is an integer representing the current row number of the table view cell being requested.
        let team = teamsViewModel.teams[indexPath.row]

        
        // Dequeue a reusable cell or create a new one
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId) as! TeamTableViewCell
        cell.configure(with: team, delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Someone tapped on row \(indexPath.row)")
    }
}

extension ChantsViewController: TeamTableViewCellDelegate {
    func didTapPlayback(for team: Team) {
        audioManagerViewModel.playback(team)
        teamsViewModel.togglePlayback(for: team)
        tableVw.reloadData()
        print("The item that was selected is \(team.name)")
    }
}
