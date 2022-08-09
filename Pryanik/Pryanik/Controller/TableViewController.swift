//
//  TableViewController.swift
//  Pryanik
//
//  Created by Mishana on 08.08.2022.
//

import UIKit

class TableViewController: UIViewController {

    var tableView = UITableView()
    var api = ApiRequest()
    
    private var new = [Data]() {
        didSet {
            tableView.reloadData()
        }
    }
    var model: ApiRequest? {
        didSet {
    
            model?.pryaniky = { [weak self] obj in
                self?.new = obj
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "smfoif"
        configureTableView()
        get()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        //set delegste
        setTableViewDelegate()
        // set new height
        tableView.rowHeight = 180
        // register cells
        tableView.register(HZTableViewCell.self, forCellReuseIdentifier: HZTableViewCell.reuseId)
        tableView.register(PictureTableViewCell.self, forCellReuseIdentifier: PictureTableViewCell.reuseId)
        tableView.register(SelectorTableViewCell.self, forCellReuseIdentifier: SelectorTableViewCell.reuseId)
        // set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return new.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch new[indexPath.row].name {
        case .hz:
            let cell = tableView.dequeueReusableCell(withIdentifier: HZTableViewCell.reuseId) as! HZTableViewCell
            let data = new[indexPath.row].data
            cell.set(data: data)
            return cell
        case .picture:
            let cell = tableView.dequeueReusableCell(withIdentifier: PictureTableViewCell.reuseId) as! PictureTableViewCell
            let data = new[indexPath.row].data
            cell.set(data: data)
            return cell
        case .selector:
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectorTableViewCell.reuseId) as! SelectorTableViewCell
            guard let dataVariants = new[indexPath.row].data.variants else { return UITableViewCell() }
            dataVariants.forEach{data in                cell.set(data: data)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        alert(data: new[indexPath.row].name.rawValue)
    }
}

extension TableViewController {
    
    func get() {
        DispatchQueue.main.async {
            self.api.getData { [weak self] data in
                guard let newData =  data else {return}
                self?.new = newData
            }
       }
    }
    
    func alert(data: String) {
        let alert = UIAlertController(title: data, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
