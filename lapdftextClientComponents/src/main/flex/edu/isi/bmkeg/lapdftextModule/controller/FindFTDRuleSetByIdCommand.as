package edu.isi.bmkeg.lapdftextModule.controller
{	

	import edu.isi.bmkeg.lapdftextModule.events.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;

	import org.robotlegs.mvcs.Command;
	
	public class FindFTDRuleSetByIdCommand extends Command {
		
		[Inject]
		public var event:FindFTDRuleSetByIdEvent;
		
		[Inject]
		public var service:IFtdService;

		override public function execute():void {
			service.findFTDRuleSetById( event.id );	
		}
		
	}
	
}