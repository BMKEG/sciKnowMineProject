package edu.isi.bmkeg.lapdftextModule.model
{
	
	import edu.isi.bmkeg.ftd.model.FTD;
	import edu.isi.bmkeg.ftd.model.FTDRuleSet;
	import edu.isi.bmkeg.ftd.model.qo.FTD_qo;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Actor;

	[Bindable]
	public class LapdftextModel extends Actor
	{
		public var listPageSize:int = 200;
		
		public var ftds:ArrayCollection = new ArrayCollection();
				
		public var currentFtd:FTD;

		public var queryFtd:FTD_qo;

		public var nDoc:Number;
		
		public var ruleSetList:ArrayCollection = new ArrayCollection();
		
		public var ruleSet:FTDRuleSet;
		
	}

}