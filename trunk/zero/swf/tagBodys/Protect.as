/***
Protect
创建人：ZЁЯ¤　身高：168cm+；体重：57kg+；未婚（已有女友）；最爱的运动：睡觉；格言：路见不平，拔腿就跑。QQ：358315553。
创建时间：2011年08月25日 12:01:45（代码生成器 V2.0.0 F:/airs/program files2/CodesGenerater2/bin-debug/CodesGenerater2.swf）
简要说明：这家伙很懒什么都没写。
用法举例：这家伙还是很懒什么都没写。
*/

//Field 		Type 								Comment
//Header 		RECORDHEADER 						Tag type = xx
//Reserved 		UI16 								Always 0
//Password 		Null-terminated STRING.(0 is NULL)	MD5-encrypted password

package zero.swf.tagBodys{
	
	import flash.utils.ByteArray;
	
	public class Protect{
		
		public var password:String;//Password
		
		public function initByData(data:ByteArray,offset:int,endOffset:int,_initByDataOptions:Object):int{
			
			password="";
			while(offset<endOffset){
				password+=String.fromCharCode(data[offset]);
				offset++;
			}
			
			return offset;
			
		}
		public function toData(_toDataOptions:Object):ByteArray{
			
			var data:ByteArray=new ByteArray();
			
			if(password){
				data.writeUTFBytes(password);
//				//20111208
//				if(password){
//					for each(var c:String in password.split("")){
//						if(c.charCodeAt(0)>0xff){
//							data.writeUTFBytes(c);
//						}else{
//							data.writeByte(c.charCodeAt(0));
//						}
//					}
//				}
			}
			
			return data;
			
		}
		
		CONFIG::USE_XML{
			public function toXML(xmlName:String,_toXMLOptions:Object):XML{
				
				return <{xmlName} class="zero.swf.tagBodys.Protect"
					password={password}
				/>;
				
			}
			public function initByXML(xml:XML,_initByXMLOptions:Object):void{
				
				password=xml.@password.toString();
				
			}
		}
	}
}