//
//  PlaceListCollectionView.swift
//  Offroad-iOS
//
//  Created by 김민성 on 2/14/25.
//

import CoreLocation
import UIKit

import RxSwift
import RxCocoa

class PlaceListCollectionView: UICollectionView, ORBScrollLoadingStyle {
    
    //MARK: - Life Cycle
    
    init() {
        let horizontalInset: CGFloat = 24
        let verticalInset: CGFloat = 20
        let itemWidth = floor(UIScreen.current.bounds.width - horizontalInset * 2)
        
        let flowLayout = UICollectionViewFlowLayout().then { flowLayout in
            flowLayout.scrollDirection = .vertical
            flowLayout.sectionInset = .init(
                top: verticalInset,
                left: horizontalInset,
                bottom: verticalInset,
                right: horizontalInset
            )
            flowLayout.minimumLineSpacing = 16
            flowLayout.minimumInteritemSpacing = 100
            flowLayout.estimatedItemSize = CGSize(width: itemWidth, height: 125)
        }
        
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        
        setupStyle()
        registerCells()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private Extension

private extension PlaceListCollectionView {
    
    //MARK: - Private Func
    
    func setupStyle() {
        backgroundColor = .primary(.listBg)
        indicatorStyle = .black
        contentInsetAdjustmentBehavior = .never
        scrollIndicatorInsets = .zero
    }
    
    func registerCells() {
        register(PlaceCollectionViewCell.self, forCellWithReuseIdentifier: PlaceCollectionViewCell.className)
    }
    
}
