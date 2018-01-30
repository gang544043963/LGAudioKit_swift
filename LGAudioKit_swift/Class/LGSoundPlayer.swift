//
//  LGSoundPlayer.swift
//  LGAudioKit_swift
//
//  Created by ligang on 2018/1/30.
//  Copyright © 2018年 LG. All rights reserved.
//

import UIKit

public enum LGAudioPlayerState: NSInteger {
	case LGAudioPlayerStateNormal/** 未播放状态 */
	case LGAudioPlayerStatePlaying/** 正在播放 */
	case LGAudioPlayerStateCancel/** 播放被取消 */
}

public protocol LGAudioPlayerDelegate: class {
	
	func audioPlayerStateDidChanged(audioPlayerState: LGAudioPlayerState, forIndex: NSInteger)
	
}

public class LGSoundPlayer: NSObject {
	
	static let shared = LGSoundPlayer()
	
    public var URLString: NSString = ""
	
	public var index: NSInteger = 0
	
	public weak var delegate: LGAudioPlayerDelegate?
	
	public func playAudio(URLString: NSString, atIndex: NSInteger) {
		
	}
	
	public func stopAudioPlayer() {
		
	}
}
