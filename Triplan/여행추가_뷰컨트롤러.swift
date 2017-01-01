//
//  여행추가_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 4..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class 여행추가_뷰컨트롤러: 공통_테이블뷰컨트롤러 {

    @IBOutlet weak var 여행제목입력창: UITextField! {
        didSet {
            여행제목입력창.rx.text.asObservable().bindTo(여행추가뷰모델.여행제목).addDisposableTo(disposeBag)
        }
    }
    @IBOutlet weak var 출발날짜: UILabel!
    @IBOutlet weak var 도착날짜: UILabel!
    @IBOutlet weak var 출발데이트피커: UIDatePicker!
    @IBOutlet weak var 도착데이트피커: UIDatePicker!
    @IBOutlet weak var 확인버튼: UIBarButtonItem!
    
    var 여행추가유효성값 = 여행추가유효성결과.제목없음
    
    var 출발데이터피커숨겨짐 = true {
        didSet {
            if !출발데이터피커숨겨짐 && !도착데이터피커숨겨짐 {
                도착데이터피커숨겨짐 = true
            }
        }
    }
    var 도착데이터피커숨겨짐 = true {
        didSet {
            if !도착데이터피커숨겨짐 && !출발데이터피커숨겨짐 {
                출발데이터피커숨겨짐 = true
            }
        }
    }
    
    let 여행추가뷰모델 = 여행추가_뷰모델()
    let disposeBag = DisposeBag()
    
    deinit {
        NSLog("deinit -- 여행추가_뷰컨트롤러")
    }
}

extension 여행추가_뷰컨트롤러 {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        옵져버세팅()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func 네비게이션바세팅() {
        title = "여행추가"
    }
}

fileprivate extension 여행추가_뷰컨트롤러 {
    
    func 옵져버세팅() {
        여행추가뷰모델.출발날짜감시자?
            .subscribe { [weak self] in
                self?.출발날짜.text = $0.element
            }
            .addDisposableTo(disposeBag)
        
        여행추가뷰모델.도착날짜감시자?
            .subscribe { [weak self] in
                self?.도착날짜.text = $0.element
            }
            .addDisposableTo(disposeBag)
        
        여행추가뷰모델.여행추가유효성감시자?
            .subscribe { [weak self] in
                self?.확인버튼상태갱신(결과: $0.element ?? .성공)
                self?.여행추가유효성값 = $0.element ?? .제목없음
            }
            .addDisposableTo(disposeBag)
    }
    
    func 확인버튼상태갱신(결과: 여행추가유효성결과) {
        switch 결과 {
        case .성공:
            확인버튼.tintColor = UIColor.대표컬러
        case .제목없음, .날짜비매칭:
            확인버튼.tintColor = UIColor.비활성화컬러
        }
    }
    
    func 피커토글(셀인덱스: Int) {
        guard 셀인덱스 < tableView.numberOfRows(inSection: 0) else {
            return
        }
        
        switch 셀인덱스 {
        case 2: 출발데이터피커숨겨짐 = !출발데이터피커숨겨짐
        case 4: 도착데이터피커숨겨짐 = !도착데이터피커숨겨짐
        default: return
        }
        
        테이블뷰UI업데이트()
    }
    
    func 테이블뷰UI업데이트() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

extension 여행추가_뷰컨트롤러 {
    
    @IBAction func 출발피커값변화됨(_ sender: UIDatePicker) {
        여행추가뷰모델.출발날짜.value = sender.date as NSDate
    }
    
    @IBAction func 도착피커값변화됨(_ sender: UIDatePicker) {
        여행추가뷰모델.도착날짜.value = sender.date as NSDate
    }
    
    @IBAction override func 확인버튼_탭(sender: UIButton) {
        switch 여행추가유효성값 {
        case .성공:
            여행추가뷰모델.여행추가()
            _ = navigationController?.popViewController(animated: true)
        case .제목없음:
            알림창표시(메세지: "여행 제목을 입력해주세요!")
        case .날짜비매칭:
            알림창표시(메세지: "출발일과 도착일 순서를 맞쳐주세요!")
        }
    }
}

extension 여행추가_뷰컨트롤러 {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        피커토글(셀인덱스: indexPath.item)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if 출발데이터피커숨겨짐 && indexPath.row == 3 {
            return 0
        }
        if 도착데이터피커숨겨짐 && indexPath.row == 5 {
            return 0
        }
        
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
