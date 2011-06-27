/***
PlaceObject
创建人：ZЁЯ¤　身高：168cm+；体重：57kg+；未婚（已有女友）；最爱的运动：睡觉；格言：路见不平，拔腿就跑。QQ：358315553。
创建时间：2011年6月15日 13:32:47（代码生成器 V1.1.0 F:/airs/program files2/CodesGenerater/bin-debug/CodesGenerater.swf）
简要说明：这家伙很懒什么都没写。
用法举例：这家伙还是很懒什么都没写。
*/
//﻿PlaceObject 	 
//The PlaceObject tag adds a character to the display list. The CharacterId identifies the 	 
//character to be added. The Depth field specifies the stacking order of the character. The 	 
//Matrix field species the position, scale, and rotation of the character. 
//If the size of the 	 
//PlaceObject tag exceeds the end of the transformation matrix, it is assumed that a 	 
//ColorTransform field is appended to the record. 
//如果Matrix后面还有数据,那么就有ColorTransform
//The ColorTransform field specifies a color 	 
//effect (such as transparency) that is applied to the character. The same character can be added 	 
//more than once to the display list with a different depth and transformation matrix. 
//	 
//﻿NOTE
//PlaceObject is rarely used in SWF 3 and later versions; it is superseded by PlaceObject2 and PlaceObject3. 	 
//
//﻿The minimum file format version is SWF 1. 
//	 
//﻿PlaceObject 			 
//Field 						Type 			Comment 	 
//Header 						RECORDHEADER 	Tag type = 4 	 
//CharacterId 					UI16 			ID of character to place 	 
//Depth 						UI16 			Depth of character 	 
//Matrix 						MATRIX 			Transform matrix data 	 
//ColorTransform (optional) 	CXFORM 			Color transform data 
package zero.swf.tagBodys{
	import zero.swf.records.MATRIX;
	import zero.swf.records.CXFORM;
	import flash.utils.ByteArray;
	public class PlaceObject/*{*/implements I_zero_swf_CheckCodesRight{
		public var CharacterId:int;						//UI16
		public var Depth:int;							//UI16
		public var Matrix:MATRIX;
		public var ColorTransform:CXFORM;
		//
		public function initByData(data:ByteArray,offset:int,endOffset:int,_initByDataOptions:zero_swf_InitByDataOptions):int{
			CharacterId=data[offset]|(data[offset+1]<<8);
			Depth=data[offset+2]|(data[offset+3]<<8);
			offset+=4;
			Matrix=new MATRIX();
			offset=Matrix.initByData(data,offset,endOffset,_initByDataOptions);
			
			if(offset<endOffset){
			
				ColorTransform=new CXFORM();
				offset=ColorTransform.initByData(data,offset,endOffset,_initByDataOptions);
			}
			return offset;
		}
		public function toData(_toDataOptions:zero_swf_ToDataOptions):ByteArray{
			var data:ByteArray=new ByteArray();
			data[0]=CharacterId;
			data[1]=CharacterId>>8;
			data[2]=Depth;
			data[3]=Depth>>8;
			data.position=4;
			data.writeBytes(Matrix.toData(_toDataOptions));
			var offset:int=data.length;
			if(ColorTransform){
				data.position=offset;
				data.writeBytes(ColorTransform.toData(_toDataOptions));
				offset=data.length;
			}
			return data;
		}

		////
		CONFIG::USE_XML{
		public function toXML(xmlName:String,_toXMLOptions:zero_swf_ToXMLOptions):XML{
			var xml:XML=<{xmlName} class="PlaceObject"
				CharacterId={CharacterId}
				Depth={Depth}
			/>;
			xml.appendChild(Matrix.toXML("Matrix",_toXMLOptions));
			if(ColorTransform){
				xml.appendChild(ColorTransform.toXML("ColorTransform",_toXMLOptions));
			}
			return xml;
		}
		public function initByXML(xml:XML,_initByXMLOptions:zero_swf_InitByXMLOptions):void{
			CharacterId=int(xml.@CharacterId.toString());
			Depth=int(xml.@Depth.toString());
			Matrix=new MATRIX();
			Matrix.initByXML(xml.Matrix[0],_initByXMLOptions);
			if(xml.ColorTransform.length()==1){
				ColorTransform=new CXFORM();
				ColorTransform.initByXML(xml.ColorTransform[0],_initByXMLOptions);
			}
		}
		}//end of CONFIG::USE_XML
	}
}
