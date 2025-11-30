package jonah.menu.base;

@:structInit
class BaseMenuOption
{
    public var value:Dynamic;
    
    public var name:String;
    
    public var vanityName:String;
    
    public var ID:Int;
    
    public function new(
        value:Dynamic = null,
        name:String = null,
        vanityName:String = null
    )
    {
        this.value = value;
        this.name = name;
        this.vanityName = vanityName ?? name;
    }
}