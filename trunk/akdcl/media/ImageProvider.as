package akdcl.media {
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;

	import akdcl.manager.RequestManager;

	/**
	 * ...
	 * @author ...
	 */
	/// @eventType	akdcl.media.MediaEvent.DISPLAY_CHANGE
	[Event(name="displayChange",type="akdcl.media.MediaEvent")]
	final public class ImageProvider extends MediaProvider {
		private static const DEFAULT_TOTAL_TIME:uint = 5000;

		protected static var rM:RequestManager = RequestManager.getInstance();

		public var displayContent:BitmapData;
		private var __loadProgress:Number = 0;

		override public function get loadProgress():Number {
			return __loadProgress;
		}

		private var __totalTime:uint = DEFAULT_TOTAL_TIME;

		override public function get totalTime():uint {
			return __totalTime;
		}

		override public function get bufferProgress():Number {
			return __loadProgress;
		}

		override public function get position():uint {
			return timer.currentCount * timer.delay;
		}

		override public function remove():void {
			if (playItem){
				rM.unloadDisplay(playItem.source, onLoadCompleteHandler, onLoadErrorHandler, onLoadProgressHandler);
			}
			super.remove();
		}

		override protected function loadHandler():void {
			__loadProgress = 0;
			timer.stop();
			rM.loadDisplay(playItem.source, onLoadCompleteHandler, onLoadErrorHandler, onLoadProgressHandler);
		}

		override protected function pauseHandler():void {
			timer.stop();
		}

		override protected function stopHandler():void {
			timer.reset();
			timer.stop();
		}

		override protected function onLoadProgressHandler(_evt:* = null):void {
			if (_evt){
				__loadProgress = _evt.bytesLoaded / _evt.bytesTotal;
			} else {
				__loadProgress = 1;
			}
			if (isNaN(__loadProgress)){
				__loadProgress = 0;
			}
			onBufferProgressHandler();
			super.onLoadProgressHandler(_evt);
		}

		override protected function onLoadCompleteHandler(_evt:* = null):void {
			playContent = _evt;
			onDisplayChange();
			timer.start();
			super.onLoadCompleteHandler(null);
		}

		override protected function onPlayProgressHander(_evt:* = null):void {
			if (loadProgress == 1) {
				if (position >= totalTime) {
					onPlayCompleteHandler();
				} else {
					super.onPlayProgressHander(_evt);
				}
			} else {
				//loadProgress为1以前，都不播放
				timer.reset();
				timer.stop();
			}
		}

		private function onDisplayChange():void {
			//加载显示对象
			displayContent = playContent;
			if (hasEventListener(MediaEvent.DISPLAY_CHANGE)){
				dispatchEvent(new MediaEvent(MediaEvent.DISPLAY_CHANGE));
			}
		}
	}

}