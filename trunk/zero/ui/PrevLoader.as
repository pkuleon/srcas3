/***
PrevLoader 版本:v1.0
简要说明:这家伙很懒什么都没写
创建人:ZЁЯ¤  身高:168cm+;体重:57kg+;未婚(已有女友);最爱的运动:睡觉;格言:路见不平,拔腿就跑;QQ:358315553
创建时间:2010年5月26日 13:32:30
历次修改:未有修改
用法举例:这家伙很懒什么都没写
*/

package zero.ui{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	import mx.preloaders.IPreloaderDisplay;
	
	import zero.*;
	
	public class PrevLoader extends Sprite implements IPreloaderDisplay{
		///*
		private var timeoutId:int=-1;
		private var bg:Sprite;
		private var zplContainer:Sprite;
		
		public function PrevLoader(){
			ZPLManager.init({startGame:startGame});
		}
		public function initialize():void{
			//if(ZeroCommon.FileClass){
			//	return;
			//}
			this.addEventListener(Event.REMOVED_FROM_STAGE,removed);
			bg=new Sprite();
			this.addChild(bg);
			var g:Graphics=bg.graphics;
			g.clear();
			g.beginFill(0x000000);
			g.drawRect(0,0,100,100);
			g.endFill();
			
			zplContainer=new Sprite();
			this.addChild(zplContainer);
			ZPLManager.add(zplContainer,resize,resize);
			
			resize(null);
			stage.addEventListener(Event.RESIZE,resize);
		}
		private function removed(event:Event):void{
			clearTimeout(timeoutId);
			this.removeEventListener(Event.REMOVED_FROM_STAGE,removed);
			this.loaderInfo.removeEventListener(Event.COMPLETE,startGame);
			
			stage.removeEventListener(Event.RESIZE,resize);
		}
		
		//仅在 flex 项目中会用到
		public function set preloader(_preloader:Sprite):void{
			_preloader.addEventListener(ProgressEvent.PROGRESS,loadProgress);
			_preloader.addEventListener("initComplete",initComplete);//FlexEvent.INIT_COMPLETE
		}
		private function loadProgress(event:ProgressEvent):void{
			ZPLManager.showLoadGameProgress(event.bytesLoaded,event.bytesTotal);
		}
		//
		
		public function initComplete(...args):void{
			resize(null);
			if(ZeroCommon.FileClass){
				initDelay();
			}else{
				timeoutId=setTimeout(initDelay,1000);
			}
		}
		
		private function resize(event:Event=null):void{
			if(bg){
				bg.width=stage.stageWidth;
				bg.height=stage.stageHeight;
				ZPLManager.resize(bg.x,bg.y,bg.width,bg.height);
			}
		}
		
		private function initDelay():void{
			resize(null);
			clearTimeout(timeoutId);
			if(ZPLManager.showLoadGameComplete()){
				return;
			}
			if(this.loaderInfo.bytesLoaded==this.loaderInfo.bytesTotal){
				startGame();
			}else{
				this.loaderInfo.addEventListener(Event.COMPLETE,startGame);
			}
		}
		private function startGame(event:Event=null):void{
			this.loaderInfo.removeEventListener(Event.COMPLETE,startGame);
			clearTimeout(timeoutId);
			ZPLManager.remove();
			dispatchEvent(new Event(Event.COMPLETE));
		}
		//*/
		
		/*
		public function initialize():void{
		}
		public function set preloader(_preloader:Sprite):void{
		}
		//*/
		
		public function get backgroundAlpha():Number{
			return 0;
		}
		public function set backgroundAlpha(_backgroundAlpha:Number):void{
		}
		
		public function get backgroundColor():uint{
			return 0;
		}
		public function set backgroundColor(_backgroundColor:uint):void{
		}
		
		public function get backgroundImage():Object{
			return null;
		}
		public function set backgroundImage(_backgroundImage:Object):void{
		}
		
		public function get backgroundSize():String{
			return null;
		}
		public function set backgroundSize(_backgroundSize:String):void{
		}
		
		public function get stageWidth():Number{
			return 0;
		}
		public function set stageWidth(_stageWidth:Number):void{
		}
		public function get stageHeight():Number{
			return 0;
		}
		public function set stageHeight(_stageHeight:Number):void{
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