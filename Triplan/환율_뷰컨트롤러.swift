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
import PKHUD

class CurrencyViewController: 공통_네비게이션뷰컨트롤러 {

    //Currency
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var baseCurrencyLabel: UILabel!
    @IBOutlet fileprivate weak var baseCurrencySelectButton: UIButton!
    @IBOutlet fileprivate weak var exchangeTextView: UITextView!
    @IBOutlet fileprivate weak var exchangeTextViewPlaceholderLabel: UILabel!

    //Calculator
    @IBOutlet fileprivate var digitButtons: [UIButton]!
    @IBOutlet fileprivate weak var dotButton: UIButton!
    @IBOutlet fileprivate weak var divisionButton: UIButton!
    @IBOutlet fileprivate weak var acButton: UIButton!
    @IBOutlet fileprivate weak var multiplyButton: UIButton!
    @IBOutlet fileprivate weak var subtractionButton: UIButton!
    @IBOutlet fileprivate weak var plusButton: UIButton!

    //ViewModel
    let currencyViewModel = CurrencyViewModel()
    let calculatorViewModel = CalculatorViewModel()

    //RxSwift
    let disposeBag = DisposeBag()

    deinit {
        NSLog("deinit -- CurrencyViewController")
    }
}

// MARK: Life Cycle
extension CurrencyViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        로딩중인디케이터세팅()

        setupCurrencyViewModel()
        setupCalculatorViewModel()

        setupExchangeVariable()

        setupDigitButtons()
        setupACButton()
    }

    override func 네비게이션바세팅() {
        title = "환율"
    }
}

// MARK: setup Function
private extension CurrencyViewController {

    func 로딩중인디케이터세팅() {
        currencyViewModel.로딩중인디케이터감시자?
            .asObservable()
            .bindTo(PKHUD.sharedHUD.rx_로딩뷰애니메이션)
            .addDisposableTo(disposeBag)
    }

    func setupCurrencyViewModel() {
        currencyViewModel.exchangeObservable?
            .asObservable()
            .subscribe { [weak self] in
                self?.tableView.reloadData()
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
            .subscribe { [weak self] in
                self?.tableView.reloadData()
            }
            .addDisposableTo(disposeBag)

        currencyViewModel.baseCountryVariable
            .asObservable()
            .subscribe { [weak self] in
                self?.baseCurrencyLabel.text = $0.element
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
        exchangeTextView.rx.text
            .subscribe { [weak self] in
                self?.exchangeTextViewPlaceholderLabel.isHidden = $0.element == "" ? false : true
            }.addDisposableTo(disposeBag)

        exchangeTextView.rx.text
            .bindTo(currencyViewModel.exchangeVariable)
            .addDisposableTo(disposeBag)
    }

    func setupDigitButtons() {
        digitButtons.forEach { button in
            button.rx.tap
            .map { button.currentTitle ?? "" }
            .bindTo(calculatorViewModel.inputVariable)
            .addDisposableTo(disposeBag)
        }
    }

    func setupACButton() {
        acButton.rx.tap
            .subscribe { [weak self] _ in
                self?.calculatorViewModel.clearValue()
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
