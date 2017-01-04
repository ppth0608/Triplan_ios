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
    let 상세계획뷰모델 = 상세_계획_뷰모델()

    deinit {
        NSLog("deinit -- 상세_계획_뷰컨트롤러")
    }
}

// MARK: - UIViewController
extension 상세_계획_뷰컨트롤러 {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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





