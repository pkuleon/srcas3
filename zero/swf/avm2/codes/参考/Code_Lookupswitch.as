/***
Code_Lookupswitch 版本:v1.0
简要说明:这家伙很懒什么都没写
创建人:ZЁЯ¤  身高:168cm+;体重:57kg+;未婚(已有女友);最爱的运动:睡觉;格言:路见不平,拔腿就跑;QQ:358315553
创建时间:2010年7月11日 22:46:59
历次修改:未有修改
用法举例:这家伙很懒什么都没写
*/

package zero.swf.avm2.codes{
	import zero.swf.avm2._classObj.IClassObj;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	import zero.gettersetter.UGetterAndSetter;
	public class Code_Lookupswitch extends Code_BaseBranch implements ICodeObj,IClassObj{
		public var default_labelMark:LabelMark;
		private var default_label_jump_offset_pos:int;
		public var case_labelMark_v:Vector.<LabelMark>;
		private var case_label_jump_offset_pos_v:Vector.<int>;
		//
		public function Code_Lookupswitch(_default_labelMark:LabelMark,_case_labelMark_v:Vector.<LabelMark>){
			pos_offset=0;
			default_labelMark=_default_labelMark;
			case_labelMark_v=_case_labelMark_v;
		}
		//
		override public function writeOffsetsToPos(data:ByteArray):void{
			writeOffsetToPos(data,default_labelMark,default_label_jump_offset_pos);
			var i:int=0;
			for each(var case_labelMark:LabelMark in case_labelMark_v){
				writeOffsetToPos(
					data,
					case_labelMark,
					case_label_jump_offset_pos_v[i++]
				);
			}
		}
		//
		public function toXML(xmlName:String):XML{
			var xml:XML=new XML("<"+Op.op_v[op]+"/>");
			xml.@default_label="default_"+default_labelMark.toString();
			for each(var labelMark:LabelMark in case_labelMark_v){
				xml.appendChild(new XML("<case_"+labelMark.toString()+"/>"));
			}
			return xml;
		}
		override public function toString():String{
			return Op.op_v[op]+" default("+default_labelMark.toString()+") case("+case_labelMark_v.join(",")+")";
		}
		public function getData(data:ByteArray):void{
			data[data.length]=op;
			default_label_jump_offset_pos=getPosAndPutFFFFFFInData(data);
			UGetterAndSetter.setU(case_labelMark_v.length-1,data,data.length);
			case_label_jump_offset_pos_v=new Vector.<int>();
			for each(var labelMark:LabelMark in case_labelMark_v){
				case_label_jump_offset_pos_v[case_label_jump_offset_pos_v.length]=getPosAndPutFFFFFFInData(data);
			}
		}
		public function putObjsInLists():void{}
		public function putMethodsInList():void{}
		public function putStrsInList():void{}
		public function doStrByType():void{}
	}
}

//

// 常忘正则表达式
// /^\s*|\s*$/					//前后空白						"\nabc d  e 哈 哈\t \r".replace(/^\s*|\s*$/g,"") === "abc d  e 哈 哈"
// /[\\\/:*?\"<>|]/				//不合法的windows文件名字符集		"\\\/:*?\"<>|\\\/:*哈 哈?\"<>|\\哈 \/:*?\"<>|".replace(/[\\\/:*?\"<>|]/g,"") === "哈 哈哈 "
// /[a-zA-Z_][a-zA-Z0-9_]*/		//合法的变量名(不考虑中文)
// value=value.replace(/[^a-zA-Z0-9_]/g,"").replace(/^[0-9]*/,"");//替换不合法的变量名
// 先把除字母数字下划线的字符去掉,再把开头的数字去掉
// 想不到怎样能用一个正则表达式搞定...

//正则表达式30分钟入门教程		http://www.unibetter.com/deerchao/zhengzhe-biaodashi-jiaocheng-se.htm
//正则表达式用法及实例			http://eskimo.blogbus.com/logs/29095458.html
//常用正则表达式					http://www.williamlong.info/archives/433.html

/*

//常用值

//常用语句块

*/