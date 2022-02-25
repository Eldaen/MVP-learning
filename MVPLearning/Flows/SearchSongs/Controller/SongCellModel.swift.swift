//
//  SongCellModel.swift.swift
//  MVPLearning
//
//  Created by Денис Сизов on 25.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
	let trackName: String
	let artistName: String?
	let artwork: String?
}

final class SongCellModelFactory {
	
	static func cellModel(from model: ITunesSong) -> SongCellModel {
		return SongCellModel(trackName: model.trackName,
							 artistName: model.artistName,
							 artwork: model.artwork >>- { "\($0)" })
	}
}
