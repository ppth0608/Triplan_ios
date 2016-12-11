//
//  CurrencyViewController.swift
//  hwanewul
//
//  Created by Naver on 2016. 10. 23..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CurrencyViewController: 공통_뷰컨트롤러 {
    
    static var 인스턴스: CurrencyViewController {
        return UIStoryboard(name: "Currency", bundle: nil).instantiateViewController(withIdentifier: "환율") as! CurrencyViewController
    }
    
    //Currency
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    @IBOutlet weak var baseCurrencySelectButton: UIButton!
    @IBOutlet weak var exchangeTextView: UITextView!
    @IBOutlet weak var exchangeTextViewPlaceholderLabel: UILabel!
    
    //Calculator
    @IBOutlet var digitButtons: [UIButton]!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    //ViewModel
    let currencyViewModel = CurrencyViewModel()
    let calculatorViewModel = CalculatorViewModel()
    
    //RxSwift
    let disposeBag = DisposeBag()
}

// MARK: Life Cycle
extension CurrencyViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        네비게이션바세팅(타이틀: "환율")
        
        setupCurrencyViewModel()
        setupCalculatorViewModel()
        
        setupExchangeVariable()
        
        setupDigitButtons()
        setupACButton()
    }
}

// MARK: setup Function
private extension CurrencyViewController {
    
    func setupCurrencyViewModel() {
        currencyViewModel.exchangeObservable?
            .asObservable()
            .subscribe { _ in
                self.tableView.reloadData()
            }
            .addDisposableTo(disposeBag)
        
        currencyViewModel.ratesVariable
            .asObservable()
            .bindTo(tableView.rx.items(cellIdentifier: "CurrencyCell")) { (index, item, cell: CurrencyCell) in
                cell.rate = Rate(currencyCode: item.currencyCode, rate: item.rate)
            }
            .addDisposableTo(disposeBag)
        
        currencyViewModel.ratesVariable
            .asObservable()
            .subscribe { _ in
                self.tableView.reloadData()
            }
            .addDisposableTo(disposeBag)
        
        currencyViewModel.baseCountryVariable
            .asObservable()
            .subscribe {
                self.baseCurrencyLabel.text = $0.element
            }
            .addDisposableTo(disposeBag)
    }
    
    func setupCalculatorViewModel() {
        calculatorViewModel
            .appendedInputVariable
            .asObservable()
            .bindTo(exchangeTextView.rx.text)
            .addDisposableTo(disposeBag)
    }
    
    func setupExchangeVariable() {
        exchangeTextView.rx.text.subscribe {
            self.exchangeTextViewPlaceholderLabel.isHidden = $0.element == "" ? false : true
            }.addDisposableTo(disposeBag)
        
        exchangeTextView.rx.text
            .bindTo(currencyViewModel.exchangeVariable)
            .addDisposableTo(disposeBag)
    }
    
    
    func setupDigitButtons() {
        digitButtons.forEach { button in
            button.rx.tap.map {
                button.currentTitle!
                }
                .bindTo(calculatorViewModel.inputVariable)
                .addDisposableTo(disposeBag)
        }
    }
    
    func setupACButton() {
        acButton.rx.tap
            .subscribe {
                print($0)
                self.calculatorViewModel.clearValue()
            }
            .addDisposableTo(disposeBag)
    }
}

// MARK: IBAction function
private extension CurrencyViewController {
    
    @IBAction func baseCurrencySelectButtonTapped(_ sender: UIButton) {
        presentActionSheet()
    }
}

// MARK: private function
private extension CurrencyViewController {
    
    func presentActionSheet() {
        let alertController = UIAlertController(title: "Base Country", message: "Choose Base Country", preferredStyle: .actionSheet)
        let baseCountryItems = ["KRW", "USD", "GBP"]
        
        baseCountryItems.forEach { codeName in
            let alertAction = UIAlertAction(title: codeName, style: .default) { _ in
                self.currencyViewModel.baseCountryVariable.value = codeName
            }
            alertController.addAction(alertAction)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelButton)
        
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }
}
