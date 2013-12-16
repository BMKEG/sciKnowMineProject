package edu.isi.bmkeg.lapdftextModule.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestRetrieveTriageDocumentEvent extends Event
	{
		public static const RETRIEVE:String = "UserRequestRetrieveArticleEvent";
		
		public var bmkegId:int;
		
		public function UserRequestRetrieveTriageDocumentEvent(bmkegId:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(RETRIEVE, bubbles, cancelable);
			this.bmkegId = bmkegId;
		}

		override public function clone():Event
		{
			var event:UserRequestRetrieveTriageDocumentEvent = 
				new UserRequestRetrieveTriageDocumentEvent(bmkegId, bubbles, cancelable);

			return event; 
		}

	}
}