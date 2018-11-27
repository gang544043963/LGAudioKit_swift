//
//  LGSoundPlayer.swift
//  LGAudioKit_swift
//
//  Created by ligang on 2018/11/20.
//  Copyright © 2018年 LG. All rights reserved.
//

import UIKit
import AVFoundation

public enum LGAudioPlayerState: NSInteger {
	case LGAudioPlayerStateNormal/** 未播放状态 */
	case LGAudioPlayerStatePlaying/** 正在播放 */
	case LGAudioPlayerStateCancel/** 播放被取消 */
}

public protocol LGAudioPlayerDelegate: class {
	
	func audioPlayerStateDidChanged(audioPlayerState: LGAudioPlayerState, forIndex: NSInteger)
	
}

public class LGSoundPlayer: NSObject, AVAudioPlayerDelegate {
	
	static let shared = LGSoundPlayer()
    
    var audioEngine: AVAudioEngine!
    
    var audioPlayerNode: AVAudioPlayerNode!
    
    var audioPlayer: AVAudioPlayer!
    
    var audioPlayerState = LGAudioPlayerState.LGAudioPlayerStateNormal
    
    
	
    public var URLString: NSString = ""
	
	public var index: NSInteger = 0
	
	public weak var delegate: LGAudioPlayerDelegate?
	
	public func playAudio(URLString: NSString, atIndex: NSInteger) {
        if URLString == "" {
            return
        }
        let audioData = NSData.dataWithContentsOfMappedFile(URLString as String)
        
        try! audioPlayer = AVAudioPlayer.init(data: audioData as! Data)
        audioPlayer.volume = 1.0
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        audioPlayerState = LGAudioPlayerState.LGAudioPlayerStatePlaying
	}
	
	public func stopAudioPlayer() {
		audioPlayerState = LGAudioPlayerState.LGAudioPlayerStateCancel
	}
    
    //MARK: AVAudioPlayerDelegate
    
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayerState = LGAudioPlayerState.LGAudioPlayerStateNormal
    }
    
    public func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        audioPlayerState = LGAudioPlayerState.LGAudioPlayerStateNormal
    }
}
