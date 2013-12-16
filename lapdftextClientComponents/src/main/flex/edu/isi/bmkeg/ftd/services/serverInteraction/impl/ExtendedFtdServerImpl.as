package edu.isi.bmkeg.ftd.services.serverInteraction.impl
{

	import edu.isi.bmkeg.ftd.services.serverInteraction.IExtendedFtdServer;

	import mx.collections.ArrayCollection;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.rpc.AbstractOperation;

	import edu.isi.bmkeg.utils.dao.Utils;

	public class ExtendedFtdServerImpl 
			extends RemoteObject 
			implements IExtendedFtdServer
	{

		private static const SERVICES_DEST:String = "extendedFtdServiceImpl";

		public function ExtendedFtdServerImpl()
		{
			destination = SERVICES_DEST;
			endpoint = Utils.getRemotingEndpoint();
			showBusyCursor = true;
		}
		
		public function get runRuleSet():AbstractOperation
		{
			return getOperation("runRuleSet");
		}

	}

}