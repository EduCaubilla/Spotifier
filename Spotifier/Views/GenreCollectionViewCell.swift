//
//  GenreCollectionViewCell.swift
//  Spotifier
//
//  Created by Edu Caubilla on 10/8/23.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    static let identifier = "GenreCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = UIImage(
            systemName: "music.note.list",
            withConfiguration:
                UIImage.SymbolConfiguration(
                    pointSize: 40,
                    weight: .regular,
                    scale: UIImage.SymbolScale.default
                )
        )
        return imageView
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let colors: [UIColor] = [
        .systemPink,
        .systemRed,
        .systemTeal,
        .systemPurple,
        .systemOrange,
        .systemBlue,
        .systemGreen,
        .systemIndigo,
        .systemGray,
        .systemYellow
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(x: 15, y: contentView.height/2, width: contentView.width - 20, height: contentView.height/2)
        imageView.frame = CGRect(x: contentView.width/2, y: 10, width: contentView.width/2, height: contentView.height/2 - 10)
    }
    
    func configure(with title: String){
        label.text = title
        contentView.backgroundColor = colors.randomElement()
    }
}
