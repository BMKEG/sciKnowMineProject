package edu.isi.bmkeg.lapdftextModule.controller
{	

	import edu.isi.bmkeg.lapdftextModule.events.*;
	import edu.isi.bmkeg.ftd.rl.events.FindFTDByIdEvent;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;

	import org.robotlegs.mvcs.Command;
	
	public class FindFTDByIdCommand extends Command {
		
		[Inject]
		public var event:FindFTDByIdEvent;
		
		[Inject]
		public var service:IFtdService;

		override public function execute():void {
			service.findFTDById( event.id );	
		}
		
	}
	
}