//
//  InitialLetterViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class InitialLetterViewController: UIViewController {
    let initialQuizManager = InitialQuiz.shared
    
    private let categoryButton = UISegmentedControl(items: ["과자", "라면", "아이스크림"])
    
    private let startButton = UIButton(type: .custom)//CustomButton(title: "시작하기")
    private var timerLabel = UILabel()
    private let progressBar = CustomProgressBar()
    private let rightAnswerButton = UIButton(type: .custom)//CustomPassButton(title: "정답확인")
    private var mainImageView = CustomImageView(label: "🍒초성게임")
    
    private var timer = Timer()
    private var secondRemaining: Int = 0
    
    private let limitTime = 5 // 게임 시간 = 타이머 시간
    
    private var currentCategory = "과자"
    private var currentAnswer = ""

    private let startImage = UIImage(named: "시작하기_초록")
    private let nextQuestionImage = UIImage(named: "다음문제_초록")
    private let answerImage = UIImage(named: "정답확인_노랑")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "초성 게임"
        configureUI()
        view.backgroundColor = .white
    }

    
    @objc func update() {
        if secondRemaining < limitTime {
            secondRemaining += 1
            let percentage = Float(secondRemaining) / Float(limitTime)
            progressBar.setProgress(Float(percentage), animated: true)
            print(secondRemaining)
        } else {
            showAlert()
            timer.invalidate()
        }
    }
}

extension InitialLetterViewController {
    
    
    @objc private func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentCategory = "과자"
            initialQuizManager.resultArray = []
        case 1:
            currentCategory = "라면"
            initialQuizManager.resultArray = []
        case 2:
            currentCategory = "아이스크림"
            initialQuizManager.resultArray = []
        default:
            break
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {

        switch sender.currentImage {
        case startImage:
            startButton.setImage(nextQuestionImage, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
            timerLabel.isHidden = true
            progressBar.isHidden = false
            mainImageView.quizTitle.text = getInitialLetter()
        case nextQuestionImage:
            mainImageView.quizTitle.text = getInitialLetter()
            //timer.invalidate()
        case answerImage:
            mainImageView.quizTitle.text = currentAnswer
            
        default:
            break
            
        }
        
    }

    func getInitialLetter() -> String {
        guard let randomWord = initialQuizManager.quiz[currentCategory]?.randomElement() else { fatalError() }
        currentAnswer = randomWord
        if !initialQuizManager.resultArray.contains(randomWord) {
            initialQuizManager.resultArray.append(randomWord)
        }
        print(randomWord)
        print(initialQuizManager.resultArray)
        return randomWord.getInitialLetter()
    }
    
    
    
    func showAlert() {
        print("alert")
        let alert = UIAlertController(title: "게임 끝!", message: "결과를 확인하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "결과보기", style: .default) { [weak self] _ in
            let nextVC = InitialResultViewController()
            self?.navigationController?.navigationItem.title = "정답확인"
            self?.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.resultArray = self?.initialQuizManager.resultArray ?? [""]
            self?.startButton.setImage(self?.startImage, for: .normal)
            self?.mainImageView.quizTitle.text = "🍒 초성게임"
            self?.secondRemaining = 0
            self?.progressBar.progress = 0.0
            self?.currentAnswer = "🍒 초성게임"
            self?.progressBar.isHidden = true
            self?.timerLabel.isHidden = false
        }
        let cancelAction = UIAlertAction(title: "다시하기", style: .cancel) { [weak self] _ in
            self?.startButton.setTitle("시작하기", for: .normal)
            self?.timer.invalidate()
            self?.mainImageView.quizTitle.text = "🍒 초성게임"
            self?.secondRemaining = 0
            self?.startButton.setImage(self?.startImage, for: .normal)
            self?.progressBar.progress = 0.0
            self?.currentAnswer = "🍒 초성게임"
            self?.progressBar.isHidden = true
            self?.timerLabel.isHidden = false
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

//MARK: -UI
extension InitialLetterViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        
        
        [categoryButton].forEach {
            $0.backgroundColor = UIColor.white
            $0.selectedSegmentTintColor = myColor.lightGreen
            $0.selectedSegmentIndex = 0
        }

        
        [timerLabel].forEach {
            $0.text = "제한 시간 : 30초"
            $0.textAlignment = .center
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 20)
        }

        [progressBar].forEach {
            $0.isHidden = true
            $0.progressViewStyle = .default
            $0.progress = 0.0
        }
        
        startButton.setImage(UIImage(named: "시작하기_초록"), for: .normal)
        rightAnswerButton.setImage(UIImage(named: "정답확인_노랑"), for: .normal)
    }
    
    final private func addTarget() {
        startButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        rightAnswerButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    
    final private func setConstraints() {

        
        [categoryButton, mainImageView, timerLabel, startButton, rightAnswerButton, progressBar].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        NSLayoutConstraint.activate([
            categoryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            categoryButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            categoryButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            categoryButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            mainImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainImageView.topAnchor.constraint(equalTo: categoryButton.bottomAnchor, constant: 20),
            mainImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 320),

            timerLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 30),
            timerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            progressBar.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 30),
            progressBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            startButton.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 80),
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),        startButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            startButton.heightAnchor.constraint(equalToConstant: 70),
            
            rightAnswerButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 10),
            rightAnswerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),        rightAnswerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            rightAnswerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            rightAnswerButton.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
}
