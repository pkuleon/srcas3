/***
getTime
创建人：ZЁЯ¤　身高：168cm+；体重：57kg+；未婚（已有女友）；最爱的运动：睡觉；格言：路见不平，拔腿就跑。QQ：358315553。
创建时间：2011年8月17日 15:40:00
简要说明：这家伙很懒什么都没写。
用法举例：这家伙还是很懒什么都没写。
*/

package zero.utils{
	public function getTime(format:String="Y年m月d日 H:i:s",date:Date=null):String{
		date||(date=new Date());
		return format
			.replace(/Y/g,date.fullYear)
			.replace(/m/g,(100+date.month+1).toString().substr(1))
			.replace(/d/g,(100+date.date).toString().substr(1))
			.replace(/H/g,(100+date.hours).toString().substr(1))
			.replace(/i/g,(100+date.minutes).toString().substr(1))
			.replace(/s/g,(100+date.seconds).toString().substr(1));
	}
}