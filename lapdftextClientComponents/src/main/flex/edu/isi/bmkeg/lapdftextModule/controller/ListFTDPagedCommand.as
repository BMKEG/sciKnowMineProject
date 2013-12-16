package edu.isi.bmkeg.lapdftextModule.controller
{	
	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	import edu.isi.bmkeg.ftd.rl.events.ListFTDPagedEvent;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListFTDPagedCommand extends Command
	{
	
		[Inject]
		public var event:ListFTDPagedEvent;

		[Inject]
		public var model:LapdftextModel;
		
		[Inject]
		public var service:IFtdService;
				
		override public function execute():void
		{	
			service.listFTDPaged(event.object, event.offset, event.cnt);
		}
		
	}
	
}