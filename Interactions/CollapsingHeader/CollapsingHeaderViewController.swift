//
//  CollapsingHeaderViewController.swift
//  Interactions
//
//  Created by Priscilla Bevis on 14/9/17.
//  Copyright © 2017 Priscilla Bevis. All rights reserved.
//

import UIKit

class CollapsingHeaderViewController: UIViewController, UIScrollViewDelegate {
    
    // Navigation/Title
    @IBOutlet private var titleView: UIView!
    @IBOutlet private var titleViewTopConstraint: NSLayoutConstraint!

    // Header view
    @IBOutlet private var headerView: UIView!
    @IBOutlet private var headerHeightConstraint: NSLayoutConstraint!
    
    // Scrolling content area
    @IBOutlet private var scrollView: UIScrollView!
    
    // Options
    private var travellingTitle = true
    
    // TODO: Move some of these to reference their actual constraints?
    private struct Constants {
        static let minHeaderHeight: CGFloat = 0
        static let maxHeaderHeight: CGFloat = 200
        
        static let navigationHeight: CGFloat = 64
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentInset.top = Constants.maxHeaderHeight + headerView.frame.origin.y
        scrollView.contentOffset.y = -Constants.maxHeaderHeight - headerView.frame.origin.y
        scrollView.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func tappedClose(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - State
    
    var headerIsNavigationBar: Bool {
        return true
    }
    
    // MARK: - Scrolling
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset

        // While the offset is below zero, the header view has still not fully collapsed so continue collapsing or expanding header.
        if offset.y < 0 {
            print("offset below zero")
            let height = -offset.y //+ headerView.frame.origin.y)
            headerHeightConstraint.constant = height
            titleViewTopConstraint.constant = height
        }
        
        if travellingTitle {
            if headerHeightConstraint.constant <= Constants.minHeaderHeight {
                // We've hit the minimum size the header will be so need to start pushing the title label into or off the header and into/off the fixed navigation area

//                let statusBarHeight: CGFloat = 16
//                let middelOfNav = (Constants.navigationHeight + statusBarHeight - headerTitleLabel.frame.height)/2
//                let positionOfScrollingTitle = -(offset.y) + scrollingTitleLabelConstraint.constant
//
//                headerTitleConstraint.constant = (positionOfScrollingTitle < middelOfNav ? middelOfNav : positionOfScrollingTitle)
//                headerTitleLabel.alpha = (positionOfScrollingTitle + scrollingTitleLabel.frame.height > navigationHeight.constant ? 0 : 1)
            }
        }
        
    }
    
}
