//
//  데이터베이스.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    static func object<T: Object>(type: T.Type) -> Results<T>? {
        let realm = try? Realm()
        
        return realm?.objects(type)
    }
}

extension Object {
    
    func 추가() {
        let realm = try? Realm()
        
        try! realm?.write {
            realm?.add(self)
        }
    }
    
    func 업데이트(완료됨: () -> ()) {
        let realm = try? Realm()
        
        try! realm?.write(완료됨)
    }
    
    func 삭제() {
        let realm = try? Realm()
        
        try! realm?.write {
            realm?.delete(self)
        }
    }
}
