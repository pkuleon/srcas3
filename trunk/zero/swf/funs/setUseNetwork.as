/***
setUseNetwork
创建人：ZЁЯ¤　身高：168cm+；体重：57kg+；未婚（已有女友）；最爱的运动：睡觉；格言：路见不平，拔腿就跑。QQ：358315553。
创建时间：2011年6月27日 18:34:10
简要说明：这家伙很懒什么都没写。
用法举例：这家伙还是很懒什么都没写。
*/

package zero.swf.funs{
	
	import zero.swf.tagBodys.*;
	import zero.swf.*;
	
	public function setUseNetwork(swf:SWF,UseNetwork:Boolean):void{
		for each(var tag:Tag in swf.tagV){
			switch(tag.type){
				case TagTypes.FileAttributes:
					(tag.getBody(null) as FileAttributes).UseNetwork=(UseNetwork?1:0);
					return;
				break;
			}
		}
		trace("木找到 FileAttributes，可考虑自动插入一个");
	}
}
		