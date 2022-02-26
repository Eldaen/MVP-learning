//
//  SearchSongsInteractor.swift
//  MVPLearning
//
//  Created by Денис Сизов on 26.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit
import Alamofire

/// Протокол инпута интерактора
protocol SearchSongsInteractorInput: AnyObject {
	
	/// Выполняет поиск песен
	func searchSongs(for query: String, completion: @escaping (AFResult<[ITunesSong]>) -> Void)
	
	/// Загружает картинку
	func getImage(fromUrl url: URLConvertible, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void )
}

/// Протокол аутпута интерактора
protocol SearchSongsInteractorOutput: AnyObject {
	
}

/// Интерактор экрана SearchSongs
final class SearchSongsInteractor {
	weak var interactor: SearchSongsInteractorOutput?
	
	/// Сервис для запросов
	private let searchService = ITunesSearchService()
	
	/// Загрузчик картинок
	let imageDownloader = ImageDownloader()
}

// MARK: - SearchSongsInteractorOutput

extension SearchSongsInteractor: SearchSongsInteractorInput {
	func getImage(fromUrl url: URLConvertible, completion: @escaping (UIImage?, Error?) -> Void) {
		imageDownloader.getImage(fromUrl: url, completion: completion)
	}
	
	func searchSongs(for query: String, completion: @escaping (AFResult<[ITunesSong]>) -> Void) {
		searchService.getSongs(forQuery: query, completion: completion)
	}
}
