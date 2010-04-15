package signals;
class Signal{
  var l:Array<Void->Void>; // catchers
  var o:Array<Void->Void>; // "once" catchers
  public var listeners(default, null):Int; // l.length is slow, o.length have no sense (look dispatch()),
  public var listenersOnce(default, null):Int; // ...so we store lenghts in this ints

  public dynamic function activate():Void;
  public dynamic function deactivate():Void;

  public function new(?activate:Void->Void = null, ?deactivate:Void->Void = null){
    this.activate = activate;
    this.deactivate = deactivate;
    l = new Array<Void->Void>();
    o = new Array<Void->Void>();
    listeners = 0;
    listenersOnce = 0;
    }

  public function add(f:Void->Void){
    l[listeners] = f;
    if( (listeners == 0) && (listenersOnce == 0) && (activate != null) )
      activate();
    listeners++;
    }

  public function once(f:Void->Void){
    o[listenersOnce] = f;
    if( (listeners == 0) && (listenersOnce == 0) && (activate != null) )
      activate();
    listenersOnce++;
    }

  #if !no_signal_dispatch_inlining
    inline
  #end
  public function dispatch(){
    // inlining slightly reduces execution time,
    // ...but it's 3/5 - 4/5 of alisteners time for signals with 0 catchers
    // ...so inlining makes signal faster than simple calistenersback for 0 catcher cases
    var i;

    i = 0;
    while(i < listeners){
      l[i]();
      i++;
      }

    i = 0;
    while(i < listenersOnce){
      o[i]();
      o[i] = null; // we null it for gc, but don't delete to save time
      i++;
      }
    if( (listeners == 0) && (listenersOnce != 0) && (deactivate != null) )
      deactivate();


    listenersOnce = 0; // so o "length" becomes 0

    }

  public function remove(f:Void->Void){ // removes first occurence in l
    var i = 0;
    while(i < listeners){
      if(l[i] == f)
        break;
      i++;
      }
    if(i < listeners){
      i++;
      while(i < listeners){
        l[i-1] = l[i];
        i++;
        }
      l[i] = null;
      listeners--;
      if( (listeners == 0) && (listenersOnce == 0) && (deactivate != null) )
        deactivate();
      }

    }

  public function removeAll(){ // brings back to initial state
    l = new Array<Void->Void>();
    o = new Array<Void->Void>();
    listeners = 0;
    listenersOnce = 0;
    if(deactivate != null)
      deactivate();
    }
  }
