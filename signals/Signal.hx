package signals;

class Signal{
  var l:Array<Void->Void>; // listeners
  var o:Array<Void->Void>; // once listeners
  public var listeners(default, null):Int; // l.length is slow, o.length have no sense (look dispatch()),
  public var listenersOnce(default, null):Int; // ...so we store lenghts in this ints

  public var activate:Signal->Void;
  public var deactivate:Signal->Void;

  public function new(?activate:Signal->Void = null, ?deactivate:Signal->Void = null){
    this.activate = activate;
    this.deactivate = deactivate;
    l = new Array<Void->Void>();
    o = new Array<Void->Void>();
    listeners = 0;
    listenersOnce = 0;
    }

  public function add(f:Void->Void, ?prioritize:Bool = false){
    if(prioritize)
      l.insert(0, f);
    else
      l[listeners] = f;
    if( (listeners == 0) && (listenersOnce == 0) && (activate != null) )
      activate(this);
    listeners++;
    }

  public function once(f:Void->Void, ?prioritize:Bool = false){
    if(prioritize)
      o.insert(0, f);
    else
      o[listenersOnce] = f;
    if( (listeners == 0) && (listenersOnce == 0) && (activate != null) )
      activate(this);
    listenersOnce++;
    }

  #if !no_signal_dispatch_inlining
    inline
  #end
  public function dispatch(){
    // inlining slightly reduces execution time,
    // ...but it's 3/5 - 4/5 of all time for signals with 0 catchers
    // ...so inlining makes signal faster than simple callback for 0 catcher cases
    var i;
    i = 0;
    while(i < listeners)
      l[i++]();

    i = 0;
    while(i < listenersOnce){
      o[i]();
      o[i++] = null; // we null it for gc, but don't delete to save time
      }

    if( (listenersOnce > 0) && (listeners == 0) && (deactivate != null) )
      deactivate(this);

    listenersOnce = 0; // so o "length" becomes 0
    }

  public function remove(f:Void->Void){ // removes first occurence in l
    var i = listeners;
    while(--i >= 0) // search for listener
      if(l[i] == f)
        break;

    if(i >= 0){ // we found a listener in array?
      l.splice(i, 1);
      listeners--;
      if( (listeners == 0) && (listenersOnce == 0) && (deactivate != null) )
        deactivate(this);
      }

    }

  public function reset(){ // brings back to initial state
    l = new Array<Void->Void>();
    o = new Array<Void->Void>();
    if( ((listeners + listenersOnce) > 0) && (deactivate != null) )
      deactivate(this);
    listeners = 0;
    listenersOnce = 0;
    }
  }
