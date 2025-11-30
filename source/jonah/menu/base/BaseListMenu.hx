package jonah.menu.base;

class BaseListMenu
{
    public var menuItems:Array<BaseMenuOption> = [];
    
    public var curSelected:Int = 0;
    
    public var onConfig:FlxTypedSignal<Void->Void>;
    public var onChangeSelection:FlxTypedSignal<Int->Void>;
    public var onMakeSelection:FlxTypedSignal<Int->String->Void>;

    public function new(){             
        onConfig = new FlxTypedSignal<Void->Void>();
        onChangeSelection = new FlxTypedSignal<Int->Void>();
        onMakeSelection = new FlxTypedSignal<Int->String->Void>();
    }
    
    public function configMenu(menuItems:Array<BaseMenuOption>):Void{
        this.menuItems = menuItems;
        
        curSelected = 0;
        
        for(i in 0...menuItems.length){
            menuItems[i].ID = i;
        }
        
        onConfig.dispatch();
    }
    
    public function changeSelection(amount:Int = 0):Void{
        if(menuItems.length < 1){
            FlxG.log.warn('Your menu has no options!!');
            return;
        }
        
        curSelected += amount;
        
        if(curSelected >= menuItems.length){
            curSelected = menuItems.length - 1;
        } else if(curSelected < 0){
            curSelected = 0;
        }
        
        onChangeSelection.dispatch(amount);
    }
    
    public function makeSelection():Void{
        onMakeSelection.dispatch(curSelected, menuItems[curSelected].name);
    }
}