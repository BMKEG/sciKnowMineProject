package edu.isi.bmkeg.lapdftextModule.controller
{	
	import edu.isi.bmkeg.lapdftextModule.events.*;
	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	public class ClearCorpusCommand extends Command
	{
	
		[Inject]
		public var event:ClearCorpusEvent;

		[Inject]
		public var model:LapdftextModel;
				
		override public function execute():void
		{
			
			model = new LapdftextModel();

		}
		
	}
	
}