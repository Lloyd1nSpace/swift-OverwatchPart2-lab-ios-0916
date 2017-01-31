//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by Lloyd W. Sykes on 1/29/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroScrollView: UIScrollView!
    
    var offenseHeroImages = [UIImage]()
    var defenseHeroImages = [UIImage]()
    var tankHeroImages = [UIImage]()
    var supportHeroImages = [UIImage]()
    
    var characterImageView: UIImageView!
    
    
    
    var game: Game = Game()
    var heroType: HeroType! {
        didSet {
            game.heroType = heroType
            updateStackViewWithHeroes()
        }
    }
    
    override func viewDidLoad() {
        heroScrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        heroType = .offense
    }
    
    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            heroType = .defense
        case 2:
            heroType = .tank
        case 3:
            heroType = .support
        default:
            heroType = .offense
        }
    }
    
    func updateStackViewWithHeroes() {
        // Offense & Defense have 6 characters
        // Tank & Support have 5 characters
        // For each heroType I need to: adjust the widthConstraint of the stack view, addArrangedSubviews of UIImageViews corressponding with heroType as well as removeArrangedSubviews of previous heroes
        // Using the scrollViewDelegate, I need to also update the labels to correspond with the UIImageViews
        

        if heroType == .offense {
            for offenseHero in game.offenseCharacters {
                //                    characterImageView.removeFromSuperview()
                
                offenseHeroImages.append(offenseHero.produceProfileImage())
                
                
                heroNameLabel.text = offenseHero.name.description
                characterImageView = UIImageView(image: offenseHero.produceProfileImage())
//                characterStackView.addArrangedSubview(characterImageView)
                characterStackViewWidthConstraint.constant *= 6
//                imageViewConstraints()
            }
        } else if heroType == .defense {
            for defenseHero in game.defenseCharacters {
                
                
                defenseHeroImages.append(defenseHero.produceProfileImage())
                
                
//                characterImageView.removeFromSuperview()
                characterStackView.removeArrangedSubview(characterImageView)
                heroNameLabel.text = defenseHero.name.description
                characterImageView = UIImageView(image: defenseHero.produceProfileImage())
                characterStackView.addArrangedSubview(characterImageView)
                characterStackViewWidthConstraint.constant *= 6
                imageViewConstraints()
            }
        } else if heroType == .tank {
            for tankHero in game.tankCharacters {
                
                tankHeroImages.append(tankHero.produceProfileImage())
                
                
//                characterImageView.removeFromSuperview()
                characterStackView.removeArrangedSubview(characterImageView)
                heroNameLabel.text = tankHero.name.description
                characterImageView = UIImageView(image: tankHero.produceProfileImage())
                characterStackView.addArrangedSubview(characterImageView)
                characterStackViewWidthConstraint.constant *= 4
                imageViewConstraints()
            }
        } else if heroType == .support {
            for supportHero in game.supportCharacters {
                
                supportHeroImages.append(supportHero.produceProfileImage())
                
                
//                characterImageView.removeFromSuperview()
                characterStackView.removeArrangedSubview(characterImageView)
                heroNameLabel.text = supportHero.name.description
                characterImageView = UIImageView(image: supportHero.produceProfileImage())
                characterStackView.addArrangedSubview(characterImageView)
                characterStackViewWidthConstraint.constant *= 4
                imageViewConstraints()
            }
        }
        
        
        
        
        
        
    }
    
    
    func imageViewConstraints() {
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        characterImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        //        characterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        //        characterImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        //        characterImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        //        characterImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
}

extension SelectionViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
        
        
    }
    
}
