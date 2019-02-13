//
//  LGSoundRecorder.swift
//  LGAudioKit_swift
//
//  Created by ligang on 2018/11/20.
//  Copyright © 2018年 LG. All rights reserved.
//

import UIKit
import AVFoundation

@objc public protocol LGSoundRecorderDelegate: class {
	@objc optional func soundRecordFailed() // 录音失败
	@objc optional func soundRecordDidStop() // 录音停止
    @objc optional func soundRecordTooShort() // 录音时间太短（少于1秒）
    @objc optional func soundRecordTimerTicks(second: NSInteger) // 录音过程中，每秒调用一次，返回当前录音时长
}

class LGSoundRecorder: NSObject, AVAudioRecorderDelegate {
	
	static let shared = LGSoundRecorder()
    static let maxLength = 60 //录音时长限制60s
    var recordPath: NSString!
    var audioRecorder: AVAudioRecorder!
    var timer: Timer!
    var recordSeconds: NSInteger = 0
    var delegate: LGSoundRecorderDelegate?
    
    //MARK: Public

	/**
	*  开始录音
	*
	*  @param view 展现录音指示框的父视图
	*  @param path 音频文件保存路径
	*/
	public func startRecord(recordPath: NSString) {
        recordSeconds = 0
        self.recordPath = (recordPath as String) + "/" + String(Date().timeIntervalSince1970) + ".caf" as NSString
		self.startRecord()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.recordSeconds += 1
            self.delegate?.soundRecordTimerTicks?(second: self.recordSeconds)
            if self.recordSeconds == LGSoundRecorder.maxLength {
                self.stopSoundRecord()
            }
            print("正在录音：\(self.recordSeconds)s")
        }
	}
	
	/**
	*  录音结束
	*/
	public func stopSoundRecord() {
        if timer != nil {
            timer.invalidate()
        }
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        self.delegate?.soundRecordDidStop?()
        if self.recordSeconds < 1 {
            self.delegate?.soundRecordTooShort?()
        }
	}
    
    //MARK: Private
    /**
     *  开始录音，AVAudioSession配置
     */
    func startRecord() {
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: URL(string: self.recordPath as String)!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    //MARK: AVAudioRecorderDelegate
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        self.delegate?.soundRecordDidStop?()
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        if timer != nil {
            timer.invalidate()
        }
        self.recordSeconds = 0
        self.delegate?.soundRecordFailed?()
    }
	
}
