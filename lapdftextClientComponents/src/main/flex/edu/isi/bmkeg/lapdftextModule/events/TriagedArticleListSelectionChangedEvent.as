package edu.isi.bmkeg.lapdftextModule.events
{
	
	import flash.events.Event;
	
	public class TriagedArticleListSelectionChangedEvent extends Event
	{
		public static const CHANGED:String = "TriageDocumentsListSelectionChangedEvent";

		/**
		 * selected Article or null if none is selected
		 */
		public var vpdmfId:int;
		
		public function TriagedArticleListSelectionChangedEvent(vpdmfId:int, 
												 bubbles:Boolean=false, 
												 cancelable:Boolean=false)
		{
			super(CHANGED, bubbles, cancelable);
			this.vpdmfId = vpdmfId;
		}

		override public function clone():Event
		{
			return new TriagedArticleListSelectionChangedEvent(vpdmfId, bubbles, cancelable)
		}

	}
}