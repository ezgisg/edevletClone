//
//  TopCell.swift
//  ezgi-w6
//
//  Created by Ezgi Sümer Günaydın on 22.03.2024.
//

import UIKit

class TopCell: UICollectionViewCell, EDevletCellProtocol {
    
    static var reuseIdentifier = "TopCell"
    
    let containerView = UIView()
    let imageView = UIImageView()
    let title = UILabel()
    let backgroundVieww = UIView()
    
//    let seperator = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 5
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
//        containerView.layer.borderColor = UIColor.systemBlue.cgColor
//        containerView.layer.borderWidth = 2.0
//        contentView.layer.borderWidth = 1.0
//        contentView.layer.borderColor = UIColor.black.cgColor
//        contentView.layer.cornerRadius = 10
//        
//        seperator.translatesAutoresizingMaskIntoConstraints = false
//        seperator.backgroundColor = . systemPink
        
        title.font = UIFont.preferredFont(forTextStyle: .headline)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 3
        title.textColor = .label
        
        let stackView = UIStackView(arrangedSubviews: [imageView, title])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.spacing = 5
        
        containerView.addSubview(stackView)
        
//        Autolayout
        NSLayoutConstraint.activate([
//            seperator.heightAnchor.constraint(equalToConstant: 1),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
//        stackView.setCustomSpacing(5, after: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with edevlet: EDevlet?) {
        title.text = edevlet?.name ?? ""
        imageView.image = UIImage(named: edevlet?.image ?? "e-devlet_logo")
    }
    
    
}


