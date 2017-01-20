//
//  CurrencyCell.swift
//  hwanewul
//
//  Created by Naver on 2016. 10. 23..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet fileprivate weak var countryThumbnailImageView: UIImageView?
    @IBOutlet fileprivate weak var currencyCodeLabel: UILabel?
    @IBOutlet fileprivate weak var currencyLabel: UILabel?
    @IBOutlet fileprivate weak var currencyDescriptionLabel: UILabel?

    var rate: Rate? {
        didSet {
            updateUI()
        }
    }
}

extension CurrencyCell {

    func updateUI() {
        //TODO: 이미지처리
        currencyCodeLabel?.text = rate?.currencyCode ?? ""
        currencyLabel?.text = "\(rate?.rate ?? 0.0)"
        //TODO: 설명라벨처리
    }
}
