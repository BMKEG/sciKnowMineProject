package edu.isi.bmkeg.lapdftextModule.controller
{	
	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.ftd.rl.events.*;

	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class FindFTDByIdResultCommand extends Command
	{
		
		[Inject]
		public var event:FindFTDByIdResultEvent;
		
		[Inject]
		public var model:LapdftextModel;
		
		
		override public function execute():void
		{
			
			model.currentFtd = event.object;
			model.ruleSet = model.currentFtd.ruleSet;
			
		}
		
	}
	
}