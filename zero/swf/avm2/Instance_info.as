/***
Instance_info
创建人：ZЁЯ¤　身高：168cm+；体重：57kg+；未婚（已有女友）；最爱的运动：睡觉；格言：路见不平，拔腿就跑。QQ：358315553。
创建时间：2011年6月15日 13:32:49（代码生成器 V1.1.0 F:/airs/program files2/CodesGenerater/bin-debug/CodesGenerater.swf）
简要说明：这家伙很懒什么都没写。
用法举例：这家伙还是很懒什么都没写。
*/
//The instance_info entry is used to define the characteristics of a run-time object (a class instance) within the
//AVM2. The corresponding(对应的) class_info entry is used in order to fully define an ActionScript 3.0 Class.

//instance_info
//{
//	u30 name
//	u30 super_name
//	u8 flags
//	u30 protectedNs
//	u30 intrf_count
//	u30 interface[intrf_count]
//	u30 iinit
//	u30 trait_count
//	traits_info trait[trait_count]
//}

//The name field is an index into the multiname array of the constant pool; it provides a name for the
//class. The entry specified must be a QName.
//The super_name field is an index into the multiname array of the constant pool; it provides the name of
//the base class of this class, if any. A value of zero indicates that this class has no base class.			

//The flags field is used to identify various options when interpreting the instance_info entry. It is bit
//vector; the following entries are defined. Other bits must be zero.
//Name 							Value 	Meaning
//CONSTANT_ClassSealed 			0x01 	The class is sealed: properties can not be dynamically added to instances of the class.
//CONSTANT_ClassFinal 			0x02 	The class is final: it cannot be a base class for any other class.
//CONSTANT_ClassInterface 		0x04 	The class is an interface.
//CONSTANT_ClassProtectedNs 	0x08 	The class uses its protected namespace and the protectedNs field is present in the interface_info structure.

//This field is present only if the CONSTANT_ProtectedNs bit of flags is set. It is an index into the
//namespace array of the constant pool and identifies the namespace that serves as the protected namespace
//for this class.

//The value of the intrf_count field is the number of entries in the interface array. The interface array
//contains indices into the multiname array of the constant pool; the referenced names specify the interfaces
//implemented by this class. None of the indices may be zero.

//This is an index into the method array of the abcFile; it references the method that is invoked whenever
//an object of this class is constructed. This method is sometimes referred to as an instance initializer.

//The value of trait_count is the number of elements in the trait array. The trait array defines the set
//of traits of a class instance. The next section defines the meaning of the traits_info structure.
package zero.swf.avm2{
	import flash.utils.ByteArray;
	
	import zero.swf.avm2.InstanceFlags;
	import zero.swf.avm2.Traits_info;
	public class Instance_info{//implements I_zero_swf_CheckCodesRight{
		public var name:int;							//u30
		public var super_name:int;						//u30
		public var ClassSealed:Boolean;
		public var ClassFinal:Boolean;
		public var ClassInterface:Boolean;
		public var protectedNs:int;						//u30
		public var intrfV:Vector.<int>;
		public var iinit:int;							//u30
		public var itraits_infoV:Vector.<Traits_info>;
		//
		public function initByData(data:ByteArray,offset:int,endOffset:int,_initByDataOptions:Object/*zero_swf_InitByDataOptions*/):int{
			if(data[offset]>>>7){if(data[offset+1]>>>7){if(data[offset+2]>>>7){if(data[offset+3]>>>7){name=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|((data[offset++]&0x7f)<<21)|(data[offset++]<<28);}else{name=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|(data[offset++]<<21);}}else{name=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|(data[offset++]<<14);}}else{name=(data[offset++]&0x7f)|(data[offset++]<<7);}}else{name=data[offset++];}
			//name
			
			if(data[offset]>>>7){if(data[offset+1]>>>7){if(data[offset+2]>>>7){if(data[offset+3]>>>7){super_name=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|((data[offset++]&0x7f)<<21)|(data[offset++]<<28);}else{super_name=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|(data[offset++]<<21);}}else{super_name=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|(data[offset++]<<14);}}else{super_name=(data[offset++]&0x7f)|(data[offset++]<<7);}}else{super_name=data[offset++];}
			//super_name
			var flags:int=data[offset++];
			ClassSealed=((flags&InstanceFlags.ClassSealed)?true:false);
			ClassFinal=((flags&InstanceFlags.ClassFinal)?true:false);
			ClassInterface=((flags&InstanceFlags.ClassInterface)?true:false);
			
			if(flags&InstanceFlags.ClassProtectedNs){
			
				if(data[offset]>>>7){if(data[offset+1]>>>7){if(data[offset+2]>>>7){if(data[offset+3]>>>7){protectedNs=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|((data[offset++]&0x7f)<<21)|(data[offset++]<<28);}else{protectedNs=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|(data[offset++]<<21);}}else{protectedNs=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|(data[offset++]<<14);}}else{protectedNs=(data[offset++]&0x7f)|(data[offset++]<<7);}}else{protectedNs=data[offset++];}
				//protectedNs
			}else{
				protectedNs=-1;
			}
			
			
			if(data[offset]>>>7){if(data[offset+1]>>>7){if(data[offset+2]>>>7){if(data[offset+3]>>>7){var intrf_count:int=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|((data[offset++]&0x7f)<<21)|(data[offset++]<<28);}else{intrf_count=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|(data[offset++]<<21);}}else{intrf_count=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|(data[offset++]<<14);}}else{intrf_count=(data[offset++]&0x7f)|(data[offset++]<<7);}}else{intrf_count=data[offset++];}
			//intrf_count
			intrfV=new Vector.<int>();
			for(var i:int=0;i<intrf_count;i++){
			
				if(data[offset]>>>7){if(data[offset+1]>>>7){if(data[offset+2]>>>7){if(data[offset+3]>>>7){intrfV[i]=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|((data[offset++]&0x7f)<<21)|(data[offset++]<<28);}else{intrfV[i]=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|(data[offset++]<<21);}}else{intrfV[i]=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|(data[offset++]<<14);}}else{intrfV[i]=(data[offset++]&0x7f)|(data[offset++]<<7);}}else{intrfV[i]=data[offset++];}
				//intrfV[i]
			}
			
			if(data[offset]>>>7){if(data[offset+1]>>>7){if(data[offset+2]>>>7){if(data[offset+3]>>>7){iinit=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|((data[offset++]&0x7f)<<21)|(data[offset++]<<28);}else{iinit=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|(data[offset++]<<21);}}else{iinit=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|(data[offset++]<<14);}}else{iinit=(data[offset++]&0x7f)|(data[offset++]<<7);}}else{iinit=data[offset++];}
			//iinit
			
			
			if(data[offset]>>>7){if(data[offset+1]>>>7){if(data[offset+2]>>>7){if(data[offset+3]>>>7){var itraits_info_count:int=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|((data[offset++]&0x7f)<<21)|(data[offset++]<<28);}else{itraits_info_count=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|((data[offset++]&0x7f)<<14)|(data[offset++]<<21);}}else{itraits_info_count=(data[offset++]&0x7f)|((data[offset++]&0x7f)<<7)|(data[offset++]<<14);}}else{itraits_info_count=(data[offset++]&0x7f)|(data[offset++]<<7);}}else{itraits_info_count=data[offset++];}
			//itraits_info_count
			itraits_infoV=new Vector.<Traits_info>();
			for(i=0;i<itraits_info_count;i++){
			
				itraits_infoV[i]=new Traits_info();
				offset=itraits_infoV[i].initByData(data,offset,endOffset,_initByDataOptions);
			}
			return offset;
		}
		public function toData(_toDataOptions:Object/*zero_swf_ToDataOptions*/):ByteArray{
			var data:ByteArray=new ByteArray();
			var offset:int=0;
			if(name>>>7){if(name>>>14){if(name>>>21){if(name>>>28){data[offset++]=(name&0x7f)|0x80;data[offset++]=((name>>>7)&0x7f)|0x80;data[offset++]=((name>>>14)&0x7f)|0x80;data[offset++]=((name>>>21)&0x7f)|0x80;data[offset++]=name>>>28;}else{data[offset++]=(name&0x7f)|0x80;data[offset++]=((name>>>7)&0x7f)|0x80;data[offset++]=((name>>>14)&0x7f)|0x80;data[offset++]=name>>>21;}}else{data[offset++]=(name&0x7f)|0x80;data[offset++]=((name>>>7)&0x7f)|0x80;data[offset++]=name>>>14;}}else{data[offset++]=(name&0x7f)|0x80;data[offset++]=name>>>7;}}else{data[offset++]=name;}
			//name
			
			if(super_name>>>7){if(super_name>>>14){if(super_name>>>21){if(super_name>>>28){data[offset++]=(super_name&0x7f)|0x80;data[offset++]=((super_name>>>7)&0x7f)|0x80;data[offset++]=((super_name>>>14)&0x7f)|0x80;data[offset++]=((super_name>>>21)&0x7f)|0x80;data[offset++]=super_name>>>28;}else{data[offset++]=(super_name&0x7f)|0x80;data[offset++]=((super_name>>>7)&0x7f)|0x80;data[offset++]=((super_name>>>14)&0x7f)|0x80;data[offset++]=super_name>>>21;}}else{data[offset++]=(super_name&0x7f)|0x80;data[offset++]=((super_name>>>7)&0x7f)|0x80;data[offset++]=super_name>>>14;}}else{data[offset++]=(super_name&0x7f)|0x80;data[offset++]=super_name>>>7;}}else{data[offset++]=super_name;}
			//super_name
			var flags:int=0;
			if(ClassSealed){
				flags|=InstanceFlags.ClassSealed;
			}
			if(ClassFinal){
				flags|=InstanceFlags.ClassFinal;
			}
			if(ClassInterface){
				flags|=InstanceFlags.ClassInterface;
			}
			var flagsOffset:int=offset;
			offset++;
			
			if(protectedNs>-1){
				flags|=InstanceFlags.ClassProtectedNs;
				if(protectedNs>>>7){if(protectedNs>>>14){if(protectedNs>>>21){if(protectedNs>>>28){data[offset++]=(protectedNs&0x7f)|0x80;data[offset++]=((protectedNs>>>7)&0x7f)|0x80;data[offset++]=((protectedNs>>>14)&0x7f)|0x80;data[offset++]=((protectedNs>>>21)&0x7f)|0x80;data[offset++]=protectedNs>>>28;}else{data[offset++]=(protectedNs&0x7f)|0x80;data[offset++]=((protectedNs>>>7)&0x7f)|0x80;data[offset++]=((protectedNs>>>14)&0x7f)|0x80;data[offset++]=protectedNs>>>21;}}else{data[offset++]=(protectedNs&0x7f)|0x80;data[offset++]=((protectedNs>>>7)&0x7f)|0x80;data[offset++]=protectedNs>>>14;}}else{data[offset++]=(protectedNs&0x7f)|0x80;data[offset++]=protectedNs>>>7;}}else{data[offset++]=protectedNs;}
				//protectedNs
			}
			var intrf_count:int=intrfV.length;
			
			if(intrf_count>>>7){if(intrf_count>>>14){if(intrf_count>>>21){if(intrf_count>>>28){data[offset++]=(intrf_count&0x7f)|0x80;data[offset++]=((intrf_count>>>7)&0x7f)|0x80;data[offset++]=((intrf_count>>>14)&0x7f)|0x80;data[offset++]=((intrf_count>>>21)&0x7f)|0x80;data[offset++]=intrf_count>>>28;}else{data[offset++]=(intrf_count&0x7f)|0x80;data[offset++]=((intrf_count>>>7)&0x7f)|0x80;data[offset++]=((intrf_count>>>14)&0x7f)|0x80;data[offset++]=intrf_count>>>21;}}else{data[offset++]=(intrf_count&0x7f)|0x80;data[offset++]=((intrf_count>>>7)&0x7f)|0x80;data[offset++]=intrf_count>>>14;}}else{data[offset++]=(intrf_count&0x7f)|0x80;data[offset++]=intrf_count>>>7;}}else{data[offset++]=intrf_count;}
			//intrf_count
			
			for each(var intrf:int in intrfV){
			
				if(intrf>>>7){if(intrf>>>14){if(intrf>>>21){if(intrf>>>28){data[offset++]=(intrf&0x7f)|0x80;data[offset++]=((intrf>>>7)&0x7f)|0x80;data[offset++]=((intrf>>>14)&0x7f)|0x80;data[offset++]=((intrf>>>21)&0x7f)|0x80;data[offset++]=intrf>>>28;}else{data[offset++]=(intrf&0x7f)|0x80;data[offset++]=((intrf>>>7)&0x7f)|0x80;data[offset++]=((intrf>>>14)&0x7f)|0x80;data[offset++]=intrf>>>21;}}else{data[offset++]=(intrf&0x7f)|0x80;data[offset++]=((intrf>>>7)&0x7f)|0x80;data[offset++]=intrf>>>14;}}else{data[offset++]=(intrf&0x7f)|0x80;data[offset++]=intrf>>>7;}}else{data[offset++]=intrf;}
				//intrf
			}
			
			if(iinit>>>7){if(iinit>>>14){if(iinit>>>21){if(iinit>>>28){data[offset++]=(iinit&0x7f)|0x80;data[offset++]=((iinit>>>7)&0x7f)|0x80;data[offset++]=((iinit>>>14)&0x7f)|0x80;data[offset++]=((iinit>>>21)&0x7f)|0x80;data[offset++]=iinit>>>28;}else{data[offset++]=(iinit&0x7f)|0x80;data[offset++]=((iinit>>>7)&0x7f)|0x80;data[offset++]=((iinit>>>14)&0x7f)|0x80;data[offset++]=iinit>>>21;}}else{data[offset++]=(iinit&0x7f)|0x80;data[offset++]=((iinit>>>7)&0x7f)|0x80;data[offset++]=iinit>>>14;}}else{data[offset++]=(iinit&0x7f)|0x80;data[offset++]=iinit>>>7;}}else{data[offset++]=iinit;}
			//iinit
			var itraits_info_count:int=itraits_infoV.length;
			
			if(itraits_info_count>>>7){if(itraits_info_count>>>14){if(itraits_info_count>>>21){if(itraits_info_count>>>28){data[offset++]=(itraits_info_count&0x7f)|0x80;data[offset++]=((itraits_info_count>>>7)&0x7f)|0x80;data[offset++]=((itraits_info_count>>>14)&0x7f)|0x80;data[offset++]=((itraits_info_count>>>21)&0x7f)|0x80;data[offset++]=itraits_info_count>>>28;}else{data[offset++]=(itraits_info_count&0x7f)|0x80;data[offset++]=((itraits_info_count>>>7)&0x7f)|0x80;data[offset++]=((itraits_info_count>>>14)&0x7f)|0x80;data[offset++]=itraits_info_count>>>21;}}else{data[offset++]=(itraits_info_count&0x7f)|0x80;data[offset++]=((itraits_info_count>>>7)&0x7f)|0x80;data[offset++]=itraits_info_count>>>14;}}else{data[offset++]=(itraits_info_count&0x7f)|0x80;data[offset++]=itraits_info_count>>>7;}}else{data[offset++]=itraits_info_count;}
			//itraits_info_count
			
			data.position=offset;
			for each(var itraits_info:Traits_info in itraits_infoV){
				data.writeBytes(itraits_info.toData(_toDataOptions));
			}
			data[flagsOffset]=flags;
			return data;
		}

		////
		CONFIG::USE_XML{
		public function toXML(xmlName:String,_toXMLOptions:Object/*zero_swf_ToXMLOptions*/):XML{
			var xml:XML=<{xmlName} class="zero.swf.avm2.Instance_info"
				name={name}
				super_name={super_name}
				ClassSealed={ClassSealed}
				ClassFinal={ClassFinal}
				ClassInterface={ClassInterface}
			/>;
			if(protectedNs>-1){
				xml.@protectedNs=protectedNs;
			}
			if(intrfV.length){
				var intrfListXML:XML=<intrfList count={intrfV.length}/>
				for each(var intrf:int in intrfV){
					intrfListXML.appendChild(<intrf value={intrf}/>);
				}
				xml.appendChild(intrfListXML);
			}
			xml.@iinit=iinit;
			if(itraits_infoV.length){
				var itraits_infoListXML:XML=<itraits_infoList count={itraits_infoV.length}/>
				for each(var itraits_info:Traits_info in itraits_infoV){
					itraits_infoListXML.appendChild(itraits_info.toXML("itraits_info",_toXMLOptions));
				}
				xml.appendChild(itraits_infoListXML);
			}
			return xml;
		}
		public function initByXML(xml:XML,_initByXMLOptions:Object/*zero_swf_InitByXMLOptions*/):void{
			name=int(xml.@name.toString());
			super_name=int(xml.@super_name.toString());
			
			ClassSealed=(xml.@ClassSealed.toString()=="true");
			ClassFinal=(xml.@ClassFinal.toString()=="true");
			ClassInterface=(xml.@ClassInterface.toString()=="true");
			
			var protectedNsXML:XML=xml.@protectedNs[0];
			if(protectedNsXML){
				protectedNs=int(protectedNsXML.toString());
			}else{
				protectedNs=-1;
			}
			var i:int=-1;
			intrfV=new Vector.<int>();
			for each(var intrfXML:XML in xml.intrfList.intrf){
				i++;
				intrfV[i]=int(intrfXML.@value.toString());
			}
			iinit=int(xml.@iinit.toString());
			i=-1;
			itraits_infoV=new Vector.<Traits_info>();
			for each(var itraits_infoXML:XML in xml.itraits_infoList.itraits_info){
				i++;
				itraits_infoV[i]=new Traits_info();
				itraits_infoV[i].initByXML(itraits_infoXML,_initByXMLOptions);
			}
		}
		}//end of CONFIG::USE_XML
	}
}
