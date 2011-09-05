package akdcl.media {
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;

	/**
	 * ...
	 * @author ...
	 */
	final public class ImageProvider extends MediaProvider {
		private static const DEFAULT_TOTAL_TIME:uint = 5000;
		
		override public function get loadProgress():Number {
			return playContent ? playContent.loadProgress : 0;
		}

		private var __totalTime:uint = DEFAULT_TOTAL_TIME;
		override public function get totalTime():uint {
			return __totalTime;
		}
		override public function get bufferProgress():Number {
			return loadProgress;
		}

		override public function get position():uint {
			return timer.currentCount * timer.delay;
		}

		public function set container(_container:DisplayObjectContainer):void {
			if (_container){
				_container.addChild(playContent);
			} else if (playContent.parent){
				playContent.parent.removeChild(playContent);
			}
		}

		public function updateRect(_rect:Rectangle = null):void {
			if (_rect){
				playContent.x = _rect.x;
				playContent.y = _rect.y;
				playContent.areaRect.width = _rect.width;
				playContent.areaRect.height = _rect.height;
				playContent.updateRect();
			}
		}

		override protected function init():void {
			super.init();
			playContent = new DisplayLoader();
			playContent.autoRemove = false;
			playContent.addEventListener(IOErrorEvent.IO_ERROR, onLoadErrorHandler);
			playContent.addEventListener(ProgressEvent.PROGRESS, onLoadProgressHandler);
			playContent.addEventListener(ProgressEvent.PROGRESS, onBufferProgressHandler);
			playContent.addEventListener(Event.COMPLETE, onLoadCompleteHandler);
		}

		override public function remove():void {
			playContent.remove();
			super.remove();
		}

		override public function load(_item:*):void {
			if (_item is PlayItem) {
				__totalTime = _item.totalTime || DEFAULT_TOTAL_TIME;
				playContent.load(_item.source);
			}else {
				__totalTime = DEFAULT_TOTAL_TIME;
				playContent.load(_item);
			}
			super.load(_item);
			timer.stop();
		}

		override public function pause():void {
			timer.stop();
			super.pause();
		}

		override public function stop():void {
			timer.reset();
			timer.stop();
			super.stop();
		}

		override protected function onLoadCompleteHandler(_evt:* = null):void {
			timer.start();
			super.onLoadCompleteHandler(_evt);
		}

		override protected function onPlayProgressHander(_evt:* = null):void {
			if (loadProgress == 1){
				if (position >= totalTime && !(_evt is String)) {
					onPlayCompleteHandler();
				} else {
					super.onPlayProgressHander(_evt);
				}
			} else {
				timer.reset();
				timer.stop();
			}
		}
	}

}