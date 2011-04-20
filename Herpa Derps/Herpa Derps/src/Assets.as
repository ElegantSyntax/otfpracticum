package  
{
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class Assets 
	{
		// TestLevel Layers															      Level/Layer/Index
		[Embed(source='Levels/TestLevel/Layer12(Background).png')]			public static const TestLevel_12_0:Class;
		[Embed(source='Levels/TestLevel/Layer10(BreakableTerrain).png')]	public static const TestLevel_10_0:Class;
		[Embed(source='Levels/TestLevel/Layer08(UnbreakableTerrain).png')]	public static const TestLevel_08_0:Class;
		[Embed(source='Levels/TestLevel/Layer08(Hazards).png')]				public static const TestLevel_08_1:Class;
		[Embed(source='Levels/TestLevel/Layer06(Locations).png')]			public static const TestLevel_06_0:Class;
		
		// Derp Units
		[Embed(source='Units/Runners.png')]									public static const Runners:Class;
		
		
		public function Assets():void
		{
		
		}
	}

}