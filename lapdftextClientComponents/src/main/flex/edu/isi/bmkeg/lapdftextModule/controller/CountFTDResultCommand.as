package edu.isi.bmkeg.lapdftextModule.controller
{	
	import org.robotlegs.mvcs.Command;

	import edu.isi.bmkeg.pagedList.model.*;

	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	import edu.isi.bmkeg.ftd.rl.events.*;
	
	import flash.events.Event;
	
	public class CountFTDResultCommand extends Command
	{
	
		[Inject]
		public var event:CountFTDResultEvent;

		[Inject]
		public var model:LapdftextModel;
				
		override public function execute():void
		{
			model.nDoc = event.count;
		}
		
	}
	
}