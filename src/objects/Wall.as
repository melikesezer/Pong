package objects
{
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;

	
	public class Wall extends Sprite
	{		
		private const step:uint = 10;
		public static const wallHeight:Number = 60;
		
		
		private var _upperBound:Number;
		private var _lowerBound:Number;
		public function Wall(bgColor:uint, upperBound:Number, lowerBound:Number)
		{
			_upperBound = upperBound;
			_lowerBound = lowerBound;
			draw();
			addEventListener(Event.REMOVED, onRemove);
		
		}
		
		protected function onRemove(event:Event):void
		{
			removeEventListener(Event.REMOVED, onRemove);
			graphics.clear();
		}
		
		public function draw():void
		{
			var rectangle:Shape = new Shape();
			rectangle.graphics.beginFill(0x000000);
			rectangle.graphics.drawRect(20, 0, 8,wallHeight);
			rectangle.graphics.endFill(); 
			addChild(rectangle);
		}
		
		public function move(direction:int):void
		{
			if(direction == -1 && y > _upperBound)
				y -= step;// Move Up;
			else if(direction == 1 && y < _lowerBound)
				y += step;;// Move Down;
		}
	}
}
