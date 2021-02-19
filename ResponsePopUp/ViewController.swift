//
//  ViewController.swift
//  ResponsePopUp
//
//  Created by Richard Lam on 19/2/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var superView: UIView!
    
    @IBOutlet weak var correctResponseImage: UIImageView!
    
    @IBOutlet weak var incorrectResponseImage: UIImageView!
    
    @IBOutlet weak var answersView: UIView!
    
    @IBOutlet weak var questionView: UIStackView!
    
    @IBAction func incorrectAnswerTrigger(_ sender: UIButton) {
        displayResponseWithAd(isCorrect: false)
    }
    
    
    @IBAction func correctAnswerTriggered(_ sender: UIButton) {
        displayResponseWithAd(isCorrect: true)
    }
    
    
    func displayResponseWithAd(isCorrect : Bool) {
        let answerResponseView : UIView = (isCorrect) ? self.correctResponseImage: self.incorrectResponseImage
        
        superView.bringSubviewToFront(answersView)
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.superView.bringSubviewToFront(answerResponseView)
            answerResponseView.alpha = 1
            answerResponseView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
        } completion: { (_) in
            answerResponseView.alpha = 0
            answerResponseView.transform = CGAffineTransform.identity
            self.superView.bringSubviewToFront(self.questionView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        superView.bringSubviewToFront(questionView)
        
        correctResponseImage.alpha = 0
        incorrectResponseImage.alpha = 0
        
    }


}

