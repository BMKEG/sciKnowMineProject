package edu.isi.bmkeg.lapdftextModule.controller
{	
	
	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	
	import edu.isi.bmkeg.ftd.events.*;
	import edu.isi.bmkeg.ftd.services.IExtendedFtdService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class RunRuleSetCommand extends Command
	{
	
		[Inject]
		public var event:RunRuleSetEvent;

		[Inject]
		public var service:IExtendedFtdService;
						
		override public function execute():void
		{
			this.service.runRuleSet(event.ftd, event.rs);
		}
		
	}
	
}