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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a container view
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        
        // Add constraints to label and container view
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
//            containerView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        // Set the custom title view
        self.navigationItem.titleView = containerView
        
        // Schedule the update of the title
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.updateTitle()
        }
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
        if let navigationBar = self.navigationController?.navigationBar, let containerView = self.navigationItem.titleView {
            let fittingSize = CGSize(width: containerView.frame.width, height: UIView.layoutFittingCompressedSize.height)
            let newSize = containerView.systemLayoutSizeFitting(fittingSize)
            
            var frame = navigationBar.frame
            frame.size.height = newSize.height + 20 // Add some padding
            navigationBar.frame = frame
        }
    }
}


//import UIKit

//class ViewController: UIViewController {
//    var titleg:UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .clear
//        label.numberOfLines = 0
//        label.font = UIFont.boldSystemFont(ofSize: 16.0)
//        label.textAlignment = .center
//        label.textColor = .black
//        label.text = "This is a"
//        label.lineBreakMode = .byWordWrapping
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
////        let label = UILabel()
////        label.backgroundColor = .clear
////        label.numberOfLines = 0
////        label.font = UIFont.boldSystemFont(ofSize: 16.0)
////        label.textAlignment = .center
////        label.textColor = .black
////        label.attributedText = NSAttributedString("This is a\nmultiline string for the navBar\nthird line")
////        label.lineBreakMode = .byWordWrapping
////        label.sizeToFit()
////
////        self.navigationItem.titleView = label
//
////        let label = UILabel()
////               label.backgroundColor = .clear
////               label.numberOfLines = 0
////               label.font = UIFont.boldSystemFont(ofSize: 16.0)
////               label.textAlignment = .center
////               label.textColor = .black
////               label.attributedText = NSAttributedString(string: "This is a\nmultiline string for the navBar\nthird line")
////               label.lineBreakMode = .byWordWrapping
////
////               // Use Auto Layout to set the label's constraints
////               label.translatesAutoresizingMaskIntoConstraints = false
////
////               let container = UIView()
////               container.addSubview(label)
////               container.translatesAutoresizingMaskIntoConstraints = false
////
////               NSLayoutConstraint.activate([
////                   label.leadingAnchor.constraint(equalTo: container.leadingAnchor),
////                   label.trailingAnchor.constraint(equalTo: container.trailingAnchor),
////                   label.topAnchor.constraint(equalTo: container.topAnchor),
////                   label.bottomAnchor.constraint(equalTo: container.bottomAnchor)
////               ])
////
////               self.navigationItem.titleView = container
////        let label = UILabel()
////        label.backgroundColor = .clear
////        label.numberOfLines = 0
////        label.font = UIFont.boldSystemFont(ofSize: 16.0)
////        label.textAlignment = .center
////        label.textColor = .black
////        label.attributedText = NSAttributedString(string: "This is a\nmultiline string for the navBar\nthird line\nfourth line\nfifth line")
////        label.lineBreakMode = .byWordWrapping
////
////        // Use Auto Layout to set the label's constraints
////        label.translatesAutoresizingMaskIntoConstraints = false
////
////        let container = UIView()
////        container.addSubview(label)
////        container.translatesAutoresizingMaskIntoConstraints = false
////
////        NSLayoutConstraint.activate([
////            label.leadingAnchor.constraint(equalTo: container.leadingAnchor),
////            label.trailingAnchor.constraint(equalTo: container.trailingAnchor),
////            label.topAnchor.constraint(equalTo: container.topAnchor),
////            label.bottomAnchor.constraint(equalTo: container.bottomAnchor),
////            //container.widthAnchor.constraint(equalToConstant: 400), // Adjust width as needed
////            container.heightAnchor.constraint(lessThanOrEqualToConstant: 400) // Maximum height constraint
////        ])
////
////        self.navigationItem.titleView = container
//        // Create the label
//
//
//                // Create a container view
//                let containerView = UIView()
//                containerView.translatesAutoresizingMaskIntoConstraints = false
//                containerView.addSubview(titleg)
//
//                // Add constraints to label and container view
//                NSLayoutConstraint.activate([
//                    titleg.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//                    titleg.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//                    titleg.topAnchor.constraint(equalTo: containerView.topAnchor),
//                    titleg.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
////                    containerView.widthAnchor.constraint(equalToConstant: 200)
//                ])
//
//                // Adjust the height constraint of the container view
//                containerView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
//
//                // Set the custom title view
//                self.navigationItem.titleView = containerView
//        let dq = DispatchQueue(label: "background")
//        dq.perform(#selector(yourMethod), with: nil, afterDelay: 10)
//
//        //self.perform(#selector(yourMethod), on: .main, wait: false, modes: [.default])
//    }
//    @objc
//    func yourMethod(){
//        DispatchQueue.main.async {
//            self.titleg.text = "This is a\nmultiline string for the navBar third line\nfourth line\nfifth line"
//        }
//
//
//    }
//
//}

