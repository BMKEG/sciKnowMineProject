package edu.isi.bmkeg.ftd.events
{

	import flash.events.Event;
	import edu.isi.bmkeg.ftd.model.FTD;

	public class RunRuleSetCompleteEvent extends Event {

		public static const RUN_RULE_SET_COMPLETE:String = "runRuleSetComplete";

		public var id:Number;
		
		public function RunRuleSetCompleteEvent(id:Number)
		{
			super(RunRuleSetCompleteEvent.RUN_RULE_SET_COMPLETE);
			this.id = id;
		}

		override public function clone() : Event
		{
			return new RunRuleSetCompleteEvent(id);
		}

	}
}
