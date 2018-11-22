//
//  LGSoundRecorder.swift
//  LGAudioKit_swift
//
//  Created by ligang on 2018/1/30.
//  Copyright © 2018年 LG. All rights reserved.
//

import UIKit
import AVFoundation

public protocol LGSoundRecorderDelegate: class {
	func showSoundRecordFailed()
	func didStopSoundRecord()
}

class LGSoundRecorder: NSObject {
	
	static let shared = LGSoundRecorder()

	/**
	*  开始录音
	*
	*  @param view 展现录音指示框的父视图
	*  @param path 音频文件保存路径
	*/
	public func startRecord(superView: UIView, recordPath: NSString) {
		_ = AVAudioSession.sharedInstance()
	}
	
	/**
	*  录音结束
	*/
	public func stopSoundRecord(superView: UIView) {
		
	}
	
	/**
	*  更新录音显示状态,手指向上滑动后 提示松开取消录音
	*/
	public func soundRecordFailed(superView: UIView) {
		
	}
	
	/**
	*  更新录音状态,手指重新滑动到范围内,提示向上取消录音
	*/
	public func readyCancelSound() {
		
	}
	
	/**
	*  更新录音状态,手指重新滑动到范围内,提示向上取消录音
	*/
	public func resetNormalRecord() {
		
	}
	
	/**
	*  录音时间过短
	*/
	public func showShotTimeSign(superView: UIView) {
		
	}
	
	/**
	*  最后10秒，显示你还可以说X秒
	*
	*  @param countDown X秒
	*/
	public func showCountdown(countDown: NSInteger) {
		
	}
	
}
