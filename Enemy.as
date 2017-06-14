package {

	import flash.display.MovieClip;
	import flash.events.*;



	public class Enemy extends MovieClip {
		var main: Main;
		var myPlayer = new Player;
		var Enemylocation: Vector2;
		var acceleration: Vector2 = new Vector2(0, 0);
		var velocity: Vector2 = new Vector2(0, 0);
		
		public function Enemy(_main) {
			this.main = _main;
			Enemylocation = new Vector2(makeRangedNumber(0, main.stage.stageWidth), makeRangedNumber(0, main.stage.stageHeight));
			this.addEventListener(Event.ENTER_FRAME, Update);
			
		}

		

		public function Update(e: Event) {
			this.x = Enemylocation.x;
			this.y = Enemylocation.y;
		}
		public function makeRangedNumber(min: Number, max: Number): Number {
			return (Math.floor(Math.random() * (max - min + 1)) + min);
		}
	}
}