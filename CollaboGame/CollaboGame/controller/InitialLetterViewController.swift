//
//  InitialLetterViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class InitialLetterViewController: UIViewController {
    let initialQuizManager = InitialQuiz.shared
    
    let categoryButton = UISegmentedControl(items: ["과자", "라면", "아이스크림"])
    var quizLabel = CustomLabel(title: "초성게임")
    
    let startButton = CustomButton(title: "시작하기")
    var timerLabel = UILabel()
    let progressBar = CustomProgressBar()
    let rightAnswerButton = CustomPassButton(title: "정답확인")
    
    var timer = Timer()
    var secondRemaining: Int = 0
    
    let limitTime = 5 // 게임 시간 = 타이머 시간
    
    var currentCategory = "과자"
    var currentAnswer = ""
    var questionArray = [String]()
    
    let hangul = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "초성 게임"
        configureUI()
        view.backgroundColor = .white

        print("바보".getInitialLetter())
        
    }
    
    @objc func update() {
        if secondRemaining < limitTime {
            secondRemaining += 1
            let percentage = Float(secondRemaining) / Float(limitTime)
            progressBar.setProgress(Float(percentage), animated: true)
            print(secondRemaining)
        } else {
            timer.invalidate()
            showAlert()
        }
    }
}

extension InitialLetterViewController {
    
    
    @objc private func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentCategory = "과자"
        case 1:
            currentCategory = "라면"
        case 2:
            currentCategory = "아이스크림"
        default:
            break
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        timer.invalidate()
        switch sender {
        case startButton:
            startButton.setTitle("다음 문제", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
            timerLabel.isHidden = true
            progressBar.isHidden = false
            quizLabel.text = getInitialLetter()
        case rightAnswerButton:
            quizLabel.text = currentAnswer
        default:
            break
        }
        
    }

    func getInitialLetter() -> String {
        var result = ""
        guard let randomWord = initialQuizManager.quiz[currentCategory]?.randomElement() else { fatalError() }
        currentAnswer = randomWord
        if !initialQuizManager.resultArray.keys.contains(randomWord) {
            initialQuizManager.testArray.append(randomWord)
        }
        
        // 문자열하나씩 짤라서 확인
        for char in randomWord {
            let octal = char.unicodeScalars[char.unicodeScalars.startIndex].value
            if 44032...55203 ~= octal { // 유니코드가 한글값 일때만 분리작업
                let index = (octal - 0xac00) / 28 / 21
                result = result + hangul[Int(index)]
            }
        }
        initialQuizManager.resultArray[result] = randomWord
        print(randomWord)
        return result
    }
    
    
    
    func showAlert() {
        print("alert")
        let alert = UIAlertController(title: "게임 끝!", message: "결과를 확인하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "결과보기", style: .default) { [weak self] _ in
            let nextVC = InitialResultViewController()
            self?.present(nextVC, animated: true)
        }
        let cancelAction = UIAlertAction(title: "다시하기", style: .cancel) { [weak self] _ in
            self?.timer.invalidate()
            self?.quizLabel.text = "이름을 맞추세요"
            self?.secondRemaining = 0
            self?.startButton.setTitle("시작하기", for: .normal)
            self?.progressBar.progress = 0.0
            self?.questionArray = []
            
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
            $0.selectedSegmentTintColor = CustomColor.startBtnColor
            $0.selectedSegmentIndex = 0
        }
        

        
        [timerLabel].forEach {
            $0.text = "제한 시간 : 60초"
            $0.textAlignment = .center
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 20)
        }


        [progressBar].forEach {
            $0.isHidden = true
            $0.progressViewStyle = .default
            $0.progress = 0.0
        }

    }
    
    final private func addTarget() {
        startButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        rightAnswerButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    
    final private func setConstraints() {

        
        [categoryButton, quizLabel, timerLabel, startButton, rightAnswerButton, progressBar].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        
        NSLayoutConstraint.activate([
            categoryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            categoryButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            categoryButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            categoryButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            quizLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            quizLabel.topAnchor.constraint(equalTo: categoryButton.bottomAnchor, constant: 20),
            quizLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            quizLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            quizLabel.heightAnchor.constraint(equalToConstant: 300),
            
            

            timerLabel.topAnchor.constraint(equalTo: quizLabel.bottomAnchor, constant: 30),
            timerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            progressBar.topAnchor.constraint(equalTo: quizLabel.bottomAnchor, constant: 30),
            progressBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            startButton.topAnchor.constraint(equalTo: quizLabel.bottomAnchor, constant: 90),
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),        startButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            rightAnswerButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20),
            rightAnswerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),        rightAnswerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            rightAnswerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            rightAnswerButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
