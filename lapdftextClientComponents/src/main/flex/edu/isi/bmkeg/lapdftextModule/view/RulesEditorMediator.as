package edu.isi.bmkeg.lapdftextModule.view
{
	
	import edu.isi.bmkeg.lapdftextModule.events.*;
	import edu.isi.bmkeg.lapdftextModule.model.*;
	import edu.isi.bmkeg.ftd.events.*;
	import edu.isi.bmkeg.ftd.model.qo.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class RulesEditorMediator extends Mediator
	{
		[Inject]
		public var view:RulesEditor;
		
		[Inject]
		public var model:LapdftextModel;
		
		override public function onRegister():void
		{
			
			addContextListener(ListFTDRuleSetResultEvent.LIST_FTDRULESET_RESULT, 
				ftdRuleSetListUpdatedHandler);

			addContextListener(FindFTDRuleSetByIdResultEvent.FIND_FTDRULESETBY_ID_RESULT, 
				ftdRuleSetUpdatedHandler);

			addContextListener(FindFTDByIdResultEvent.FIND_FTDBY_ID_RESULT, 
				ftdUpdatedHandler);

			addContextListener(ClearCorpusEvent.CLEAR_CORPUS, 
				clearCorpusHandler);
			
			addViewListener(FindFTDRuleSetByIdEvent.FIND_FTDRULESET_BY_ID, 
				dispatch);

			addViewListener(RunRuleSetEvent.RUN_RULE_SET, 
				dispatch);

			addViewListener(UploadRuleSetEvent.UPLOAD_RULE_SET, 
				dispatch);
			
			var rs:FTDRuleSet_qo = new FTDRuleSet_qo();
			dispatch(new ListFTDRuleSetEvent(rs));
		
		}
		
		private function ftdRuleSetListUpdatedHandler(event:ListFTDRuleSetResultEvent):void
		{
			view.ruleSetList = model.ruleSetList;
		}
						
		private function ftdRuleSetUpdatedHandler(event:FindFTDRuleSetByIdResultEvent):void
		{
			view.ruleSet = model.ruleSet;
		}
		
		private function ftdUpdatedHandler(event:FindFTDByIdResultEvent):void
		{
			view.ftd = model.currentFtd;
			view.ruleSet = model.currentFtd.ruleSet;
		}
		
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Reset everything
		//
		public function clearCorpusHandler(event:ClearCorpusEvent):void {
			//view.triageDocumentsList = listModel.pagedList;	
		}
		
	}
	
}