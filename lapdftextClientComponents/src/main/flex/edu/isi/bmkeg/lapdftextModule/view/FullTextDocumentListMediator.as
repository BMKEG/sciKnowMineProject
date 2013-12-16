package edu.isi.bmkeg.lapdftextModule.view
{
	
	import edu.isi.bmkeg.lapdftextModule.events.*;
	import edu.isi.bmkeg.lapdftextModule.model.*;
	import edu.isi.bmkeg.ftd.model.qo.FTD_qo;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class FullTextDocumentListMediator extends Mediator
	{
		[Inject]
		public var view:FullTextDocumentList;
		
		[Inject]
		public var listModel:PagedListModel;

		[Inject]
		public var model:LapdftextModel;
		
		override public function onRegister():void
		{
			
			addContextListener(PagedListUpdatedEvent.UPDATED, 
				fullTextDocumentsListUpdatedHandler);

			addContextListener(ClearCorpusEvent.CLEAR_CORPUS, 
				clearCorpusHandler);
			
			addViewListener(FindFTDByIdEvent.FIND_FTD_BY_ID, 
				dispatch);

			listModel.pageSize = model.listPageSize;
			
			var ftd:FTD_qo = new FTD_qo();
			dispatch(new ListFTDPagedEvent(ftd, 0, 250));
		
		}
		
		private function fullTextDocumentsListUpdatedHandler(event:PagedListUpdatedEvent):void
		{
			view.triageDocumentsList = listModel.pagedList;
			view.listLength = listModel.pagedListLength;
		}
						
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Reset everything
		//
		public function clearCorpusHandler(event:ClearCorpusEvent):void {
			view.triageDocumentsList = listModel.pagedList;	
		}
		
	}
	
}