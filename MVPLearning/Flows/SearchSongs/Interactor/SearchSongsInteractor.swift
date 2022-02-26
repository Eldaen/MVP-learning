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
	
	/// Кеш сервис для картинок
	weak var cache: ImageCache?
	
	/// Кеш, если iOS 13 не доступен
	var images: [String : UIImage] = [:]
}

// MARK: - SearchSongsInteractorOutput

extension SearchSongsInteractor: SearchSongsInteractorInput {
	func getImage(fromUrl url: URLConvertible, completion: @escaping (UIImage?, Error?) -> Void) {
		
		if #available(iOS 13.0, *) {
			if let cache = cache,
			   let image = cache[url] {
				completion(image, nil)
				return
			}
		} else {
			if let urlString = try? url.asURL().absoluteString,
			   let image = images[urlString] {
				completion(image, nil)
				return
			}
		}
		
		// Если в кэше нет, то качаем и в кеш добавляем
		imageDownloader.getImage(fromUrl: url) { [weak self] image, error in
			guard let image = image else {
				completion(nil, error)
				return
			}
			
			if #available(iOS 13.0, *) {
				if let cache = self?.cache {
					cache.saveImage(image, for: url)
				}
			} else {
				if let urlString = try? url.asURL().absoluteString {
					self?.images[urlString] = image
				}
			}
			
			completion(image, nil)
		}
	}
	
	func searchSongs(for query: String, completion: @escaping (AFResult<[ITunesSong]>) -> Void) {
		searchService.getSongs(forQuery: query, completion: completion)
	}
}
