package edu.isi.bmkeg.ftd.services.impl
{

	import flash.events.Event;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import org.robotlegs.mvcs.Actor;

	import edu.isi.bmkeg.vpdmf.model.ViewTable;
	import edu.isi.bmkeg.ftd.events.*;
	import edu.isi.bmkeg.ftd.model.*;

	import edu.isi.bmkeg.ftd.services.serverInteraction.*;

	import edu.isi.bmkeg.ftd.services.*;

	import edu.isi.bmkeg.utils.dao.*;

	public class ExtendedFtdServiceImpl extends Actor implements IExtendedFtdService {

		private var _server:IExtendedFtdServer;

		[Inject]
		public function get server():IExtendedFtdServer

		{
			return _server;
		}

		public function set server(s:IExtendedFtdServer):void
		{
			_server = s;
			initServer();
		}

		private function initServer():void
		{
			if (_server is AbstractService)
			{
				AbstractService(_server).addEventListener(FaultEvent.FAULT,faultHandler);
			}
		}

		private function asyncResponderFailHandler(fail:Object, token:Object):void
		{
			faultHandler(fail as FaultEvent);
		}

		private function faultHandler(event:FaultEvent):void
		{
			var failureEvent:ServiceFailureEvent = new ServiceFailureEvent(event);
			dispatch(failureEvent);
		}

		// ~~~~~~~~~
		// functions
		// ~~~~~~~~~

		public function runRuleSet(ftd:FTD, ftdRuleSet:FTDRuleSet):void {
			server.runRuleSet.cancel();
			var token:AsyncToken = server.runRuleSet.send(ftd, ftdRuleSet);
			var synRes:AsyncResponder = new AsyncResponder(
						runRuleSetResultHandler,
						asyncResponderFailHandler);
			token.addResponder(synRes);
		}
		
		// ~~~~~~~~~~~~~~~~~~~
		// result handlers
		// ~~~~~~~~~~~~~~~~~~~
		private function runRuleSetResultHandler(event:ResultEvent, token:Object):void
		{
			var id:Number = event.result as Number;
			dispatch(new RunRuleSetCompleteEvent(id));
		}


	}

}
