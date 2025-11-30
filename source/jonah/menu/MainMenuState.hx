package jonah.menu;

class MainMenuState extends FlxState
{
	var menu:BaseListMenu;
	
	var menuTexts:FlxSpriteGroup;
	
	override public function create()
	{
		menuTexts = new FlxSpriteGroup();
		add(menuTexts);
		
		menu = new BaseListMenu();
		menu.onConfig.add(makeText);
		menu.onChangeSelection.add(onChangeSelection);
		menu.onMakeSelection.add(onMakeSelection);
		menu.configMenu([
			{name: "Play"},
			{name: "Play2"},
			{name: "Play3"},
			{name: "New Menu Options"}
		]);
		
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		
		if(FlxG.keys.justPressed.UP){
			menu.changeSelection(-1);
		} else if(FlxG.keys.justPressed.DOWN){
			menu.changeSelection(1);
		} 
		
		if(FlxG.keys.justPressed.ENTER){
			menu.makeSelection();
		}
	}
	
	function makeText():Void{
		for(i in menuTexts){
			i.destroy();
		}
		menuTexts.clear();
		
		for(i in menu.menuItems){
			var text = new FlxText(10, 20 * i.ID, 0, i.vanityName, 12);
			text.ID = i.ID;
			menuTexts.add(text);
		}
		
		menu.changeSelection();
	}
	
	function onChangeSelection(amount:Int):Void{
		for(i in menuTexts){
			if(i.ID == menu.curSelected){
				i.alpha = 1;
			} else {
				i.alpha = .4;
			}
		}
	}
	
	function onMakeSelection(curSelected:Int, menuItem:String):Void{
		switch(menuItem){
			case 'New Menu Options':
				menu.configMenu([
					{name: "Poop"},
					{name: "Poop2"},
				]);
		}
	}
}
