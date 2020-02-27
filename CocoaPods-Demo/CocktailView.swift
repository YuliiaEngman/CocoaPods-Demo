//
//  CocktailView.swift
//  CocoaPods-Demo
//
//  Created by Yuliia Engman on 2/27/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit
import SnapKit // library to do programmatic Autolayout

class CocktailView: UIView {
    
    //cocktail name label
    public lazy var cocktaiNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 2
        label.text = "Cocktail Name"
        label.textAlignment = .center
        return label
    }()
    
    //cocktail image
    public lazy var cocktaiImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "photo")
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    public lazy var ingredientsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        label.text = "Ingredients"
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setupCocktailImageConstraints()
        setupCocktailLabelConstraints()
        setupIngredientsLabelConstraints()
    }
    
    private func setupCocktailImageConstraints() {
        addSubview(cocktaiImage)
        
        //no need to use translateAutoresizingMask = false
        //no need to activate
        
        //HERE we making FULL screen
        cocktaiImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(self)
        }
    }
    
    private func setupCocktailLabelConstraints() {
        cocktaiImage.addSubview(cocktaiNameLabel)
        
        cocktaiNameLabel.snp.makeConstraints{ (make) in
            //offset moving down, right 20
            //inset(20)
            make.top.equalTo(self).offset(40)
            make.leading.trailing.equalTo(self).inset(20)
            
           // make.top.leading.bottom.trailing.equalTo(self.safeAreaInsets).inset(20)
        }
    }
    
    private func setupIngredientsLabelConstraints() {
        cocktaiImage.addSubview(ingredientsLabel)
        
        ingredientsLabel.snp.makeConstraints{ (make) in
//            make.top.equalTo(cocktaiImage.snp_bottomMargin)
           // make.leading.trailing.equalTo(self).inset(20)
make.leading.bottom.trailing.equalTo(self.safeAreaInsets).inset(20)
//        }
    }
    }
}

