package edu.isi.bmkeg.lapdftextModule
{
	import com.devaldi.controls.flexpaper.FlexPaperViewer;
	
	import edu.isi.bmkeg.lapdftextModule.controller.*;
	import edu.isi.bmkeg.lapdftextModule.events.*;
	import edu.isi.bmkeg.lapdftextModule.model.*;
	import edu.isi.bmkeg.lapdftextModule.view.*;
	
	import edu.isi.bmkeg.ftd.events.*;
	import edu.isi.bmkeg.ftd.services.IExtendedFtdService;
	import edu.isi.bmkeg.ftd.services.impl.ExtendedFtdServiceImpl;
	import edu.isi.bmkeg.ftd.services.serverInteraction.IExtendedFtdServer;
	import edu.isi.bmkeg.ftd.services.serverInteraction.impl.ExtendedFtdServerImpl;
	
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	import edu.isi.bmkeg.ftd.rl.services.impl.FtdServiceImpl;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.IFtdServer;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.impl.FtdServerImpl;
	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class LapdftextModuleContext extends ModuleContext
	{

		public function LapdftextModuleContext(contextView:DisplayObjectContainer,  injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{		
			
			mediatorMap.mapView(FullTextDocumentList, FullTextDocumentListMediator);
			mediatorMap.mapView(FTDTextView, FTDTextViewMediator);
			mediatorMap.mapView(FTDBlocksView, FTDBlocksViewMediator);
			mediatorMap.mapView(FlexPaperViewer, FlexPaperMediator);
			mediatorMap.mapView(RulesEditor, RulesEditorMediator);
			
			injector.mapSingleton(LapdftextModel);
			injector.mapSingleton(PagedListModel);
			injector.mapSingletonOf(IFtdServer, FtdServerImpl);
			injector.mapSingletonOf(IFtdService, FtdServiceImpl);
			injector.mapSingletonOf(IExtendedFtdServer, ExtendedFtdServerImpl);
			injector.mapSingletonOf(IExtendedFtdService, ExtendedFtdServiceImpl);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Run a paged list query for FullTextDocument objects
			// associated with a given Corpus (if that is present). 
			commandMap.mapEvent(ListFTDPagedEvent.LIST_FTD_PAGED, ListFTDPagedCommand);
			commandMap.mapEvent(ListFTDPagedResultEvent.LIST_FTD_PAGED_RESULT, ListFTDPagedResultCommand);
			//commandMap.mapEvent(CountPagedListLengthEvent.COUNT_PAGED_LIST_LENGTH, CountFullTextDocumentCommand);
			commandMap.mapEvent(CountFTDEvent.COUNT_FTD, CountFTDCommand);
			commandMap.mapEvent(CountFTDResultEvent.COUNT_FTD_RESULT, CountFTDResultCommand);
			commandMap.mapEvent(PagedListRetrievePageEvent.PAGEDLIST_RETRIEVE_PAGE, PagedListRetrievePageCommand);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Change selection of the FTD List control
			// Run a query for the document. 
			commandMap.mapEvent(FindFTDByIdEvent.FIND_FTD_BY_ID, FindFTDByIdCommand);
			commandMap.mapEvent(FindFTDByIdResultEvent.FIND_FTDBY_ID_RESULT, FindFTDByIdResultCommand);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// List the FTD Rule Sets
			commandMap.mapEvent(ListFTDRuleSetEvent.LIST_FTDRULESET, ListFTDRuleSetCommand);
			commandMap.mapEvent(ListFTDRuleSetResultEvent.LIST_FTDRULESET_RESULT, ListFTDRuleSetResultCommand);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Load an FTD Rule Set
			commandMap.mapEvent(FindFTDRuleSetByIdEvent.FIND_FTDRULESET_BY_ID, FindFTDRuleSetByIdCommand);
			commandMap.mapEvent(FindFTDRuleSetByIdResultEvent.FIND_FTDRULESETBY_ID_RESULT, FindFTDRuleSetByIdResultCommand);
			commandMap.mapEvent(RunRuleSetEvent.RUN_RULE_SET, RunRuleSetCommand);
			commandMap.mapEvent(RunRuleSetCompleteEvent.RUN_RULE_SET_COMPLETE, RunRuleSetCompleteCommand);

		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
	
}