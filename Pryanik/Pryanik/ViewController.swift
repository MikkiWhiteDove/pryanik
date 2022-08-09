//
//  ViewController.swift
//  Pryanik
//
//  Created by Mishana on 07.08.2022.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    
//    override init(frame: CGRect) {
//        super
//    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//            self.init(frame: )
            
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCells()
//        setupCollection()
    }
    func setupCollection() {
        let layout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView()
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        
        collectionView.register(HZCollectionViewCell.self, forCellWithReuseIdentifier: HZCollectionViewCell.reuseId)
        
        view.addSubview(collectionView)
    }
    
    
    private func registerCells() {
        collectionView.register(UINib(nibName: HZCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: HZCollectionViewCell.reuseId)
    
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HZCollectionViewCell.reuseId, for: indexPath) as! HZCollectionViewCell
        let label = "foifefe"
        cell.data.text = label
        return cell
    }
    
    
}

