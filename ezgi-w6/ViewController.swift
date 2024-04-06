//
//  ViewController.swift
//  ezgi-w6
//
//  Created by Ezgi Sümer Günaydın on 22.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let sections = Bundle.main.decode([Section].self, from: "edevlet.json")
    var collectionView: UICollectionView!
    var datasource: UICollectionViewDiffableDataSource<Section, EDevlet>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemGray6
        view.addSubview(collectionView)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
        collectionView.register(TopCell.self, forCellWithReuseIdentifier: TopCell.reuseIdentifier)
        collectionView.register(HighlightCell.self, forCellWithReuseIdentifier: HighlightCell.reuseIdentifier)
        collectionView.register(BottomCell.self, forCellWithReuseIdentifier: BottomCell.reuseIdentifier)
        
        createDataSource()
        reloadData()
        
    }
    
    
//    MARK:  CONFIGURE
    
    private func configuree<T: EDevletCellProtocol>(_ cellType: T.Type, with edevlet: EDevlet, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: edevlet)
        print(indexPath)
        print(cell)
        return cell
    }
    
    
    //    MARK:  DATASOURCE
    private func createDataSource() {
      
        datasource = UICollectionViewDiffableDataSource<Section, EDevlet>(collectionView: collectionView, cellProvider: { collectionView, indexPath, edevlet in
            switch self.sections[indexPath.section].type {
            case "top":
                return self.configuree(TopCell.self, with: edevlet, for: indexPath)
            case "bottom":
                return self.configuree(BottomCell.self, with: edevlet, for: indexPath)
            default:
                return self.configuree(HighlightCell.self, with: edevlet, for: indexPath)
            }
        })
        
    
        datasource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else {
return nil}
            guard let firstItem = self.datasource?.itemIdentifier(for: indexPath) else {return nil}
            guard let section = self.datasource?.snapshot().sectionIdentifier(containingItem: firstItem) else {return nil}
            
            if section.title.isEmpty {return nil}
            sectionHeader.title.text = section.title
            return sectionHeader
        }
        
    }
    
    //    MARK:  SECTIONS
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment:  .top)
        layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -5, bottom: 0, trailing: 0)
        return layoutSectionHeader
    }
    

    
    private func createTopSection() -> NSCollectionLayoutSection {
        
        
        /*
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5)

        // Yatayda üç öğe sığacak şekilde bir NSCollectionLayoutGroup oluştur
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
        let horizontalLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitems: [layoutItem])

        // Dikeyde iki satır olacak şekilde bir NSCollectionLayoutGroup oluştur
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        let verticalLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitems: [horizontalLayoutGroup,horizontalLayoutGroup])

        let layoutSection = NSCollectionLayoutSection(group: verticalLayoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

        let layoutSectionHeader = createSectionHeader()
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        */
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10 , bottom: 0, trailing: 0 )
        
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(140))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        //HORIZONTOLI DA DENEYECEĞİZ
     
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10 , bottom: 0, trailing: 0 )
        layoutSection.orthogonalScrollingBehavior = .groupPaging
    

        let layoutSectionHeader = createSectionHeader()
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        
    

        return layoutSection
    }
    
    private func createHighLightedSection() -> NSCollectionLayoutSection  {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .fractionalHeight(0.21))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem]) //HORIZONTOLI DA DENEYECEĞİZ
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        
        let layoutSectionHeadar = createSectionHeader()
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10 , bottom: 0, trailing: 0 )
        layoutSection.boundarySupplementaryItems = [layoutSectionHeadar]

        return layoutSection
    }
    
    private func createBottomSection() -> NSCollectionLayoutSection  {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .uniformAcrossSiblings(estimate: 50))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 5)

        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .uniformAcrossSiblings(estimate: 50))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        
        let layoutSectionHeader = createSectionHeader()
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10 , bottom: 0, trailing: 0 )
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

        return layoutSection
    }
    
    //    MARK:  COMP LAYOUT
    private func createCompositionalLayout() -> UICollectionViewLayout {
      
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = self.sections[sectionIndex]
            
            switch section.type {
            case "top":
                return self.createTopSection()
            case "bottom":
                return self.createBottomSection()
            default:
                return self.createHighLightedSection()
            }
            
        }
        return layout
    }
   
    //    MARK:  RELOAD
   private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, EDevlet>()
        snapshot.appendSections(sections)
    
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        datasource?.apply(snapshot)
    }
    
    
}
