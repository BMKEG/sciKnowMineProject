package edu.isi.bmkeg.lapdftextModule.controller
{	
	import edu.isi.bmkeg.pagedList.events.*;
	
	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	
	import edu.isi.bmkeg.ftd.rl.events.CountFTDEvent;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class CountFTDCommand extends Command
	{
	
		[Inject]
		public var event:CountFTDEvent;

		[Inject]
		public var model:LapdftextModel;
		
		[Inject]
		public var service:IFtdService;
				
		override public function execute():void
		{
			service.countFTD(event.object);
		}
		
	}
	
}