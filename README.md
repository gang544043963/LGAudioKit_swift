# LGAudioKit_swift

[OC版传送门](https://github.com/gang544043963/LGAudioKit)

## sound recorder and player

- 对AVAudioRecorder和AVAudioPlayer进行了封装，只暴露简单整洁的接口
- 内部包含了 **LGSoundPlayer** 和 **LGSoundRecorder** 两个独立类
- 录音文件是.caf格式。如果需要别的格式，自己调配。

demo示例如下：

<img src="https://github.com/gang544043963/MyDataSource/blob/master/LGAudioKit_swift_image1.png" alt="CXLSlideList Screenshot" width="200" height="360"/>  <img src="https://github.com/gang544043963/MyDataSource/blob/master/LGAudioKit_swift_image2.png" alt="CXLSlideList Screenshot" width="200" height="360"/>

## 基本使用
### 开始录音
step1:指定语音文件存储路径
step2:调用startRecord
```
@objc func startRecordVoice() {
		print("startRecordVoice...")
        self .showRecordingHUD()
		let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        LGSoundRecorder.shared.startRecord(recordPath: dirPath as NSString)
	}
```
### 取消录音
```
LGSoundRecorder.shared.stopSoundRecord()
```
### 完成录音
```
LGSoundRecorder.shared.stopSoundRecord()
```
### 获取录音文件路径
```
let recordPath = LGSoundRecorder.shared.recordPath
```
### 获取录音时长
```
let seconds = LGSoundRecorder.shared.recordSeconds
```

- **目前能满足基本的录音和播放功能，正在努力在使其丰满。**
- **希望对swift和音频有爱好的伙伴们贡献代码，能随手给个star那就再好不过了！**
