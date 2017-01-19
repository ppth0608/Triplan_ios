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
    // 테이블뷰 또는 컬렉션뷰의 cell로 표현될 수 있는 객체들의 프로토콜
    static var cellHeight: CGFloat { get }
}

extension CellPresentable {

    var cellIndentifier: String {
        return String(describing: Self.self)
    }

    func 셀컨텐츠세팅(with cell: ContentsCell) {
        var customCell = cell
        customCell.contents = self
    }
}

protocol TableViewCellPresentable: CellPresentable { }

extension TableViewCellPresentable {

    func cell<T: UITableViewCell>(from tableView: UITableView, with indexPath: IndexPath) -> T {
        return tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! T
    }
}

protocol CollectionViewCellPresentable: CellPresentable {

    static var cellWidth: CGFloat { get }
}

extension CollectionViewCellPresentable {

    func cell<T: UICollectionViewCell>(from collectionView: UICollectionView, with indexPath: IndexPath) -> T {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath) as! T
    }
}
