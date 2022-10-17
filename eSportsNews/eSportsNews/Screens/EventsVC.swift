//
//  EventsVC.swift
//  eSportsNews
//
//  Created by Batuhan Kocak on 12.10.2022.
//

import UIKit

class EventsVC: UIViewController {
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<SectionLayout, Events>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        configureSnapshot()
    }
    
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.backgroundColor = Color.backgroundColor
        
        collectionView.register(GamesCell.self, forCellWithReuseIdentifier: GamesCell.reuseID)
        collectionView.register(MatchesCell.self, forCellWithReuseIdentifier: MatchesCell.reuseID)
        collectionView.register(ResultsCell.self, forCellWithReuseIdentifier: ResultsCell.reuseID)
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: EventCell.reuseID)
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.reuseID)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    func configureSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionLayout, Events>()
        snapshot.appendSections([.games, .matches, .results, .events])
        snapshot.appendItems(Events.games, toSection: .games)
        snapshot.appendItems(Events.matches, toSection: .matches)
        snapshot.appendItems(Events.matchResults, toSection: .results)
        snapshot.appendItems(Events.events, toSection: .events)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let sectionIdentifier = self.dataSource.snapshot().sectionIdentifiers[sectionIndex]
            return sectionIdentifier.layoutSection(with: layoutEnvironment)
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionLayout, Events>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Events) -> UICollectionViewCell? in
            guard let sectionIdentifier = self.dataSource.snapshot().sectionIdentifier(containingItem: item) else {
                return nil
            }
            switch sectionIdentifier {
            case .games:
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GamesCell.reuseID, for: indexPath) as! GamesCell
                cell.set(event: Events.games[indexPath.item])
                return cell
                
            case .matches:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchesCell.reuseID, for: indexPath) as! MatchesCell
                cell.set(matchData: Events.matches[indexPath.item])
                return cell
                
            case .results:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultsCell.reuseID, for: indexPath) as! ResultsCell
                cell.set(resultData: Events.matchResults[indexPath.item])
                return cell
            case .events:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.reuseID, for: indexPath) as! EventCell
                cell.set(event: Events.events[indexPath.item])
                return cell
            }
            
        }
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            if kind == UICollectionView.elementKindSectionHeader {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.reuseID, for: indexPath) as! HeaderReusableView
                header.set(headerTitle: SectionLayout.sectionTitles[indexPath.section])
                return header
            } else {
                return nil
            }
        }
    }
    
}
