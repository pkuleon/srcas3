﻿/***
AdjustDistances 版本:v1.0
简要说明:这家伙很懒什么都没写
创建人:ZЁЯ¤  身高:168cm+;体重:57kg+;未婚(已有女友);最爱的运动:睡觉;格言:路见不平,拔腿就跑;QQ:358315553
创建时间:2011年3月3日 09:39:51
历次修改:未有修改
用法举例:这家伙很懒什么都没写
*/

package zero.motions{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.geom.*;
	
	public class AdjustDistances{
		private var dspObjArr:Array;
		private var left:Number;
		private var right:Number;
		
		public var u:Number=0.2;
		
		public function AdjustDistances(..._dspObjArr){
			if(
				_dspObjArr[0] is Array
				&&
				_dspObjArr.length==1
			){
				_dspObjArr=_dspObjArr[0];
			}
			
			dspObjArr=_dspObjArr;
			
			var u_rect:Rectangle=new Rectangle(0,0,0,0);
			var rect:Rectangle;
			for each(var dspObj:DisplayObject in dspObjArr){
				rect=getB(dspObj);
				u_rect=u_rect.union(rect);
			}
			
			left=u_rect.left;
			right=u_rect.right;
		}
		public function step():void{
			var widSum:Number=0;
			var dspObj:DisplayObject;
			var rect:Rectangle;
			for each(dspObj in dspObjArr){
				rect=getB(dspObj);
				widSum+=rect.width;
			}
			var d:Number=((right-left)-widSum)/(dspObjArr.length-1);
			var x:Number=left;
			for each(dspObj in dspObjArr){
				rect=getB(dspObj);
				//dspObj.x+=x-rect.x;//立刻
				dspObj.x+=(x-rect.x)*u;//缓动
				x+=rect.width+d;
			}
			
			//最右边的有些振动，调一下：
			dspObj=dspObjArr[dspObjArr.length-1];
			rect=getB(dspObj);
			dspObj.x+=right-rect.right;
		}
		private function getB(dspObj:DisplayObject):Rectangle{
			if(dspObj.hasOwnProperty("adjust_b_area")){
				return dspObj["adjust_b_area"].getBounds(dspObj.parent);
			}
			return dspObj.getBounds(dspObj.parent);
		}
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