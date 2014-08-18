package
{
import flash.display.Sprite;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import objects.Ball;
import objects.Wall;
	

	public class Main extends Sprite
	{		
		private const rightWallPosX:Number = 450;
		private var wallL : Wall;
		private var wallR : Wall;
		private var ball : Ball;
		
	
		public function Main()
		{
			init();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedDown);
			stage.addEventListener(Event.ENTER_FRAME, update);
		
		}
		
		protected function update(event:Event):void
		{
			ball.move();
			
			if((ball.x > wallL.x )&& (ball.x < wallL.x + wallL.width))
				ball.collision(1);	
			
		 	if((ball.y >wallR.y) && (ball.y < wallR.y +wallR.height))
				ball.collision(0);
		
		}
		
		public function init():void
		{
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			wallL   = new Wall(0xFFFFFF, 0, stage.stageHeight - Wall.wallHeight);
			wallL.x = 0;
			wallL.y = 150;
			
			addChild(wallL);
			
			wallR   = new Wall(0xFFFFFF, 0, stage.stageHeight - Wall.wallHeight);
			wallR.x = rightWallPosX;
			wallR.y = 150;
			
			addChild(wallR);
			
		
			ball = new Ball();
			ball.x = 150;
			ball.y = 150;
			
			addChild(ball);
	

		}
		private function keyPressedDown(event:KeyboardEvent):void {

			var key:uint = event.keyCode;

			if(key == Keyboard.DOWN )
				wallR.move(1) ;
			
			else if(key == Keyboard.UP )
				wallR.move(-1) ;
			
			if(key ==Keyboard.W )
				wallL.move(-1) ;
			
			else if(key ==Keyboard.S)
				wallL.move(1) ;
				
				
		}	
					
	}
}
