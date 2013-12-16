package edu.isi.bmkeg.lapdftextModule.controller
{	
	
	import edu.isi.bmkeg.ftd.events.*;
	import edu.isi.bmkeg.ftd.rl.events.FindFTDByIdEvent;
	import edu.isi.bmkeg.lapdftextModule.model.*;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class RunRuleSetCompleteCommand extends Command
	{
	
		[Inject]
		public var event:RunRuleSetCompleteEvent;		

		[Inject]
		public var model:LapdftextModel;		
				
		override public function execute():void {
		
			var ev:FindFTDByIdEvent = new FindFTDByIdEvent(model.currentFtd.vpdmfId);
			this.dispatch(ev);
			
		}
		
	}
	
}