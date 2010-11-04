﻿/***
FrameLabel 版本:v1.0
简要说明:这家伙很懒什么都没写
创建人:ZЁЯ¤  身高:168cm+;体重:57kg+;未婚(已有女友);最爱的运动:睡觉;格言:路见不平,拔腿就跑;QQ:358315553
创建时间:2010年11月3日 13:23:54 (代码生成器: F:/airs/program files2/CodesGenerater/bin-debug/CodesGenerater.swf) 
历次修改:未有修改
用法举例:这家伙很懒什么都没写
*/
//FrameLabel
//The FrameLabel tag gives the specified Name to the current frame. ActionGoToLabel uses
//this name to identify the frame.
//The minimum file format version is SWF 3.

//FrameLabel
//Field 	Type 			Comment
//Header 	RECORDHEADER 	Tag type = 43
//Name 		STRING 			Label for frame

//In SWF files of version 6 or later, an extension to the FrameLabel tag called named anchors is
//available. A named anchor is a special kind of frame label that, in addition to labeling a frame
//for seeking using ActionGoToLabel, labels the frame for seeking using HTML anchor syntax.
//The browser plug-in versions of Adobe Flash Player, in version 6 and later, will inspect the
//URL in the browser's Location bar for an anchor specification (a trailing phrase of the form
//#anchorname). If an anchor specification is present in the Location bar, Flash Player will
//begin playback starting at the frame that contains a FrameLabel tag that specifies a named
//anchor of the same name, if one exists; otherwise playback will begin at Frame 1 as usual. In
//addition, when Flash Player arrives at a frame that contains a named anchor, it will add an
//anchor specification with the given anchor name to the URL in the browser's Location bar.
//This ensures that when users create a bookmark at such a time, they can later return to the
//same point in the SWF file, subject to the granularity at which named anchors are present
//within the file.
//To create a named anchor, insert one additional non-null byte after the null terminator of the
//anchor name. This is valid only for SWF 6 or later.

//NamedAnchor
//Field 			Type 								Comment
//Header 			RECORDHEADER 						Tag type = 43
//Name 				Null-terminated STRING.(0 is NULL)	Label for frame.
//Named Anchor flag UI8 								Always 1
package zero.swf.tagBodys{
	import flash.utils.ByteArray;
	public class FrameLabel{
		public var Name:String;							//STRING
		public var NamedAnchorflag:Boolean;				//NamedAnchorflag
		//
		public function initByData(data:ByteArray,offset:int,endOffset:int):int{
			var get_str_size:int=0;
			while(data[offset+(get_str_size++)]){}
			data.position=offset;
			Name=data.readUTFBytes(get_str_size);
			offset+=get_str_size;
			if(offset<endOffset){
				offset++;
				NamedAnchorflag=true;
			}
			return offset;
		}
		public function toData():ByteArray{
			var data:ByteArray=new ByteArray();
			data.writeUTFBytes(Name+"\x00");
			var offset:int=data.length;
			if(NamedAnchorflag){
				data[data.length]=0x01;
			}
			return data;
		}

		////
		CONFIG::toXMLAndInitByXML {
		public function toXML(xmlName:String):XML{
			return <{xmlName} class="FrameLabel"
				Name={Name}
				NamedAnchorflag={NamedAnchorflag}
			/>;
		}
		public function initByXML(xml:XML):void{
			Name=xml.@Name.toString();
			NamedAnchorflag=(xml.@NamedAnchorflag.toString()==="true");
		}
		}//end of CONFIG::toXMLAndInitByXML
	}
}
