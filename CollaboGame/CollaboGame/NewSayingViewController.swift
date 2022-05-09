//
//  NewSayingViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class NewSayingViewController: UIViewController {
    
    var newSayingLabel = UILabel()
    var countingLabel = UILabel()
    var startButton = UIButton()
    var newSay = newSaying
    
    var progressBar = UIProgressView(progressViewStyle: .bar)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
}


//MARK: - Configure
extension NewSayingViewController {
    func setUI() {
        setBasic()
        setLayout()
    }
    
    final private func setBasic() {
        [newSayingLabel,countingLabel,startButton,progressBar].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        newSayingLabel.text = "신조어"
        newSayingLabel.backgroundColor = UIColor(red:0.59, green:0.45, blue:0.98, alpha:1.0)
        newSayingLabel.textAlignment = .center
        newSayingLabel.textColor = UIColor(red:0.64, green:0.26, blue:0.24, alpha:1.0)
        newSayingLabel.numberOfLines = 8
        newSayingLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        countingLabel.text = "0 초"
        countingLabel.backgroundColor = UIColor(red:0.59, green:0.45, blue:0.98, alpha:1.0)
        countingLabel.textAlignment = .center
        countingLabel.textColor = .white//UIColor(red:0.64, green:0.26, blue:0.24, alpha:1.0)
        countingLabel.numberOfLines = 8
        countingLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.backgroundColor = UIColor.purple
        startButton.layer.cornerRadius = 10
        startButton.sizeToFit()
        startButton.tintColor = .white//.clear
        startButton.addTarget(self, action: #selector(startBT(_:)), for: .touchUpInside)
        
        progressBar.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        progressBar.setProgress(0.5, animated: false)
        progressBar.backgroundColor = .white
        
         }
    
    
    
    
    
    //MARK: - SetLayout
private func setLayout() {
        NSLayoutConstraint.activate([
            newSayingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            newSayingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newSayingLabel.heightAnchor.constraint(equalToConstant:300),
            newSayingLabel.widthAnchor.constraint(equalToConstant: 270),
            
            countingLabel.topAnchor.constraint(equalTo: newSayingLabel.bottomAnchor, constant: 50),
            countingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countingLabel.heightAnchor.constraint(equalToConstant: 50),
            countingLabel.widthAnchor.constraint(equalToConstant: 150),
            
            progressBar.topAnchor.constraint(equalTo: countingLabel.bottomAnchor, constant: 10),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.heightAnchor.constraint(equalToConstant:50),
            progressBar.widthAnchor.constraint(equalToConstant: 270),
            
            startButton.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 50),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 70),
            startButton.widthAnchor.constraint(equalToConstant: 270)
            
            
        ])
    }
    //MARK: - StartButtonTapped
    @objc func startBT(_ uibutton: Any) {
        if let newSay = newSaying.randomElement() {
            self.newSayingLabel.text = newSay
        }
    }
    
    
    
    
}
