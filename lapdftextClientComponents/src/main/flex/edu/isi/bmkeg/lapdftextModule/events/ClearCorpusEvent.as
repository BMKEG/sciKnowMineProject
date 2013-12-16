package edu.isi.bmkeg.lapdftextModule.events
{
	
	import flash.events.Event;
	
	public class ClearCorpusEvent extends Event
	{
		public static const CLEAR_CORPUS:String = "ClearCorpus";

		public function ClearCorpusEvent(bubbles:Boolean=false, 
												 cancelable:Boolean=false)
		{
			super(CLEAR_CORPUS, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new ClearCorpusEvent(bubbles, cancelable)
		}

	}
}