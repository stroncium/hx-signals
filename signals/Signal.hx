package signals;
class Signal{
  var l:Array<Void->Void>; // catchers
  var o:Array<Void->Void>; // "once" catchers
  var ll:Int; // l.length is slow, o.length have no sense (look dispatch()),
  var ol:Int; // ...so we store lenghts in this ints

  public function new(){
    l = new Array<Void->Void>();
    o = new Array<Void->Void>();
    ll = 0;
    ol = 0;
    }

  public function add(f:Void->Void){
    l[ll] = f;
    ll++;
    }

  public function once(f:Void->Void){
    o[ol] = f;
    ol++;
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
    while(i < ll){
      l[i]();
      i++;
      }

    i = 0;
    while(i < ol){
      o[i]();
      o[i] = null; // we null it for gc, but don't delete to save time
      i++;
      }

    ol = 0; // so o "len" becomes 0
    }

  public function remove(f:Void->Void){ // removes first accourence in l
    var i = 0;
    while(i < ll){
      if(l[i] == f)
        break;
      i++;
      }
    if(i < ll){
      i++;
      while(i < ll){
        l[i-1] = l[i];
        i++;
        }
      l[i] = null;
      ll = 0;
      }
    }

  public function removeAll(){ // brings back to initial state
    l = new Array<Void->Void>();
    o = new Array<Void->Void>();
    ll = 0;
    ol = 0;
    }
  }
