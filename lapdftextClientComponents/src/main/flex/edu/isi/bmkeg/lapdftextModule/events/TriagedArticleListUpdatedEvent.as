package edu.isi.bmkeg.lapdftextModule.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class TriagedArticleListUpdatedEvent extends Event
	{
		public static const UPDATED:String = "TriageDocumentsListUpdatedEvent";
		
		public function TriagedArticleListUpdatedEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(UPDATED, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new TriagedArticleListUpdatedEvent(bubbles, cancelable)
		}

	}
}