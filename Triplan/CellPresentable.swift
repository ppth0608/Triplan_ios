//
//  CellPresentable.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

protocol CellPresentable {
    
    var cellIndentifier: String { get }
    static var cellHeight: CGFloat { get }
}

protocol TableViewCellPresentable: CellPresentable {
    
    func cell(from tableView: UITableView, with indexPath: IndexPath) -> UITableViewCell
    func updateUI(with cell: UITableViewCell, contents: Self)
}

protocol CollectionViewCellPresentable: CellPresentable {
    
    static var cellWidth: CGFloat { get }
    
    func cell(from collectionView: UICollectionView, with indexPath: IndexPath) -> UICollectionViewCell
    func updateUI(with cell: UICollectionViewCell, contents: Self)
}
