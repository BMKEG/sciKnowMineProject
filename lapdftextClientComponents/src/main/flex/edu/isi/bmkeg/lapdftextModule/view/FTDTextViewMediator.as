package edu.isi.bmkeg.lapdftextModule.view
{

	import edu.isi.bmkeg.lapdftextModule.events.*;
	import edu.isi.bmkeg.lapdftextModule.model.*;
	import edu.isi.bmkeg.lapdftextModule.view.*;
	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.ftd.model.qo.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.pagedList.*;
	import edu.isi.bmkeg.pagedList.model.*;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	
	import mx.collections.ItemResponder;
	import mx.collections.errors.ItemPendingError;
	import mx.controls.Alert;
	import mx.events.CollectionEvent;
	import mx.managers.PopUpManager;
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class FTDTextViewMediator extends Mediator
	{
		
		[Inject]
		public var view:FTDTextView;
		
		[Inject]
		public var model:LapdftextModel;

		[Inject]
		public var listModel:PagedListModel;
		
		override public function onRegister():void {
			
			addContextListener(FindFTDByIdResultEvent.FIND_FTDBY_ID_RESULT, 
				findArticleCitationByIdResultHandler);

			loadCurrentSelection();
		}
		
		private function findArticleCitationByIdResultHandler(event:FindFTDByIdResultEvent):void {

			loadCurrentSelection();
		
		}

		private function loadCurrentSelection():void {
			
			try {
				
				var td:FTD = model.currentFtd;
				
				if (td == null) {

					view.clearFormFields();

				} else {
					
					var a:FTD = td;
					
					if (view.loadedFtd !== a) {
						view.loadedFtd = a;								
					}
				}
			
			} catch (e:ItemPendingError) {

				e.addResponder(new ItemResponder(itemPendingResult,null,listModel.selectedIndex));
			
			}			
		
		}

		private function itemPendingResult(result:Object, token:Object = null):void {

			loadCurrentSelection();
			
//			if (citationsListModel.selectedIndex == int(token) &&
//				result is ArticleCitation)
//			{
//				view.loadArticleCitation(ArticleCitation(result));
//			}
		}
		
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Reset everything
		//
		public function clearCorpusHandler(event:ClearCorpusEvent):void {
			
			view.clearFormFields();
			
		}

		//
		// This function is called directly from within
		//
		private function requestFetchObjects(list:PagedList, index:int, count:int):void 
		{
			var td:FTD_qo = model.queryFtd;
						
			dispatch(new ListFTDPagedEvent(td, index, list.pageSize));
			
		}
		
	}

}