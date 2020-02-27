//
//  ViewController.swift
//  CocoaPods-Demo
//
//  Created by Yuliia Engman on 2/27/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit
import Kingfisher

class CocktailViewController: UIViewController {
    
    private let cocktailView = CocktailView()
    
    private lazy var swipeGesture: UISwipeGestureRecognizer = {
      let gesture = UISwipeGestureRecognizer()
        gesture.addTarget(self, action: #selector(fetchCocktail))
        gesture.direction = .left
        return gesture
    }()
    
    override func loadView() {
        view = cocktailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        fetchCocktail()
        
        //setup swipe gesture on coctailImage
        cocktailView.cocktaiImage.isUserInteractionEnabled = true
        cocktailView.cocktaiImage.addGestureRecognizer(swipeGesture)
    }
    
    //shake device to change cocktail
    //this is UIResponder function
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            fetchCocktail()
        }
    }
    
    @objc private func fetchCocktail() {
        APIClient.fetchCocktail{(result) in
            switch result {
            case .failure(let error):
                print("no cocktail: \(error)")
            case .success(let cocktail):
                DispatchQueue.main.async {
                    self.updateUI(cocktail)
                }
            }
        }
    }
    
    private func updateUI(_ cocktail: Cocktail) {
        cocktailView.cocktaiNameLabel.text = cocktail.strDrink
        cocktailView.ingredientsLabel.text = cocktail.ingredients
        guard let imageURL = URL(string: cocktail.strDrinkThumb) else {
            return
        }
        //similar to get image in Kingsfisher is: setImage(with: Resource)
        cocktailView.cocktaiImage.kf.setImage(with: imageURL)
        
        UIView.transition(with: cocktailView.cocktaiImage, duration: 1.0, options: [.transitionFlipFromRight, .curveEaseInOut], animations: {
            self.cocktailView.cocktaiImage.kf.setImage(with: imageURL)
        }, completion: nil)
    }


}

