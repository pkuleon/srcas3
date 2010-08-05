package ui_2
{
	
	/**
	 * ...
	 * @author Akdcl
	 */
	public class Contents
	{
		public var onIDChange:Function;
		private var __id:int;
		public function get id():int{
			return __id;
		}
		public function set id(_id:int):void{
			if (_id<0) {
				_id = length - 1;
			}else if (_id > length - 1) {
				_id = 0;
			}
			if (__id==_id) {
				return;
			}
			__id = _id;
			if (onIDChange!=null) {
				onIDChange(__id);
			}
		}
		private var __length:uint;
		public function get length():uint{
			return __length;
		}
		public function set length(_length:uint):void{
			__length=_length;
		}
	}
	
}