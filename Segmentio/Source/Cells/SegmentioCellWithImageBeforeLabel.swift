//
//  SegmentioCellWithImageBeforeLabel.swift
//  Segmentio
//
//  Created by Dmitriy Demchenko
//  Copyright © 2016 Yalantis Mobile. All rights reserved.
//

import UIKit

class SegmentioCellWithImageBeforeLabel: SegmentioCell {
    
    override func setupConstraintsForSubviews() {
        super.setupConstraintsForSubviews()
        guard let imageContainerView = imageContainerView else {
            return
        }
        guard let containerView = containerView else {
            return
        }
        
        let metrics = ["labelHeight": SegmentioCell.segmentTitleLabelHeight]
        let views = [
            "imageContainerView": imageContainerView,
            "containerView": containerView
        ]
        
        // main constraints
        if let segmentImageViewVerticalConstraint = segmentImageViewVerticalConstraint {
            NSLayoutConstraint.deactivate(segmentImageViewVerticalConstraint)
        }
        segmentImageViewVerticalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[imageContainerView(labelHeight)]",
            options: [.alignAllCenterY],
            metrics: metrics,
            views: views)
        NSLayoutConstraint.activate(segmentImageViewVerticalConstraint!)
        
        if let contentViewHorizontalConstraints = contentViewHorizontalConstraints {
            NSLayoutConstraint.deactivate(contentViewHorizontalConstraints)
        }
        contentViewHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "|[imageContainerView(labelHeight)][containerView]|",
            options: [.alignAllCenterY],
            metrics: metrics,
            views: views)
        NSLayoutConstraint.activate(contentViewHorizontalConstraints!)
        
        // custom constraints
        
        topConstraint = NSLayoutConstraint(
            item: containerView,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: padding
        )
        topConstraint?.isActive = true
        
        bottomConstraint = NSLayoutConstraint(
            item: contentView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .bottom,
            multiplier: 1,
            constant: padding
        )
        bottomConstraint?.isActive = true
    }
    
}
