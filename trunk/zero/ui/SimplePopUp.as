﻿/***
SimplePopUp 版本:v1.0
简要说明:这家伙很懒什么都没写
创建人:ZЁЯ¤  身高:168cm+;体重:57kg+;未婚(已有女友);最爱的运动:睡觉;格言:路见不平,拔腿就跑;QQ:358315553
创建时间:2011年1月17日 09:47:23
历次修改:未有修改
用法举例:这家伙很懒什么都没写
*/

package zero.ui{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.text.*;
	import flash.geom.*;
	
	import ui.Btn;
	
	public class SimplePopUp extends Sprite{
		
		public static var instance:SimplePopUp;
		
		public static var label_ok:String="确定";
		
		public static function show(msg:String,labels:String=null):SimplePopUp{
			instance.show(msg,labels);
			return instance;
		}
		
		public var bg:Sprite;
		public var txt:TextField;
		
		public var btn0:Btn;
		public var btn1:Btn;
		public var btn2:Btn;
		public var btn3:Btn;
		public var btn4:Btn;
		public var btn5:Btn;
		public var btn6:Btn;
		public var btn7:Btn;
		public var btn8:Btn;
		public var btn9:Btn;
		
		public var callBack:Function;
		
		private var btnDict:Dictionary;
		
		private var bBtn:Rectangle;
		private var bTxt:Rectangle;
		
		public function SimplePopUp(){
			if(instance){
				throw new Error("只支持单例");
			}else{
				instance=this;
			}
			this.visible=false;
			
			btnDict=new Dictionary();
			
			var i:int=0;
			bBtn=btn0.getBounds(this);
			while(true){
				var btn:Btn=this["btn"+i];
				if(btn){
					btn.addEventListener(MouseEvent.CLICK,click);
					btn.mouseChildren=false;
					btnDict[btn]=i;
					bBtn=bBtn.union(btn.getBounds(this));
				}else{
					break;
				}
				i++;
			}
			
			bTxt=txt.getBounds(this);
		}
		
		public function show(msg:String,labels:String=null):void{
			txt.text=msg;
			
			txt.x=bTxt.x+(bTxt.width-txt.textWidth)/2;
			txt.y=bTxt.y+(bTxt.height-txt.textHeight)/2;
			
			var labelArr:Array;
			if(labels){
				labelArr=labels.split("|");
			}else{
				labelArr=[label_ok];
			}
			var i:int=0;
			for each(var label:String in labelArr){
				this["btn"+i]["txt"].text=label;
				i++;
			}
			
			var b:Rectangle;
			switch(i){
				case 1:
					btn0.visible=true;
					btn1.visible=false;
					b=btn0.getBounds(this);
					btn0.x+=bBtn.x+bBtn.width/2-(b.x+b.width/2);
					btn0.y+=bBtn.y+bBtn.height/2-(b.y+b.height/2);
				break;
				case 2:
					btn0.visible=true;
					btn1.visible=true;
					b=btn0.getBounds(this);
					btn0.x+=bBtn.x-b.x;
					btn0.y+=bBtn.y-b.y;
					b=btn1.getBounds(this);
					btn1.x+=bBtn.x+bBtn.width-b.width-b.x;
					btn1.y+=bBtn.y+bBtn.height-b.height-b.y;
				break;
			}
			
			this.visible=true;
		}
		
		private function click(event:MouseEvent):void{
			var callBackResult:Boolean;
			switch(btnDict[event.target]){
				case 0:
					if(btn1.visible){
						callBackResult=callBack(true);
					}else{
						callBackResult=callBack();
					}
				break;
				case 1:
					callBackResult=callBack(false);
				break;
			}
			if(callBackResult){
			}else{
				this.visible=false;
			}
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