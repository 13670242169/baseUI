//
//  QYPCollectionViewController.swift
//  QYPCollectionView
//
//  Created by Apple on 2017/12/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
let sw = UIScreen.main.bounds.size.width
let sh = UIScreen.main.bounds.size.height
class QYPCollectionViewController: UIViewController {
    var dataSource:[UIImage]?
    lazy var layout:UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (sw - 30)/2, height: (sw - 30)/2 * 1.2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return layout
    }()
    lazy var collectionView:UICollectionView = {
        let rect = CGRect(x: 0, y: 0, width: sw, height: sh)
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "QYPCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QYPCollectionViewCell")
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)

    }
}
extension QYPCollectionViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = dataSource?.count else {
            return 0
        }
        return count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QYPCollectionViewCell", for: indexPath)as! QYPCollectionViewCell
        cell.backgroundColor = UIColor.red
        return cell
    }
}
