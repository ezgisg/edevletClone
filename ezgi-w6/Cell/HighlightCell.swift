//
//  HighlightCell.swift
//  ezgi-w6
//
//  Created by Ezgi Sümer Günaydın on 22.03.2024.
//

import UIKit

class HighlightCell: UICollectionViewCell, EDevletCellProtocol {
    
    static var reuseIdentifier = "HighlightCell"
    
    let containerView = UIView()
    let title = UILabel()
    let subtitle = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 5
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        title.font = UIFont.preferredFont(forTextStyle: .headline)
        title.textColor = .label
        title.numberOfLines = 0
        subtitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitle.textColor = .secondaryLabel
        subtitle.numberOfLines = 0
        subtitle.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.contentHuggingPriority(for: .vertical)
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitle)
        
        let innerStackView = UIStackView(arrangedSubviews: [title, view])
        innerStackView.axis = .vertical
        innerStackView.spacing = 3
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let outerStackView = UIStackView(arrangedSubviews: [containerView, innerStackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.spacing = 10
       
        contentView.addSubview(outerStackView)
        
        
        NSLayoutConstraint.activate([
            
            containerView.widthAnchor.constraint(equalToConstant: 70),
            containerView.heightAnchor.constraint(equalToConstant: 70),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            innerStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            subtitle.topAnchor.constraint(equalTo: view.topAnchor),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
