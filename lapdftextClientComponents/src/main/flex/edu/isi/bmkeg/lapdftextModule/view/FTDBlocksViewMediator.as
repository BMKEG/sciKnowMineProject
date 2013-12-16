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
	
	import mx.collections.ArrayCollection;
	import mx.collections.ItemResponder;
	import mx.collections.errors.ItemPendingError;
	import mx.controls.Alert;
	import mx.events.CollectionEvent;
	import mx.managers.PopUpManager;
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class FTDBlocksViewMediator extends Mediator
	{
		
		[Inject]
		public var view:FTDBlocksView;
		
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
			
			
			var td:FTD = model.currentFtd;
			
			if (td != null) {

				var a:FTD = td;

				// TODO: Fix this.				
/*				view.imageList = new ArrayCollection();
				for( var i:int=0; i<a.pages.length; i++) {
					var pg:FTDPageImage = a.pages.getItemAt(i) as FTDPageImage;
					view.imageList.addItem( pg.pageImage );
				}*/
				
			}
								
		}
		
	}

}