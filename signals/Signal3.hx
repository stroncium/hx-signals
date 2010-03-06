package signals;
class Signal3<T1, T2, T3>{
  var l:Array<T1->T2->T3->Void>; // catchers
  var o:Array<T1->T2->T3->Void>; // "once" catchers
  var lo:Int; // 16 bits for l length, 16 bits for o length
  // ...l.length is slow, o.length have no sense (look dispatch()), so we store them both in this Int

  public function new(){
    l = new Array<T1->T2->T3->Void>();
    o = new Array<T1->T2->T3->Void>();
    lo = 0;
    }

  public function add(f:T1->T2->T3->Void){
    l[lo >> 16] = f;
    lo+= 0x10000;
    }

  public function once(f:T1->T2->T3->Void){
    o[lo & 0x0000FFFF] = f;
    lo++;
    }

  #if !no_signal_dispatch_inlining
    inline
  #end
  public function dispatch(a1:T1, a2:T2, a3:T3){
    // inlining slightly reduces execution time,
    // ...but it's 3/5 - 4/5 of all time for signals with 0 catchers
    // ...so inlining makes signal faster than simple callback for 0 catcher cases
    var i;
    var len;

    i = 0;
    len = lo >> 16;
    while(i < len){
      l[i](a1, a2, a3);
      i++;
      }

    i = 0;
    len = lo & 0x0000FFFF;
    while(i < len){
      o[i](a1, a2, a3);
      o[i] = null; // we null it for gc, but don't delete to save time
      i++;
      }

    lo = lo & 0xFFFF0000; // so o len becomes 0
    }

  public function remove(f:T1->T2->T3->Void){ // removes first accourence in l
    var i = 0;
    var len = lo >> 16;
    while(i < len){
      if(l[i] == f)
        break;
      i++;
      }
    if(i < len){
      i++;
      while(i < len){
        l[i-1] = l[i];
        i++;
        }
      l[i] = null;
      lo-= 0x10000;
      }
    }

  public function removeAll(){ // brings back to initial state
    l = new Array<T1->T2->T3->Void>();
    o = new Array<T1->T2->T3->Void>();
    lo = 0;
    }
  }
