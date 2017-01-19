//
//  상세_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 19..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class 상세_계획_뷰컨트롤러: 공통_네비게이션뷰컨트롤러 {

    @IBOutlet weak var 캘린더메뉴뷰: CVCalendarMenuView!
    @IBOutlet weak var 캘린더뷰: CVCalendarView!
    @IBOutlet weak var 테이블뷰: UITableView!

    let 상세계획뷰모델 = 상세_계획_뷰모델()
    let 테이블뷰데이터소스 = 상세_계획_테이블뷰_데이터소스()

    deinit {
        NSLog("deinit -- 상세_계획_뷰컨트롤러")
    }
}

// MARK: - UIViewController
extension 상세_계획_뷰컨트롤러 {

    override func viewDidLoad() {
        super.viewDidLoad()
        디폴트세팅()
        옵져버세팅()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        캘린더메뉴뷰.commitMenuViewUpdate()
        캘린더뷰.commitCalendarViewUpdate()
    }

    override func 네비게이션바세팅() {
        title = 상세계획뷰모델.네비게이션바타이틀
    }
}

// MARK: - Private
fileprivate extension 상세_계획_뷰컨트롤러 {

    func 디폴트세팅() {
        테이블뷰.dataSource = 테이블뷰데이터소스
    }

    func 옵져버세팅() {

    }
}

// MARK: - UITableViewDelegate
extension 상세_계획_뷰컨트롤러: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let 선택된인덱스 = indexPath.row
        switch 선택된인덱스 {
        case let 인덱스 where 인덱스 < 상세계획뷰모델.여행계획목록갯수:
            // TODO: 디페일 페이지 이동
            break
        case let 인덱스 where 인덱스 == 상세계획뷰모델.여행계획목록갯수:
            show(상세_계획_추가_뷰컨트롤러.뷰컨트롤러생성(of: .addSchedule), sender: nil)
        default:
            fatalError("여행정보 목록 갯수와 collectionview 인덱스 비매칭")
        }
    }
}

// MARK: - CVCalendarViewDelegate, CVCalendarMenuViewDelegate
extension 상세_계획_뷰컨트롤러: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {

    func presentationMode() -> CalendarMode {
        return .weekView
    }

    func firstWeekday() -> Weekday {
        return .sunday
    }

    func dayOfWeekTextColor() -> UIColor {
        return UIColor.일반텍스트컬러
    }

    func shouldAutoSelectDayOnWeekChange() -> Bool {
        return false
    }

    func shouldSelectDayView(_ dayView: DayView) -> Bool {
        guard let 캘린더날짜 = dayView.date.convertedDate() else {
            return false
        }

        return 상세계획뷰모델.캘린더날짜선택가능여부(날짜: 캘린더날짜)
    }

    func didSelectDayView(_ dayView: DayView, animationDidFinish: Bool) {
        guard let 캘린더날짜 = dayView.date.convertedDate() else {
            return
        }
        상세계획뷰모델.선택된날짜.value = 캘린더날짜 as NSDate
    }
}

extension 상세_계획_뷰컨트롤러: CVCalendarViewAppearanceDelegate {

    func dayLabelWeekdayInTextColor() -> UIColor {
        return UIColor.일반텍스트컬러
    }

    func dayLabelWeekdaySelectedTextColor() -> UIColor {
        return UIColor.일반텍스트컬러
    }

    func dayLabelWeekdaySelectedBackgroundColor() -> UIColor {
        return UIColor.white
    }

//    func topMarkerColor() -> UIColor {
//        return UIColor.white
//    }
//    
//    func dayLabelPresentWeekdayTextColor() -> UIColor {
//        return UIColor.blue
//    }
}
