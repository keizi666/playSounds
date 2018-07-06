//
//  General.swift
//  norikae
//
//  Created by matsumoto keiji on 2017/05/29.
//  Copyright © 2017年 matsumoto keiji. All rights reserved.
//

import Foundation
import AVFoundation

struct General {
	//現在の日時（年、月、日、時、分、秒）を返す
	static func getNowDateAndTime() -> (Int,Int,Int,Int,Int,Int) {
		let now = Date()
		let cal = Calendar.current
		let dataComps = cal.dateComponents([.year, .month, .day, .hour, .minute], from: now)
		return (dataComps.year!,dataComps.month!,dataComps.day!,dataComps.hour!,dataComps.minute!,dataComps.second!)
	}	

	//URLエンコードをする
	static func urlEncode(url:String) -> String? {
		return url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
	}

	//指定範囲内の乱数を返す
	static func random(lower: Int, upper: Int) -> Int {
		guard upper >= lower else {
			return 0
		}
		
		return (Int)(arc4random_uniform((UInt32)(upper - lower)) + ((UInt32)(lower)))
	}


	//音声ファイルを再生する
	static func playSound(delegate:AVAudioPlayerDelegate,name:String,type:String)->AVAudioPlayer? {
		var audioPlayer:AVAudioPlayer?
		let path:String? = Bundle.main.path(forResource: name, ofType: type)
		
		if let path = path {
			let audioPath = NSURL(fileURLWithPath:path)
			do {
				audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
				if let audioPlayer = audioPlayer {
					audioPlayer.delegate = delegate
					audioPlayer.play()
					return audioPlayer
				}
				else {
					print("AVAudioPlayer error")
				}
			}
			catch {
				print("AVAudioPlayer error")
			}
		}
		else {
			print("AVAudioPlayer error")
		}
		return nil
	}

}

