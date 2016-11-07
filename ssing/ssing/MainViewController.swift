//
//  ViewController.swift
//  ssing
//
//  Created by 김승중 on 2016. 11. 7..
//  Copyright © 2016년 slogup. All rights reserved.
//

import UIKit
import KYDrawerController

class MainViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var swapPopularityFeedOrderButton: UIButton!
    @IBOutlet weak var swapDistanceFeedOrderButton: UIButton!
    
    lazy var feedVCOrderByPopularity:SurveyFeedViewController = {
        
        let feedVCByPopularity = self.instantiateFeedViewController(byOrderType: .ByPopularity)
        self.addViewControllerAsChild(childViewController: feedVCByPopularity)
        return feedVCByPopularity
        
    }()
    
    lazy var feedVCOrderByDistance:SurveyFeedViewController = {
        
        let feedVCByDistance = self.instantiateFeedViewController(byOrderType: .ByDistance)
        self.addViewControllerAsChild(childViewController: feedVCByDistance)
        
        return feedVCByDistance
        
    }()
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpHeaderButtonActions()
        swapPopularityFeedOrderButton.sendActions(for: .touchUpInside)
        
    }
    
    //MARK: - Private Functions
    
    private func instantiateFeedViewController(byOrderType orderType:FeedOrder) -> SurveyFeedViewController{
        
        let storyboard = UIStoryboard(name: StoryboardNames.main, bundle: nil)
        let feedVC = storyboard.instantiateViewController(withIdentifier: StoryboardIds.SurveyFeedViewController) as! SurveyFeedViewController
        
        feedVC.feedOrder = orderType
        return feedVC
    }
    
    private func addViewControllerAsChild(childViewController:UIViewController) {
        
        self.addChildViewController(childViewController)
        containerView.addSubview(childViewController.view)
        
        childViewController.view.frame = containerView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        childViewController.didMove(toParentViewController: self)
    }
    
    private func setUpHeaderButtonActions() {
        
        swapPopularityFeedOrderButton.addTarget(self, action: #selector(pushOrderSwapButton(_:)), for: .touchUpInside)
        swapDistanceFeedOrderButton.addTarget(self, action: #selector(pushOrderSwapButton(_:)), for: .touchUpInside)
    }
    
    private func swapView() {
        
        if feedVCOrderByPopularity.view.isHidden {
           
            feedVCOrderByPopularity.view.isHidden = false
            feedVCOrderByDistance.view.isHidden = true
        }
        else {
            
            feedVCOrderByPopularity.view.isHidden = true
            feedVCOrderByDistance.view.isHidden = false
        }
    }
    
    //MARK:- Control Actions
    
    @IBAction func pushDrawerMenuButton(_ sender: Any) {
        
        
        if let navController = self.navigationController {
            
            if let drawerVC = navController.parent as? KYDrawerController {
                
                switch drawerVC.drawerState {
                case .opened:
                    drawerVC.setDrawerState(.closed, animated: true)
                case .closed:
                    drawerVC.setDrawerState(.opened, animated: true)
                }
            }
        }
    }
    
    func pushOrderSwapButton(_ sender:UIButton) {
        
        if !sender.isSelected {
            
            sender.isSelected = true
            sender.backgroundColor = Colors.ssingBlack
            if sender == swapPopularityFeedOrderButton {
                
                swapDistanceFeedOrderButton.isSelected = false
                swapDistanceFeedOrderButton.backgroundColor = UIColor.white
            }
            else {
                
                swapPopularityFeedOrderButton.isSelected = false
                swapPopularityFeedOrderButton.backgroundColor = UIColor.white
            }
            
            swapView()
        }
    }
    
}

