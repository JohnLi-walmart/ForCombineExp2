//
//  ViewController.swift
//  ForCombineExp2
//
//  Created by Zhaoyang Li on 5/10/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var timeLabel: UILabel!
    private let selectedVariable = Variable("date")
    var selectedTime: Observable<String> {
        return selectedVariable.asObservable()
    }
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedTime.subscribe(onNext: { time in
            self.timeLabel.text = time
        }).disposed(by: disposeBag)
    }

    @IBAction func sendButtonTapped(_ sender: UIButton) {
        selectedVariable.value = "\(Date())"
    }
    
}

