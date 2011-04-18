package akdcl.utils {
	import com.adobe.serialization.json.JSON;
	import akdcl.utils.replaceString;
	/**
	 * ...
	 * @author Akdcl
	 */
	public function traceObject(...args):void {
		var _str:String = "";
		
		for (var _i:uint; _i < args.length; _i++ ) {
			var _eachStr:String;
			var _obj:*= args[_i];
			switch(_obj?_obj["constructor"]:_obj) {
				case Object:
				case Array:
					_eachStr = replaceString(JSON.encode(_obj),",{",",\n{");
					break;
				default:
					_eachStr = _obj + "\n";
					break;
			}
			_str += _eachStr;
		}
		trace(_str);
	}
}