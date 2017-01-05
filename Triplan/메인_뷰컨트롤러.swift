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
import SwiftyUserDefaults

class 메인_뷰컨트롤러: 공통_네비게이션뷰컨트롤러 {
    
    @IBOutlet weak var 컬렉션뷰: UICollectionView!
    
    let 메인뷰모델 = 메인_뷰모델()
    let 컬렉션뷰데이터소스 = 메인_컬렉션뷰_데이터소스()
    let disposeBag = DisposeBag()
    
    deinit {
        NSLog("deinit -- 메인_뷰컨트롤러")
    }
}

// MARK: - UIViewController
extension 메인_뷰컨트롤러 {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        디폴트세팅()
        옵져버세팅()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func 네비게이션바세팅() {
        title = "Triplan"
    }
}

// MARK: - Private
extension 메인_뷰컨트롤러 {
    
    func 디폴트세팅() {
        컬렉션뷰.dataSource = 컬렉션뷰데이터소스
    }
    
    func 옵져버세팅() {
        메인뷰모델.여행정보목록감시자?
            .subscribe { [weak self] _ in
                self?.컬렉션뷰.reloadData()
            }
            .addDisposableTo(disposeBag)
        
        메인뷰모델.여행정보목록업데이트감시자?
            .subscribe { [weak self] _ in
                self?.알림창표시(메세지: "여행을 추가하였습니다!")
            }
            .addDisposableTo(disposeBag)
    }
}

// MARK: - Delegate
extension 메인_뷰컨트롤러: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let 선택된인덱스 = indexPath.item
        switch 선택된인덱스 {
        case let 인덱스 where 인덱스 < 메인뷰모델.여행정보목록갯수:
            if let 눌린여행정보키 = 메인뷰모델.여행정보키값(인덱스: indexPath.item) {
                Defaults[.활성화여행정보키] = 눌린여행정보키
                present(탭_뷰컨트롤러.뷰컨트롤러생성(of: .tabbar), animated: true, completion: nil)
            }
        case let 인덱스 where 인덱스 == 메인뷰모델.여행정보목록갯수:
            show(여행추가_뷰컨트롤러.뷰컨트롤러생성(of: .addition), sender: self)
        default:
            fatalError("여행정보 목록 갯수와 collectionview 인덱스 비매칭")
        }
    }
}

extension 메인_뷰컨트롤러: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 메인뷰모델.컬렉션뷰너비, height: 메인뷰모델.컬렉션뷰높이)
    }
}
