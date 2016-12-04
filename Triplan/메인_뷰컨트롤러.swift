//
//  메인뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 1..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class 메인_뷰컨트롤러: 공통_뷰컨트롤러 {
    
    @IBOutlet weak var 컬렉션뷰: UICollectionView!
    
    let 메인뷰모델 = 메인_뷰모델()
    let 컬렉션뷰데이터소스 = 메인_컬렉션뷰_데이터소스()
    let disposeBag = DisposeBag()
}

// MARK: - UIViewController
extension 메인_뷰컨트롤러 {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        네비게이션바세팅(타이틀: "Triplan")
        디폴트세팅()
        옵져버세팅()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
}

// MARK: - Private
extension 메인_뷰컨트롤러 {
    
    fileprivate func 디폴트세팅() {
        컬렉션뷰.dataSource = 컬렉션뷰데이터소스
    }
    
    fileprivate func 옵져버세팅() {
        메인뷰모델.여행정보목록?
            .asObservable()
            .subscribe { [weak self] _ in
                self?.컬렉션뷰.reloadData()
            }.addDisposableTo(disposeBag)
    }
}

// MARK: - Delegate
extension 메인_뷰컨트롤러: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 메인뷰모델.여행정보목록갯수() {
            let 뷰컨트롤러 = 여행추가_뷰컨트롤러.인스턴스
            show(뷰컨트롤러, sender: self)
        }
    }
}

