//
//  SkeletonCell.swift
//  ShimmerLearn
//
//  Created by SAHIL AMRUT AGASHE on 14/04/24.
//

import UIKit

class SkeletonCell: UITableViewCell {

    let titleLabel = UILabel()
    let titleLayer = CAGradientLayer()

    let yearLabel = UILabel()
    let yearLayer = CAGradientLayer()

    var game: Game? {
        didSet {
            guard let game = game else { return }
            titleLabel.text = game.title
            yearLabel.text = game.year
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLayer.frame = titleLabel.bounds
        titleLayer.cornerRadius = titleLabel.bounds.height / 2
        
        yearLayer.frame = yearLabel.bounds
        yearLayer.cornerRadius = yearLabel.bounds.height / 2
    }
}

extension SkeletonCell {

    func setup() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLayer.startPoint = CGPoint(x: 0, y: 0.5)
        titleLayer.endPoint = CGPoint(x: 1, y: 0.5)
        titleLabel.layer.addSublayer(titleLayer)

        yearLayer.startPoint = CGPoint(x: 0, y: 0.5)
        yearLayer.endPoint = CGPoint(x: 1, y: 0.5)
        yearLabel.layer.addSublayer(yearLayer)

        let titleGroup = makeAnimationGroup()
        titleGroup.beginTime = 0.0
        titleLayer.add(titleGroup, forKey: "backgroundColor")
        
        let yearGroup = makeAnimationGroup(previousGroup: titleGroup)
        yearLayer.add(yearGroup, forKey: "backgroundColor")
    }
    
    func layout() {
        addSubview(titleLabel)
        addSubview(yearLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            yearLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: yearLabel.trailingAnchor, multiplier: 2),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            yearLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        yearLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
}

// inherit
extension SkeletonCell: SkeletonLoadable {}

