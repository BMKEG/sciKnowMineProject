package edu.isi.bmkeg.utils
{
	import flash.display.Sprite;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import mx.core.UIComponent;
	import mx.utils.ColorUtil;
	
	public class Spinner extends UIComponent
	{
		public static const COUNTER_CLOCKWISE:Number = 0;
		public static const CLOCKWISE:Number = 1;
		
		private var _engine:Number;
		private var _incRot:Number;
		private var _segmentCount:Number = 9;
		private var _segmentWidth:Number = 2;
		private var _innerDiameter:Number;
		private var _minLightnessPercent:Number = 70;
		private var _maxLightnessPercent:Number = -70;
		private var _baseColor:Number = 0x999999;
		private var _direction:Number = CLOCKWISE;
		private var _rate:Number = 50;
		private var container:Sprite;
		
		public function get segmentCount():Number
		{
			return _segmentCount;
		}
		
		public function set segmentCount(value:Number):void
		{
			_segmentCount = value;
			invalidateDisplayList();
		}
		
		public function get segmentWidth():Number
		{
			return _segmentWidth;
		}
		
		public function set segmentWidth(value:Number):void
		{
			_segmentWidth = value;
			invalidateDisplayList()
		}
		
		public function get innerDiameter():Number
		{
			return _innerDiameter;
		}
		
		public function set innerDiameter(value:Number):void
		{
			_innerDiameter = value;
			invalidateDisplayList();
		}
		
		public function get minLightnessPercent():Number
		{
			return _minLightnessPercent;
		}
		
		public function set minLightnessPercent(value:Number):void
		{
			_minLightnessPercent = value;
			invalidateDisplayList();
		}
		
		public function get maxLightnessPercent():Number
		{
			return _maxLightnessPercent;
		}
		
		public function set maxLightnessPercent(value:Number):void
		{
			_maxLightnessPercent = value;
			invalidateDisplayList();
		}
		
		public function get baseColor():Number
		{
			return _baseColor;
		}
		
		public function set baseColor(value:Number):void
		{
			_baseColor = value;
			invalidateDisplayList();
		}
		
		public function get direction():Number
		{
			return _direction;
		}
		
		public function set direction(value:Number):void
		{
			_direction = value;
			invalidateDisplayList();
		}
		
		public function get rate():Number
		{
			return _rate;
		}
		
		public function set rate(value:Number):void
		{
			_rate = value;
			invalidateDisplayList();
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);
			
			var s:Number = Math.min(w, h);
			var rad:Number = s / 2;
			var segmentHeight:Number = rad - (innerDiameter / 2 || s / 5);
			var curRot:Number = 0;
			var curLight:Number = _minLightnessPercent;
			
			_incRot = 360 / _segmentCount;
			
			var incLight:Number = ((_maxLightnessPercent - _minLightnessPercent) / _segmentCount);
			
			container = new Sprite();
			addChild(container);
			container.x = rad;
			container.y = rad;
			
			for (var i:Number = 0; i < segmentCount; i++)
			{
				var clr:Number = ColorUtil.adjustBrightness2(_baseColor, curLight);
				var seg:Sprite = new Sprite();
				seg.graphics.beginFill(clr);
				seg.graphics.moveTo(-segmentWidth / 2, -rad);
				seg.graphics.lineTo(segmentWidth / 2, -rad);
				seg.graphics.lineTo(segmentWidth / 2, -rad + segmentHeight);
				seg.graphics.lineTo(-segmentWidth / 2, -rad + segmentHeight);
				seg.graphics.endFill();
				seg.rotation = curRot;
				container.addChild(seg);
				curRot += _incRot;
				curLight += incLight;
			}
		}
		
		public function startSpin():void
		{
			clearInterval(_engine);
			_engine = setInterval(doSpin, rate);
		}
		
		public function stopSpin():void
		{
			clearInterval(_engine);
		}
		
		private function doSpin():void
		{
			if (_direction == CLOCKWISE && container)
			{
				container.rotation += _incRot;
			}
			else if (container)
			{
				container.rotation -= _incRot;
			}
		}
	}
}