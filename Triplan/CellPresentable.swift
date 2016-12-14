//
//  CellPresentable.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

// CellPresentable
protocol CellPresentable {
    
    var cellIndentifier: String { get }
    static var cellHeight: CGFloat { get }
}

extension CellPresentable {
    
    var cellIndentifier: String {
        return String(describing: Self.self)
    }
}

// TableViewCellPresentable
protocol TableViewCellPresentable: CellPresentable {
    
    func cell(from tableView: UITableView, with indexPath: IndexPath) -> UITableViewCell
    func updateUI(with cell: UITableViewCell, contents: Self)
}

extension TableViewCellPresentable {
    
    func cell<T: UITableViewCell>(from tableView: UITableView, with indexPath: IndexPath) -> T {
        return tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! T
    }
}

// CollectionViewCellPresentable
protocol CollectionViewCellPresentable: CellPresentable {
    
    static var cellWidth: CGFloat { get }
    
    func cell(from collectionView: UICollectionView, with indexPath: IndexPath) -> UICollectionViewCell
    func updateUI(with cell: UICollectionViewCell, contents: Self)
}

extension CollectionViewCellPresentable {
    
    func cell<T: UICollectionViewCell>(from collectionView: UICollectionView, with indexPath: IndexPath) -> T {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath) as! T
    }
}
