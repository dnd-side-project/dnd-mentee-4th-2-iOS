//
//  TabButtonCollectionCell.swift
//  EchoNote
//
//  Created by 김혜빈 on 2021/01/28.
//

import UIKit
import Then

struct TabItem {
    var isSelected: Bool = false
    var title: String
    var textColor: String
    var image: String
    var strokeColor: String?
}

class TabButtonCollectionCell: UICollectionViewCell {
    static let identifier = "TabButtonCollectionCell"
    private let titleLabel = UILabel()
        .then {
            $0.text = "Tab"
            $0.textColor = .systemBlue
            $0.font = UIFont.boldSystemFont(ofSize: 14)
        }
    private let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 19, height: 19))
        .then {
            $0.autoresizesSubviews = true
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
        
        setupTitleLabel()
        setupImageView()
    }
    
    func setButtonInformatin(item: TabItem) {
        titleLabel.text = item.title
        imageView.image = UIImage(named: item.image)
        if item.isSelected {
            titleLabel.textColor = UIColor(named: item.textColor)!
            self.layer.borderColor = UIColor(named: (item.strokeColor ?? item.textColor))!.cgColor
        } else {
            titleLabel.textColor = UIColor(named: "grey01")!
            self.layer.borderColor = UIColor.white.cgColor
        }
    }
}

// MARK: +UI
extension TabButtonCollectionCell {
    private func setupTitleLabel() {
        self.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
    }
    
    private func setupImageView() {
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 19).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        imageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -2).isActive = true
    }
}
