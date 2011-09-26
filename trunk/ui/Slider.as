﻿package ui {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import ui.manager.ButtonManager;

	/**
	 * ...
	 * @author Akdcl
	 */
	public class Slider extends ProgressBar {
		private static const bM:ButtonManager = ButtonManager.getInstance();
		public var rollOver:Function;
		public var rollOut:Function;
		public var press:Function;
		public var release:Function;

		public var mouseWheelEnabled:Boolean = true;
		protected var timeHolded:uint;
		protected var scale:Number;

		private var __maximum:Number = 100;

		public function get maximum():Number {
			return __maximum;
		}

		public function set maximum(_maximum:Number):void {
			__maximum = _maximum;
			setStyle();
		}
		private var __minimum:Number = 0;

		public function get minimum():Number {
			return __minimum;
		}

		public function set minimum(_minimum:Number):void {
			__minimum = _minimum;
			setStyle();
		}
		private var __snapInterval:Number = 1;

		public function get snapInterval():Number {
			return __snapInterval;
		}

		public function set snapInterval(_snapInterval:Number):void {
			__snapInterval = _snapInterval;
			setStyle();
		}

		public function get isHold():Boolean {
			return timeHolded > 0;
		}

		
		override public function set enabled(_enabled:Boolean):void{
			super.enabled = _enabled;
			if (_enabled) {
				bM.addButton(this);
			}else {
				bM.removeButton(this);
			}
		}
		
		override protected function init():void {
			super.init();
			enabled = true;
			if (txt){
				txt.mouseEnabled = false;
				if (txt.hasOwnProperty("mouseChildren")){
					txt.mouseChildren = false;
				}
				mouseEnabled = false;
			}
		}

		override protected function onAddedToStageHandler(_evt:Event):void {
			super.onAddedToStageHandler(_evt);
			addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelHandler);
		}
		
		override protected function onRemoveToStageHandler():void {
			rollOver = null;
			rollOut = null;
			press = null;
			release = null;
			enabled = false;
			super.onRemoveToStageHandler();
		}

		public function $setStyle(_isActive:Boolean):void {
			if (_isActive){
				bM.setButtonClipPlay(thumb, true);
				bM.setButtonClipPlay(bar, true);
				bM.setButtonClipPlay(track, true);
			} else {
				bM.setButtonClipPlay(thumb, false);
				bM.setButtonClipPlay(bar, false);
				bM.setButtonClipPlay(track, false);
			}
		}

		public function $press():void {
			timeHolded = 0;
			onHoldingHandler(null);
			addEventListener(Event.ENTER_FRAME, onHoldingHandler);
		}

		public function $release():void {
			timeHolded = 0;
			removeEventListener(Event.ENTER_FRAME, onHoldingHandler);
		}

		protected function onMouseWheelHandler(_e:MouseEvent):void {
			if (mouseWheelEnabled && timeHolded == 0){
				value += (_e.delta > 0 ? 10 : -10) * snapInterval;
			}
		}

		protected function onHoldingHandler(_evt:Event):void {
			if (bar){
				value = Math.round((mouseX - bar.x + offXThumb) / scale / snapInterval) * snapInterval + minimum;
			} else {
				value = Math.round(mouseX / scale / snapInterval) * snapInterval + minimum;
			}
			timeHolded++;
		}

		override protected function formatValue(_value:Number):Number {
			if (isNaN(_value)){
				_value = 0;
			}
			if (_value < minimum){
				_value = minimum;
			} else if (_value > maximum){
				_value = maximum;
			}
			return _value;
		}

		override protected function getClipsValue():Number {
			scale = length / (maximum - minimum);
			return Math.round((value - minimum) * scale);
		}
		
		override protected function setLabel(_value:Number):String {
			return Math.round(value)+"";
		}
	}
}