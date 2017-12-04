//
//  ViewController.swift
//  QYPCollectionView
//
//  Created by Apple on 2017/12/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class ViewController: QYPCollectionViewController {
    override func viewDidLoad() {
        var arr = [UIImage]()
        guard let image = UIImage(named: "465974A6-3838-4756-B0F5-853C0F36AF56") else {
            return
        }
        arr.append(image)
        dataSource = arr
        super.viewDidLoad()
    }
}


