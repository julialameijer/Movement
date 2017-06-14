package {

	import flash.display.MovieClip;
	import flash.events.*;

	public class Player extends MovieClip {
		var vectorLocation: Vector2 = new Vector2(400,500);
		var acceleration: Vector2 = new Vector2(0, 0);
		var velocity: Vector2 = new Vector2(0, 0);
		var mouse: Vector2 = new Vector2(mouseX, mouseY);
		
		

		public function Player() {
			this.addEventListener(Event.ENTER_FRAME, Update);
		}
		public function Update(e: Event): void {
			mouse = new Vector2(mouseX, mouseY);
			acceleration.add(mouse);
			acceleration.mag();
			acceleration.normalize();
			velocity.add(acceleration);
			velocity.limit(10);
			vectorLocation.add(velocity);
			y = vectorLocation.y;
			x = vectorLocation.x;
		}

	}
}