//
//  SectionHeader.swift
//  ezgi-w6
//
//  Created by Ezgi Sümer Günaydın on 22.03.2024.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    static var reuseIdentifier = "SectionHeader"
    
    let title = UILabel()
    let seperator = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        seperator.backgroundColor = .darkGray
        seperator.translatesAutoresizingMaskIntoConstraints = false
        
        title.textColor = .label
        title.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 15, weight: .bold))
        title.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [seperator, title])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            seperator.heightAnchor.constraint(equalToConstant: 0.5),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10 ),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-10)
//            bottom için kontrol et
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
