﻿package ui {
	import flash.events.Event;
	import flash.external.ExternalInterface;
	
	import akdcl.net.getURL;

	import ui.UIMovieClip;
	import ui.manager.ButtonManager;

	/**
	 * ...
	 * @author Akdcl
	 */
	public class Btn extends UIMovieClip {
		public var rollOver:Function;
		public var rollOut:Function;
		public var press:Function;
		public var release:Function;

		public var area:*;
		
		public var href:*;
		public var hrefTarget:String = "_blank";
		public var eEval:String;

		override public function set enabled(_enabled:Boolean):void {
			super.enabled = _enabled;
			if (_enabled){
				ButtonManager.addButton(this);
			} else {
				ButtonManager.removeButton(this);
			}
		}
		private var __group:String;

		public function get group():String {
			return __group;
		}

		public function set group(_group:String):void {
			if (__group && _group == __group){
				return;
			}
			if (__group){
				ButtonManager.removeFromGroup(__group, this);
			}
			__group = _group;
			if (__group){
				ButtonManager.addToGroup(__group, this);
			}
		}

		public function get select():Boolean {
			return selected;
		}

		public function set select(_selected:Boolean):void {
			selected = _selected;
		}
		private var __selected:Boolean;

		public function get selected():Boolean {
			return __selected;
		}

		public function set selected(_selected:Boolean):void {
			if (__selected == _selected){
				return;
			}
			__selected = _selected;
			if (__group){
				if (__selected){
					if (ButtonManager.selectItem(__group, this)){
					} else {
						return;
					}
				} else {
					ButtonManager.unselectItem(__group, this);
				}
			}
			ButtonManager.setButtonStyle(this);
		}

		public function $release():void {
			if (href){
				getURL(href, hrefTarget);
			} else if (eEval){
				ExternalInterface.call("eval", eEval);
			}
		}

		override protected function init():void {
			super.init();
			enabled = true;
			if (area){
				var _length:uint = area.numChildren;
				for (var _i:uint; _i < _length; _i++){
					area.getChildAt(_i).visible = false;
				}
				mouseChildren = false;
				hitArea = area;
			}
			stop();
		}

		override protected function onRemoveToStageHandler():void {
			rollOver = null;
			rollOut = null;
			press = null;
			release = null;

			href = null;
			hrefTarget = null;
			eEval = null;
			area = null;
			group = null;
			enabled = false;
			super.onRemoveToStageHandler();
		}
	}

}