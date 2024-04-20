//
//  DemoController.swift
//  ShimmerLearn
//
//  Created by SAHIL AMRUT AGASHE on 04/04/24.
//
import UIKit

class DemoController: UIViewController {

    // MARK: - Properties
    let label = UILabel()
    let gradientLayer = CAGradientLayer()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        gradientLayer.frame = label.bounds
        gradientLayer.cornerRadius = label.bounds.height / 2
    }
    
    // MARK: - Helpers
    private func setupUI() {
        navigationItem.title = "Demo Shimmer Effect"
        view.backgroundColor = .systemBackground
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shimmer"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            label.heightAnchor.constraint(equalToConstant: 36),
        ])
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        label.layer.addSublayer(gradientLayer)
        
        let titleGroup = makeAnimationGroup()
        titleGroup.beginTime = 0.0
        gradientLayer.add(titleGroup, forKey: "backgroundColor")
    }
    
}

extension DemoController: SkeletonLoadable {}

