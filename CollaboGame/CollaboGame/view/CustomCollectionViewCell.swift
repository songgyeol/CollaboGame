//
//  CustomCollectionViewCell.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/15.
//

import UIKit


class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    let iconImageView = UIImageView()
    let gameTitle = UILabel()
    let subTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setContentView()
        setConstraints()
        setImageView()
        setTitle()
    }
    
    func setContentView() {
        contentView.layer.borderWidth = 5
        contentView.layer.borderColor = myColor.deepYellow.cgColor
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = contentView.bounds.size.width * 0.5
        contentView.backgroundColor = myColor.yellow
    }
    
    func setImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = myColor.deepBlue
    }
    
    func setTitle() {
        gameTitle.textColor = .white
        gameTitle.font = UIFont.Pretandard(type: .Bold, size: 20)
        gameTitle.textAlignment = .center
        subTitle.textColor = myColor.deepBlue
        subTitle.font = UIFont.Pretandard(type: .Regular, size: 18)
        subTitle.textAlignment = .center
    }
    
    func setConstraints() {
        [iconImageView, gameTitle, subTitle].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 35),
            
            gameTitle.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10),
            gameTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            gameTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gameTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gameTitle.heightAnchor.constraint(equalToConstant: 20),
            
            subTitle.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 5),
            subTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            subTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            subTitle.heightAnchor.constraint(equalToConstant: 20),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
