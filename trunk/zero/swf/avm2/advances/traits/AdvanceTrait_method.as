/***
AdvanceTrait_method 版本:v1.0
简要说明:这家伙很懒什么都没写
创建人:ZЁЯ¤  身高:168cm+;体重:57kg+;未婚(已有女友);最爱的运动:睡觉;格言:路见不平,拔腿就跑;QQ:358315553
创建时间:2010年10月27日 19:39:47
历次修改:未有修改
用法举例:这家伙很懒什么都没写
*/

//trait_method
//{
//	u30 disp_id
//	u30 method
//}

//The disp_id field is a compiler assigned integer that is used by the AVM2 to optimize the resolution of
//virtual function calls. An overridden method must have the same disp_id as that of the method in the
//base class. A value of zero disables this optimization.

//The method field is an index that points into the method array of the abcFile entry.

package zero.swf.avm2.advances.traits{
	import zero.swf.avm2.advances.Member;
	import zero.swf.avm2.advances.AdvanceABC;
	import zero.swf.avm2.advances.AdvanceMethod;
	import zero.swf.avm2.traits.Trait_method;

	public class AdvanceTrait_method extends AdvanceTrait{
		
		private static const memberV:Vector.<Member>=Vector.<Member>([
			new Member("disp_id"),
			new Member("methodi",Member.METHOD)
		]);
		
		public var disp_id:int;
		public var methodi:AdvanceMethod;
		
		public function AdvanceTrait_method(){
		}
		
		public function initByInfo(trait_method:Trait_method):void{
			initByInfo_fun(trait_method,memberV);
		}
		public function toInfo():Trait_method{
			var trait_method:Trait_method=new Trait_method();
			
			toInfo_fun(trait_method,memberV);
			
			return trait_method;
		}
		
		////
		CONFIG::toXMLAndInitByXML {
		public function toXML(xmlName:String=null):XML{//暂时带默认 null 值{
			return toXML_fun(memberV);
		}
		public function initByXML(xml:XML):void{
			initByXML_fun(xml,memberV);
		}
		}//end of CONFIG::toXMLAndInitByXML
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