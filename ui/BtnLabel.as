﻿package ui{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.text.StyleSheet;
	import flash.text.TextFieldAutoSize;
	public class BtnLabel extends Btn {
		public var txt:*;
		public var bar:*;
		public var endClip:*;
		
		protected var widthAdd:int;
		protected var heightAdd:int;
		protected var xOff:int;
		protected var yOff:int;
		
		protected var __widthMax:int;
		[Inspectable(defaultValue=0,type="int",name="0_固定宽")]
		public function set widthMax(_widthMax:int):void {
			__widthMax = _widthMax;
			$setStyle(false);
		}
		protected var __heightMax:int;
		[Inspectable(defaultValue=0,type="int",name="0_固定高")]
		public function set heightMax(_heightMax:int):void {
			__heightMax = _heightMax;
			$setStyle(false);
		}
		private var __label:String;
		public function get label():String {
			return __label;
		}
		[Inspectable(defaultValue="label",type="String",name="文本")]
		public function set label(_label:String):void {
			if (__label!=_label) {
				__label=_label;
				txt.text=__label;
				$setStyle(false);
			}
		}
		[Inspectable(enumeration="left,right,center",defaultValue="left",type="String",name="对齐")]
		public function set autoSize(_autoSize:String):void {
			txt.autoSize = _autoSize;
			$setStyle(false);
		}
		override protected function init():void {
			if (bar) {
				xOff = int(bar.x - txt.x);
				yOff = int(bar.y - txt.y);
			}
			widthAdd = -xOff * 2;
			heightAdd = -yOff * 2;
			super.init();
		}
		override protected function onRemoveToStageHandler():void {
			super.onRemoveToStageHandler();
			txt = null;
			bar = null;
			endClip = null;
		}
		internal function $setStyle(_isActive:Boolean):void {
			if (totalFrames > 8) {
				if (bar) {
					if (txt.autoSize == TextFieldAutoSize.RIGHT) {
					} else if (txt.autoSize == TextFieldAutoSize.CENTER) {
					} else {
					}
				}
			}else {
				if (bar) {
					if (txt.width + widthAdd > __widthMax && txt.width + widthAdd * 0.25 < __widthMax) {
						bar.width = __widthMax;
					}else {
						bar.width = int(txt.width + widthAdd);
					}
					if (txt.autoSize == TextFieldAutoSize.RIGHT) {
						bar.x = -bar.width;
						txt.x = int((txt.width - bar.width) * 0.5);
					} else if (txt.autoSize == TextFieldAutoSize.CENTER) {
						bar.x = -int(bar.width * 0.5);
						txt.x = 0;
					} else {
						bar.x = 0;
						txt.x = -int((txt.width - bar.width) * 0.5);
					}
					bar.y = 0;
					txt.y = bar.y - yOff;
				}
			}
			if (endClip) {
				endClip.x = txt.txt.x + txt.width;
				endClip.mouseEnabled = false;
				endClip.mouseChildren = false;
			}
		}
	}
}