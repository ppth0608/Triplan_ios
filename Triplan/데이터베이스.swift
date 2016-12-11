//
//  데이터베이스.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

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

extension Results {

    func asObservable() -> Observable<Results<Element>> {
        return Observable.create { observer in
            var token: NotificationToken? = nil
            token = self.addNotificationBlock { changes in
                switch changes {
                case .initial(let results):
                    observer.onNext(results)
                case .update(let results, _, _, _):
                    observer.onNext(results)
                case .error(let error):
                    observer.onError(error)
                    break
                }
            }
            return Disposables.create {
                token?.stop()
            }
        }
    }

    func asObservableArray() -> Observable<[Element]> {
        return Observable.create { observer in
            var token: NotificationToken? = nil
            token = self.addNotificationBlock { changes in
                switch changes {
                case .initial(let results):
                    observer.onNext(Array(results))
                case .update(let results, _, _, _):
                    observer.onNext(Array(results))
                case .error(let error):
                    observer.onError(error)
                    break
                }
            }
            return Disposables.create {
                token?.stop()
            }
        }
    }
    
}
