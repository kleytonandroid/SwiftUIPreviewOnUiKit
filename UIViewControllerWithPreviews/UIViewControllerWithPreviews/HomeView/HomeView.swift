//
//  HomeView.swift
//  UIViewControllerWithPreviews
//
//  Created by Kleyton Santos on 24/03/22.
//
import UIKit

final class HomeView: UIView {
    
    private lazy var safeArea: UILayoutGuide = {
        return layoutMarginsGuide
    }()
    
    private lazy var firstLabel: UILabel = {
        let _label = UILabel()
        _label.textColor = .purple
        _label.text = "First label"
        _label.translatesAutoresizingMaskIntoConstraints = false
       return _label
    }()

    private lazy var secondLabel: UILabel = {
        let _label = UILabel()
        _label.textColor = .blue
        _label.text = "Second Label"
        _label.translatesAutoresizingMaskIntoConstraints = false
       return _label
    }()
    
    private lazy var otherLabel: UILabel = {
        let _label = UILabel()
        _label.textColor = .brown
        _label.text = "Other label"
        _label.translatesAutoresizingMaskIntoConstraints = false
       return _label
    }()
    
    private lazy var buttonChange: UIButton = {
        let _button = UIButton()
        _button.setTitle("Run Animation", for: .normal)
        _button.layer.cornerRadius = 10
        _button.configuration = .borderedProminent()
        _button.backgroundColor = .darkGray
        _button.translatesAutoresizingMaskIntoConstraints = false
        return _button
    }()

    
    init() {
        super.init(frame: .zero)
        addSubViews()
        setupConstraints()
        setupTargets()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        self.addSubview(firstLabel)
        self.addSubview(secondLabel)
        self.addSubview(otherLabel)
        self.addSubview(buttonChange)
    }
    
    private func setupConstraints() {
        firstLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        firstLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 10).isActive = true
        secondLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        otherLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 10).isActive = true
        otherLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        buttonChange.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50).isActive = true
        buttonChange.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setupTargets() {
        buttonChange.addTarget(self, action: #selector(animateLabels), for: .touchUpInside)
    }
    
    @objc private func animateLabels() {
        UIView.animate(withDuration: 4.0) {
            [unowned self] in
            self.secondLabel.alpha = 0.0
            self.secondLabel.textColor = .green
            self.secondLabel.alpha = 1
        } completion: { [unowned self] finished in
            self.secondLabel.textColor = .blue
        }
    }
}

#if canImport(swiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct HomeViewPreview: PreviewProvider {
    static var previews: some View {
        UINavigationController(rootViewController: HomeViewController())
            .preview.previewDevice("iPhone 12")

        UINavigationController(rootViewController: HomeViewController())
            .preview.previewDevice("iPhone x")

        UINavigationController(rootViewController: HomeViewController())
            .preview.previewDevice("iPhone 8")
    }
}
#endif
