//
//  ViewController.swift
//  MultiLineTitle
//
//  Created by Work on 5/30/24.
//
import UIKit

class ViewController: UIViewController {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "This is a"
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var containerView :UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a container view
        containerView.addSubview(titleLabel)
        
        // Add constraints to label and container view
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
        
        // Set the custom title view
        self.navigationItem.titleView = containerView
        
        // Schedule the update of the title
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.updateTitle()
            self.adjustNavigationBarHeight(to:200)
        }
    }
    private func adjustNavigationBarHeight(to height: CGFloat) {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        var frame = navigationBar.frame
        frame.size.height = height
        navigationBar.frame = frame
        navigationBar.layoutIfNeeded()
    }

    @objc
    func updateTitle() {
        titleLabel.text = "This is a\nmultiline string for the navBar third line\nfourth line\nfifth line"
        
        // Force layout update
        if let containerView = self.navigationItem.titleView {
            containerView.setNeedsLayout()
            containerView.layoutIfNeeded()
            
            // Adjust navigation bar height
            adjustNavigationBarHeight()
        }
    }

    private func adjustNavigationBarHeight() {
        guard let navigationBar = self.navigationController?.navigationBar,
              let containerView = self.navigationItem.titleView else { return }
        
        // Calculate the fitting size
        let fittingSize = CGSize(width: containerView.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        let sizeThatFits = containerView.systemLayoutSizeFitting(fittingSize)
        
        // Adjust the navigation bar height
        var frame = navigationBar.frame
        frame.size.height = sizeThatFits.height + 20 // Add some padding
        navigationBar.frame = frame
        navigationBar.layoutIfNeeded()
    }
}
