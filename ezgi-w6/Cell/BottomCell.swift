//
//  BottomCell.swift
//  ezgi-w6
//
//  Created by Ezgi Sümer Günaydın on 22.03.2024.
//

import UIKit

class BottomCell: UICollectionViewCell, EDevletCellProtocol {
    
    static var reuseIdentifier = "BottomCell"
    
    let containerView = UIView()
    let title = UILabel()
    let subtitle = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 5
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        title.font = UIFont.preferredFont(forTextStyle: .headline)
        title.textColor = .label
        title.numberOfLines = 0
        
//        title.translatesAutoresizingMaskIntoConstraints = false
//        
//        let viewTitle = UIView()
//        viewTitle.translatesAutoresizingMaskIntoConstraints = false
//        viewTitle.addSubview(title)
//        
        
        subtitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitle.textColor = .secondaryLabel
        subtitle.numberOfLines = 0
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitle)
        
        
        let innerStackView = UIStackView(arrangedSubviews: [title, view])
        innerStackView.axis = .vertical
        innerStackView.spacing = 1
        innerStackView.setCustomSpacing(10, after: view)
        
        let imageContainerView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.addSubview(imageView)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        let outerStackView = UIStackView(arrangedSubviews: [imageContainerView, innerStackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.alignment = .top
        outerStackView.spacing = 10

        contentView.addSubview(outerStackView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
//            imageView.centerYAnchor.constraint(equalTo: innerStackView.centerYAnchor),
            imageContainerView.heightAnchor.constraint(equalTo: innerStackView.heightAnchor),
            

            subtitle.topAnchor.constraint(equalTo: view.topAnchor),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subtitle.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            outerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            outerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            outerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            outerStackView.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -40),
            
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        
            
          
//            subtitle.heightAnchor.constraint(equalTo: view.heightAnchor)
            
//            title.topAnchor.constraint(equalTo: viewTitle.topAnchor),
//            title.leadingAnchor.constraint(equalTo: viewTitle.leadingAnchor),
//            title.trailingAnchor.constraint(equalTo: viewTitle.trailingAnchor),
//            title.bottomAnchor.constraint(equalTo: viewTitle.bottomAnchor),
//          
          
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with edevlet: EDevlet?) {
        title.text = edevlet?.name
        subtitle.text = edevlet?.subheading
        imageView.image = UIImage(named: edevlet?.image ?? "e-devlet_logo")
    }
}
