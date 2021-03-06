//
//  FSPagerViewCollectionView.swift
//  FSPagerView
//
//  Created by Wenchao Ding on 24/12/2016.
//  Copyright © 2016 Wenchao Ding. All rights reserved.
//
//  1. Reject -[UIScrollView(UIScrollViewInternal) _adjustContentOffsetIfNecessary]
//  2. Group initialized features

import UIKit

class FSPagerViewCollectionView: UICollectionView {
    
    fileprivate weak var pagerView: FSPagerView? {
        return self.superview?.superview as? FSPagerView
    }
    
    override var scrollsToTop: Bool {
        set {
            super.scrollsToTop = false
        }
        get {
            return false
        }
    }
    
    override var contentInset: UIEdgeInsets {
        set {
            super.contentInset = .zero
            if (newValue.top > 0) {
                let contentOffset = CGPoint(x:self.contentOffset.x, y:self.contentOffset.y+newValue.top);
                self.contentOffset = contentOffset
            }
        }
        get {
            return super.contentInset
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    fileprivate func commonInit() {
        self.contentInset = .zero
        self.scrollsToTop = false
        self.isPagingEnabled = false
        self.decelerationRate = UIScrollViewDecelerationRateFast
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
}
