package edu.isi.bmkeg.lapdftextModule.controller
{	
	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListFTDRuleSetResultCommand extends Command
	{
		
		[Inject]
		public var event:ListFTDRuleSetResultEvent;
		
		[Inject]
		public var model:LapdftextModel;
	
		override public function execute():void
		{
			
			model.ruleSetList = event.list;
						
		}
		
	}
	
}