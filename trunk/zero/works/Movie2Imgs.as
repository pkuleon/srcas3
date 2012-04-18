﻿/***
Movie2Imgs
创建人：ZЁЯ¤　身高：168cm+；体重：57kg+；未婚（已有女友）；最爱的运动：睡觉；格言：路见不平，拔腿就跑。QQ：358315553。
创建时间：2011年12月9日 13:53:37
简要说明：这家伙很懒什么都没写。
用法举例：这家伙还是很懒什么都没写。
*/

package zero.works{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.system.*;
	import flash.text.*;
	import flash.utils.*;
	
	import riaidea.utils.zip.ZipArchive;
	
	import zero.codec.PNGEncoder;
	
	public class Movie2Imgs extends MovieClip{
		
		private var dataBySizeArr:Array;//用于比较相同的图片
		private var zipArchive:ZipArchive;
		private var frame:int;
		private var bmd:BitmapData;
		
		public var boundsRect:Sprite;
		
		public function Movie2Imgs(){
			if(boundsRect){
				boundsRect.visible=false;
			}
			this.addEventListener(Event.ENTER_FRAME,init);
		}
		private function init(event:Event):void{
			
			try{
				bmd=new BitmapData(
					boundsRect?boundsRect.width:this.loaderInfo.width,
					boundsRect?boundsRect.height:this.loaderInfo.height,
					true,0x00000000
				);
			}catch(e:Error){
				return;
			}
			
			trace("bmd.width="+bmd.width);
			trace("bmd.height="+bmd.height);
			
			this.removeEventListener(Event.ENTER_FRAME,init);
			
			dataBySizeArr=new Array();
			zipArchive=new ZipArchive();
			frame=0;
			this.addEventListener(Event.ENTER_FRAME,enterFrame);
		}
		private function enterFrame(event:Event):void{
			if(++frame>this.totalFrames){
				this.removeEventListener(Event.ENTER_FRAME,enterFrame);
				new FileReference().save(zipArchive.output(),"pngs.zip");
				//for each(var subArr:Array in dataBySizeArr){
				//	trace(dataBySizeArr.indexOf(subArr),"frames="+subArr);
				//}
				return;
			}
			this.gotoAndStop(frame);
			bmd.fillRect(bmd.rect,0x00000000);
			if(boundsRect){
				bmd.draw(this,new Matrix(1,0,0,1,-boundsRect.x,-boundsRect.y));
			}else{
				bmd.draw(this);
			}
			
			//1
			var pngData:ByteArray=PNGEncoder.encode(bmd);
			
			/*
			//2
			var bmd2:BitmapData=new BitmapData(bmd.width,bmd.height,true,0xffffffff);
			bmd2.copyChannel(bmd,bmd.rect,new Point(),BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
			var pngData:ByteArray=PNGEncoder.encode(bmd2);
			//*/
			
			/*
			//3 适用于白底的单色动画
			var bmd2:BitmapData=new BitmapData(bmd.width,bmd.height,true,0x00000000);
			var redArr:Array=new Array();
			var greenArr:Array=new Array();
			var blueArr:Array=new Array();
			var alphaArr:Array=new Array();
			for(var i:int=0;i<256;i++){
				redArr[i]=0x00000000;
				greenArr[i]=0x00000000;
				if(i>=0xf0){
					//有时候底不够白
					blueArr[i]=0x00000000;
				}else{
					blueArr[i]=(255-i)<<24;
				}
				alphaArr[i]=0x00000000;
			}
			
			bmd2.paletteMap(bmd,bmd.rect,new Point(),redArr,greenArr,blueArr,alphaArr);
			var pngData:ByteArray=PNGEncoder.encode(bmd2);
			//*/
			
			if(dataBySizeArr[pngData.length]){
			}else{
				dataBySizeArr[pngData.length]=new Array();
			}
			dataBySizeArr[pngData.length].push(frame);
			zipArchive.addFileFromBytes(decodeURI(this.loaderInfo.url).split("/").pop().split(".")[0]+(10000+frame).toString().substr(1)+".png",pngData);
		}
	}
}