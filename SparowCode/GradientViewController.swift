//
//  ViewController.swift
//  SparowCode
//
//  Created by Никита Курюмов on 01.03.23.
//

import UIKit

class GradientViewController: UIViewController {
    //MARK: set needed view's
    
    lazy var gradient: CAGradientLayer = {
        var gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.magenta.cgColor,
            UIColor.cyan.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    private var gradientView: UIView = {
        var view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 8

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
        //MARK: set screen
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "AccentColor")
        view.addSubview(gradientView)
       
    }
    
        //MARK: Set constraints
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientView.widthAnchor.constraint(equalToConstant: 100),
            gradientView.heightAnchor.constraint(equalToConstant: 100),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //MARK: add and set gradient to view as a new subLayer
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientView.layer.insertSublayer(gradient, at: 0)
        gradient.frame = gradientView.bounds
        gradient.cornerRadius = 20
    
    }
}
