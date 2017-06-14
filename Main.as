
package {
	import flash.display.*;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.sampler.DeleteObjectSample;
	import flash.utils.Timer;

	public class Main extends MovieClip {
		var myLightCircle = new LightCircle();
		var myPlayer = new Player();
		var myFakkel = new Fakkel;
		var Array1: Array = [];
		var i: int = 1;
		var Enemies: Array = new Array();
		var myEnemy = new Enemy(this);
		var myTimer:Timer = new Timer(1000, 2);


		public function Main() {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			addEventListener(Event.ENTER_FRAME, Update)
			
			AddTiles();
			AddLightCircle();
			AddEnemy();
			AddPlayer();
			this.setChildIndex(myLightCircle,this.numChildren -1);
		}

		public function Update(e: Event) {
			myLightCircle.x = 65 + myPlayer.x;
			myLightCircle.y = 220 + myPlayer.y;
		}

		public function AddTiles() {
			for (var y: int = 0; y <= 9; y++) {
				Array1[y] = [];
				for (var x: int = 0; x <= 20; x++) {
					Array1[y][x] = new GroundTile();
					addChildAt(Array1[y][x], 0);
					Array1[y][x].x = (x * 118)
					Array1[y][x].y = (y * 118)
				}
			}
		}
		public function AddEnemy() {
			for (var i = 0; i < 5 ; i++) {
				myEnemy = new Enemy(this);
				Enemies.push(myEnemy);
				addChild(Enemies[i]);
			}
		}
		
		public function AddLightCircle() {
			addChild(myLightCircle);
			myLightCircle.x = 65;
			myLightCircle.y = 220;
			
		}
		
		public function AddPlayer() {
			addChild(myPlayer);
		}

		public function KeyDown(e: KeyboardEvent): void {
			if (e.keyCode == Keyboard.SPACE) {
				for (var i = 0; i < Enemies.length; i++) {
					if (Enemies[i] != null && myPlayer.hitTestObject(Enemies[i])) {
						removeChild(Enemies[i])
						trace("Enemies = " + Enemies);
						Enemies[i] = null;
						break;
					}
				}
			}
		}
		public function loseorwin(){
			
			}
		}
	}
}