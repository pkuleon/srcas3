package akdcl.media {
	import flash.events.Event;

	/**
	 * ...
	 * @author Akdcl
	 */
	/// @eventType	akdcl.media.MediaEvent.LIST_CHANGE
	[Event(name="listChange",type="akdcl.media.MediaEvent")]

	/// @eventType	akdcl.media.MediaEvent.VOLUME_CHANGE
	[Event(name="volumeChange",type="akdcl.media.MediaEvent")]

	/// @eventType	akdcl.media.MediaEvent.STATE_CHANGE
	[Event(name="stateChange",type="akdcl.media.MediaEvent")]

	/// @eventType	akdcl.media.MediaEvent.PLAY_ITEM_CHANGE
	[Event(name="playItemChange",type="akdcl.media.MediaEvent")]

	/// @eventType	akdcl.media.MediaEvent.PLAY_PROGRESS
	[Event(name="playProgress",type="akdcl.media.MediaEvent")]

	/// @eventType	akdcl.media.MediaEvent.PLAY_COMPLETE
	[Event(name="playComplete",type="akdcl.media.MediaEvent")]

	/// @eventType	akdcl.media.MediaEvent.LOAD_ERROR
	[Event(name="loadError",type="akdcl.media.MediaEvent")]

	/// @eventType	akdcl.media.MediaEvent.BUFFER_PROGRESS
	[Event(name="bufferProgress",type="akdcl.media.MediaEvent")]

	/// @eventType	akdcl.media.MediaEvent.LOAD_PROGRESS
	[Event(name="loadProgress",type="akdcl.media.MediaEvent")]

	/// @eventType	akdcl.media.MediaEvent.LOAD_COMPLETE
	[Event(name="loadComplete",type="akdcl.media.MediaEvent")]

	public class MediaEvent extends Event {
		public static const LIST_CHANGE:String = "listChange";
		public static const VOLUME_CHANGE:String = "volumeChange";
		public static const STATE_CHANGE:String = "stateChange";
		public static const PLAY_ITEM_CHANGE:String = "playItemChange";
		public static const PLAY_PROGRESS:String = "playProgress";
		public static const PLAY_COMPLETE:String = "playComplete";
		public static const LOAD_ERROR:String = "loadError";
		public static const BUFFER_PROGRESS:String = "bufferProgress";
		public static const LOAD_PROGRESS:String = "loadProgress";
		public static const LOAD_COMPLETE:String = "loadComplete";

		public function MediaEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false):void {
			super(type, bubbles, cancelable);
		}

		override public function clone():Event {
			return new MediaEvent(type, bubbles, cancelable);
		}
	}

}