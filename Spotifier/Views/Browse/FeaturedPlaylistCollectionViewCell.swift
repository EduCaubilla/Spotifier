//
//  FeaturedPlaylistCollectionViewCell.swift
//  Spotifier
//
//  Created by Edu Caubilla on 28/7/23.
//

import UIKit

class FeaturedPlaylistCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedPlaylistCollectionViewCell"
    
    private let playlistCoverImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let creatorNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .thin)
        return label
    }()
    
    private let playlistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(playlistCoverImageView)
        contentView.addSubview(creatorNameLabel)
        contentView.addSubview(playlistNameLabel)
        contentView.clipsToBounds = true
    }
    
    required init(coder:NSCoder) {
        fatalError("Error on init NewReleaseCollectionViewCell")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        creatorNameLabel.frame = CGRect(
            x: 3,
            y: contentView.height - 35,
            width: contentView.width - 5,
            height: 35
        )
        
        playlistNameLabel.frame = CGRect(
            x: 3,
            y: contentView.height - 50,
            width: contentView.width - 5,
            height: 25
        )
        
        let imageSize = contentView.height - 60
        playlistCoverImageView.frame = CGRect(
            x: (contentView.width - imageSize)/2,
            y: 5,
            width: imageSize,
            height: imageSize
        )
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        creatorNameLabel.text = nil
        playlistNameLabel.text = nil
        playlistCoverImageView.image = nil
    }
    
    func configure(with viewModel: FeaturedPlaylistCellViewModel) {
        creatorNameLabel.text = viewModel.creatorName
        playlistNameLabel.text = viewModel.name
        playlistCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
}
