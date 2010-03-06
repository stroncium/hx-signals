package signals;
class Signal5<T1, T2, T3, T4, T5>{
  var l:Array<T1->T2->T3->T4->T5->Void>; // catchers
  var o:Array<T1->T2->T3->T4->T5->Void>; // "once" catchers
  var ll:Int; // l.length is slow, o.length have no sense (look dispatch()),
  var ol:Int; // ...so we store lenghts in this ints

  public function new(){
    l = new Array<T1->T2->T3->T4->T5->Void>();
    o = new Array<T1->T2->T3->T4->T5->Void>();
    ll = 0;
    ol = 0;
    }

  public function add(f:T1->T2->T3->T4->T5->Void){
    l[ll] = f;
    ll++;
    }

  public function once(f:T1->T2->T3->T4->T5->Void){
    o[ol] = f;
    ol++;
    }

  #if !no_signal_dispatch_inlining
    inline
  #end
  public function dispatch(a1:T1, a2:T2, a3:T3, a4:T4, a5:T5){
    // inlining slightly reduces execution time,
    // ...but it's 3/5 - 4/5 of all time for signals with 0 catchers
    // ...so inlining makes signal faster than simple callback for 0 catcher cases
    var i;

    i = 0;
    while(i < ll){
      l[i](a1, a2, a3, a4, a5);
      i++;
      }

    i = 0;
    while(i < ol){
      o[i](a1, a2, a3, a4, a5);
      o[i] = null; // we null it for gc, but don't delete to save time
      i++;
      }

    ol = 0; // so o "len" becomes 0
    }

  public function remove(f:T1->T2->T3->T4->T5->Void){ // removes first accourence in l
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
    l = new Array<T1->T2->T3->T4->T5->Void>();
    o = new Array<T1->T2->T3->T4->T5->Void>();
    ll = 0;
    ol = 0;
    }
  }
