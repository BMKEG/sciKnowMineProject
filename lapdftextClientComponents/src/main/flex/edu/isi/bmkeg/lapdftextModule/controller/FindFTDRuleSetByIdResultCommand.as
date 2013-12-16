package edu.isi.bmkeg.lapdftextModule.controller
{	
	import edu.isi.bmkeg.ftd.events.RunRuleSetEvent;
	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class FindFTDRuleSetByIdResultCommand extends Command
	{
		
		[Inject]
		public var event:FindFTDRuleSetByIdResultEvent;
		
		[Inject]
		public var model:LapdftextModel;
		
		
		override public function execute():void
		{
			
			model.ruleSet = event.object;
			
			if( model.currentFtd != null ) {
				var ev2:RunRuleSetEvent = new RunRuleSetEvent(
					model.currentFtd, model.ruleSet);
				this.dispatch(ev2);
			}
			
		}
		
	}
	
}