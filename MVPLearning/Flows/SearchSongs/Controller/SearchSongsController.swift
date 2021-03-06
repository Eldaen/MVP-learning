//
//  SearchSongsController.swift
//  MVPLearning
//
//  Created by Денис Сизов on 25.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Контроллер поиска песен
final class SearchSongsController: UIViewController {
	
	/// Презентер поиска песен
	private let searchSongsPresenter: SearchSongsViewOutput
	
	private var searchView: SearchSongView {
		return self.view as! SearchSongView
	}
	
	/// Результаты поиска
	var searchResults = [ITunesSong]() {
		didSet {
			searchView.tableView.isHidden = false
			searchView.tableView.reloadData()
			searchView.searchBar.resignFirstResponder()
		}
	}
	
	private struct Constants {
		static let reuseIdentifier = "reuseId"
	}
	
	// MARK: - Init
	
	init(presenter: SearchSongsViewOutput) {
		self.searchSongsPresenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Life Cycle
	
	override func loadView() {
		super.loadView()
		self.view = SearchSongView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.navigationBar.prefersLargeTitles = true
		configureTableView()
	}
	
	// MARK: - Private methods
	
	private func configureTableView() {
		self.searchView.searchBar.delegate = self
		self.searchView.tableView.register(SongCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
		self.searchView.tableView.delegate = self
		self.searchView.tableView.dataSource = self
	}
	
}

// MARK: - UITableViewDataSource

extension SearchSongsController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		searchResults.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
				as? SongCell else {
					return UITableViewCell()
				}
		
		let song = self.searchResults[indexPath.row]
		let cellModel = SongCellModelFactory.cellModel(from: song)
		cell.configure(with: cellModel)
		searchSongsPresenter.downloadImage(for: cell, using: cellModel)
		return cell
	}
}

// MARK: - UITableViewDelegate

extension SearchSongsController: UITableViewDelegate {
	
}

// MARK: - UISearchBarDelegate

extension SearchSongsController: UISearchBarDelegate {
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let query = searchBar.text else {
			searchBar.resignFirstResponder()
			return
		}
		if query.count == 0 {
			searchBar.resignFirstResponder()
			return
		}
		
		searchSongsPresenter.viewDidSearch(with: query)
	}
}

// MARK: - SearchViewOutput

extension SearchSongsController: SearchSongsViewInput {
	func showError(error: Error) {
		
	}
	
	func showNoResults() {
		
	}
	
	func hideNoResults() {
		
	}
	
	func throbber(show: Bool) {
		
	}
}
