package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public class Pixel extends Bitmap
	{
		public function Pixel()
		{
			super(new BitmapData(16, 2, false, 0x000000));
			
			bitmapData.fillRect(new Rectangle(0, 0, 2, 2), 0x00FF00);
			bitmapData.fillRect(new Rectangle(2, 0, 2, 2), 0x80FF00);
			bitmapData.fillRect(new Rectangle(4, 0, 2, 2), 0x80FF80);
			bitmapData.fillRect(new Rectangle(6, 0, 2, 2), 0x008000);
			bitmapData.fillRect(new Rectangle(8, 0, 2, 2), 0x004000);
			bitmapData.fillRect(new Rectangle(10, 0, 2, 2), 0x008080);
			bitmapData.fillRect(new Rectangle(12, 0, 2, 2), 0x00FF40);
			bitmapData.fillRect(new Rectangle(14, 0, 2, 2), 0x00FF80);
		}
	}
}