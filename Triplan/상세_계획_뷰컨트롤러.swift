//
//  상세_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 19..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import CVCalendar

class 상세_계획_뷰컨트롤러: 공통_네비게이션뷰컨트롤러 {
    
    @IBOutlet weak var 캘린더메뉴뷰: CVCalendarMenuView!
    @IBOutlet weak var 캘린더주단위뷰: CVCalendarView!
    
    
    var 여행정보키값: String? {
        didSet {
            print(여행정보키값)
        }
    }

    deinit {
        NSLog("deinit -- 상세_계획_뷰컨트롤러")
    }
}

// MARK: - UIViewController
extension 상세_계획_뷰컨트롤러 {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        여행정보키값 = Defaults[.활성화여행정보키]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        캘린더메뉴뷰.commitMenuViewUpdate()
        캘린더주단위뷰.commitCalendarViewUpdate()
    }
    
    override func 네비게이션바세팅() {
        title = "계획"
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
    
    func dayOfWeekTextColor(by weekday: Weekday) -> UIColor {
        return UIColor.일반텍스트컬러
    }
}

// MARK: - CVCalendarViewAppearanceDelegate
extension 상세_계획_뷰컨트롤러: CVCalendarViewAppearanceDelegate {
 
    
}
