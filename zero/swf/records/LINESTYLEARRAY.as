﻿/***
LINESTYLEARRAY 版本:v1.0
简要说明:这家伙很懒什么都没写
创建人:ZЁЯ¤  身高:168cm+;体重:57kg+;未婚(已有女友);最爱的运动:睡觉;格言:路见不平,拔腿就跑;QQ:358315553
创建时间:2010年10月20日 16:08:28 (代码生成器: F:/airs/program files2/CodesGenerater/bin-debug/CodesGenerater.swf) 
历次修改:未有修改
用法举例:这家伙很懒什么都没写
*/
//A line style array is exactly the same as a fill style array except it stores line styles. Here is the
//file description:
//LINESTYLEARRAY
//Field 					Type 											Comment
//LineStyleCount 			UI8 											Count of line styles
//LineStyleCountExtended 	If LineStyleCount = 0xFF UI16 					Extended count of line styles
//LineStyles 				If Shape1, Shape2, or Shape3, LINESTYLE[count]	Array of line styles
//							If Shape4, LINESTYLE2[count] 					
package zero.swf.records{
	import zero.swf.records.LINESTYLE;
	import flash.utils.ByteArray;
	public class LINESTYLEARRAY extends Record{
		public var LineStylesV:Vector.<LINESTYLE>;
		//
		override public function initByData(data:ByteArray,offset:int,endOffset:int):int{
			//#offsetpp
			
			var LineStyleCount:int=data[offset++];
			if(LineStyleCount==0xff){
				LineStyleCount=data[offset++]|(data[offset++]<<8);
			}
			LineStylesV=new Vector.<LINESTYLE>(LineStyleCount);
			for(var i:int=0;i<LineStyleCount;i++){
			
				LineStylesV[i]=new LINESTYLE();
				offset=LineStylesV[i].initByData(data,offset,endOffset);
			}
			return offset;
		}
		override public function toData():ByteArray{
			var data:ByteArray=new ByteArray();
			var LineStyleCount:int=LineStylesV.length;
			var offset:int=0;
			if(LineStyleCount<0xff){
				data[offset++]=LineStyleCount;
			}else{
				data[offset++]=0xff;
				data[offset++]=LineStyleCount;
				data[offset++]=LineStyleCount>>8;
			}
			
			data.position=offset;
			for each(var LineStyles:LINESTYLE in LineStylesV){
				data.writeBytes(LineStyles.toData());
			}
			return data;
		}

		////
		CONFIG::toXMLAndInitByXML {
		override public function toXML():XML{
			var xml:XML=<LINESTYLEARRAY>
				<LineStylesList/>
			</LINESTYLEARRAY>;
			if(LineStylesV.length){
				var listXML:XML=xml.LineStylesList[0];
				listXML.@count=LineStylesV.length;
				for each(var LineStyles:LINESTYLE in LineStylesV){
					var itemXML:XML=<LineStyles/>;
					itemXML.appendChild(LineStyles.toXML());
					listXML.appendChild(itemXML);
				}
			}else{
				delete xml.LineStylesList;
			}
			return xml;
		}
		override public function initByXML(xml:XML):void{
			if(xml.LineStylesList.length()){
				var listXML:XML=xml.LineStylesList[0];
				var LineStylesXMLList:XMLList=listXML.LineStyles;
				var i:int=-1;
				LineStylesV=new Vector.<LINESTYLE>(LineStylesXMLList.length());
				for each(var LineStylesXML:XML in LineStylesXMLList){
					i++;
					LineStylesV[i]=new LINESTYLE();
					LineStylesV[i].initByXML(LineStylesXML.children()[0]);
				}
			}else{
				LineStylesV=new Vector.<LINESTYLE>();
			}
		}
		}//end of CONFIG::toXMLAndInitByXML
	}
}