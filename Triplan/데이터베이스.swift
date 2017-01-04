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

enum DB노티피케이션상태 {
    
    case 초기화
    case 업데이트
}

extension Results {
    
    func 전체삭제() {
        for entity in self {
            entity.삭제()
        }
    }
    
    typealias NotificationResult = (Results<T>, DB노티피케이션상태)

    func asObservable() -> Observable<NotificationResult> {
        return Observable.create { observer in
            var token: NotificationToken?
            token = self.addNotificationBlock { changes in
                switch changes {
                case .initial(let 결과):
                    observer.onNext((결과, .초기화))
                case .update(let 결과, _, _, _):
                    observer.onNext((결과, .업데이트))
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
            var token: NotificationToken?
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


extension List {
    
    typealias NotificationResult = (List<T>, DB노티피케이션상태)
    
    func asObservable() -> Observable<NotificationResult> {
        return Observable.create { observer in
            var token: NotificationToken?
            token = self.addNotificationBlock { changes in
                switch changes {
                case .initial(let 결과):
                    observer.onNext((결과, .초기화))
                case .update(let 결과, _, _, _):
                    observer.onNext((결과, .업데이트))
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
