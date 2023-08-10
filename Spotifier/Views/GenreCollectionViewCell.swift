//
//  CategoryCollectionViewCell.swift
//  Spotifier
//
//  Created by Edu Caubilla on 10/8/23.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .white
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        imageView.image = UIImage(
            systemName: "music.note.list",
            withConfiguration:
                UIImage.SymbolConfiguration(
                    pointSize: 80,
                    weight: .regular,
                    scale: UIImage.SymbolScale.default
                )
        )
        return imageView
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .light)
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
        imageView.image = UIImage(
            systemName: "music.note.list",
            withConfiguration:
                UIImage.SymbolConfiguration(
                    pointSize: 80,
                    weight: .regular,
                    scale: UIImage.SymbolScale.default
                )
        )
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(x: 15, y: contentView.height * 2/3 + 5, width: contentView.width - 20, height: contentView.height/3)
        imageView.frame = CGRect(x: contentView.width/4, y: 12, width: contentView.width*2/3, height: contentView.height*2/3)
    }
    
    func configure(with viewModel: CategoryCollectionViewCellViewModel){
        label.text = viewModel.title
        imageView.sd_setImage(with: viewModel.artwork)
        contentView.backgroundColor = colors.randomElement()
    }
}
