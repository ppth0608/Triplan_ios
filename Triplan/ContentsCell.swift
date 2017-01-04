//
//  ContentsCell.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 27..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

protocol ContentsCell {
    
    var contents: CellPresentable? { get set }
}

extension UITableViewCell: ContentsCell {
    
    var contents: CellPresentable? {
        set {
            object = newValue
            셀UI갱신()
        }
        get {
            return object
        }
    }
    
    func 셀UI갱신() {
        // noop
    }
}

extension UICollectionViewCell: ContentsCell {
        
    var contents: CellPresentable? {
        set {
            object = newValue
            셀UI갱신()
        }
        get {
            return object
        }
    }
    
    func 셀UI갱신() {
        // noop
    }
}
