﻿/***
SetBackgroundColor 版本:v1.0
简要说明:这家伙很懒什么都没写
创建人:ZЁЯ¤  身高:168cm+;体重:57kg+;未婚(已有女友);最爱的运动:睡觉;格言:路见不平,拔腿就跑;QQ:358315553
创建时间:2010年10月20日 15:10:44 (代码生成器: F:/airs/program files2/CodesGenerater/bin-debug/CodesGenerater.swf) 
历次修改:未有修改
用法举例:这家伙很懒什么都没写
*/
//SetBackgroundColor
//The SetBackgroundColor tag sets the background color of the display.
//The minimum file format version is SWF 1.

//SetBackgroundColor
//Field 			Type 			Comment
//Header 			RECORDHEADER 	Tag type = 9
//BackgroundColor 	RGB 			Color of the display background
package zero.swf.tagBodys{
	import zero.BytesAndStr16;
	import flash.utils.ByteArray;
	public class SetBackgroundColor{
		public var BackgroundColor:int;					//RGB
		//
		public function initByData(data:ByteArray,offset:int,endOffset:int):int{
			BackgroundColor=(data[offset]<<16)|(data[offset+1]<<8)|data[offset+2];
			return offset+3;
		}
		public function toData():ByteArray{
			var data:ByteArray=new ByteArray();
			data[0]=BackgroundColor>>16;
			data[1]=BackgroundColor>>8;
			data[2]=BackgroundColor;
			return data;
		}

		////
		CONFIG::toXMLAndInitByXML {
		public function toXML():XML{
			return <SetBackgroundColor
				BackgroundColor={"0x"+BytesAndStr16._16V[(BackgroundColor>>16)&0xff]+BytesAndStr16._16V[(BackgroundColor>>8)&0xff]+BytesAndStr16._16V[BackgroundColor&0xff]}
			/>;
		}
		public function initByXML(xml:XML):void{
			BackgroundColor=int(xml.@BackgroundColor.toString());
		}
		}//end of CONFIG::toXMLAndInitByXML
	}
}
