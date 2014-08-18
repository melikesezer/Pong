package objects
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Ball extends Sprite
	{
		private const maxVelocity : Number = 8;
		
		public var currentSpeed : Point;
		
		public function Ball()
		{
			currentSpeed = new Point (Math.random() * maxVelocity, Math.random() * maxVelocity + 4);
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
			graphics.beginFill(0x000000);
			graphics.drawCircle(0,0,8);
		}	
	
		public function move():void
		{
			x += currentSpeed.x;
			y += currentSpeed.y;
			
			if(this.x > stage.stageWidth || this.x <0)
				currentSpeed.x *= -1;
			
			
			else if(this.y > stage.stageHeight || this.y < 0)	
				currentSpeed.y *= -1;
	
		}
		public function collision(vector:int):void
		{
			if(vector == 1)
				currentSpeed.x *= -1;
			if(vector == 0)
				currentSpeed.y *= -1;
			
		}
		
	}
		
}



