/***
InstanceFlags
创建人：ZЁЯ¤　身高：168cm+；体重：57kg+；未婚（已有女友）；最爱的运动：睡觉；格言：路见不平，拔腿就跑。QQ：358315553。
创建时间：2011年6月15日 13:32:48（代码生成器 V1.1.0 F:/airs/program files2/CodesGenerater/bin-debug/CodesGenerater.swf）
简要说明：这家伙很懒什么都没写。
用法举例：这家伙还是很懒什么都没写。
*/

package zero.swf.avm2{

	public class InstanceFlags{
		public static const ClassSealed:int=1;
		public static const ClassFinal:int=2;
		public static const ClassInterface:int=4;
		public static const ClassProtectedNs:int=8;
		
		public static const flagV:Vector.<String>=function():Vector.<String>{
			var flagV:Vector.<String>=new Vector.<String>(9);
			flagV.fixed=true;
			flagV[1]="ClassSealed";
			flagV[2]="ClassFinal";
			flagV[4]="ClassInterface";
			flagV[8]="ClassProtectedNs";
			return flagV;
		}();
		
		////
		//

	}
}