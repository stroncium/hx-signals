import haxe.Timer;

import signals.Signal;
import signals.Signal1;
import signals.Signal2;
import signals.Signal3;
import signals.Signal4;
import signals.Signal5;



class Catcher0{
  public function new(){}
  public function catch0(){}
  public function catch1(){}
  public function catch2(){}
  public function catch3(){}
  public function catch4(){}
  public function catch5(){}
  }

class Catcher1{
  public function new(){}
  public function catch0(a0:Int){}
  public function catch1(a0:Int){}
  public function catch2(a0:Int){}
  public function catch3(a0:Int){}
  public function catch4(a0:Int){}
  public function catch5(a0:Int){}
  }

class Catcher2{
  public function new(){}
  public function catch0(a0:Int, a1:Int){}
  public function catch1(a0:Int, a1:Int){}
  public function catch2(a0:Int, a1:Int){}
  public function catch3(a0:Int, a1:Int){}
  public function catch4(a0:Int, a1:Int){}
  public function catch5(a0:Int, a1:Int){}
  }

class Catcher3{
  public function new(){}
  public function catch0(a0:Int, a1:Int, a2:Int){}
  public function catch1(a0:Int, a1:Int, a2:Int){}
  public function catch2(a0:Int, a1:Int, a2:Int){}
  public function catch3(a0:Int, a1:Int, a2:Int){}
  public function catch4(a0:Int, a1:Int, a2:Int){}
  public function catch5(a0:Int, a1:Int, a2:Int){}
  }

class Catcher4{
  public function new(){}
  public function catch0(a0:Int, a1:Int, a2:Int, a3:Int){}
  public function catch1(a0:Int, a1:Int, a2:Int, a3:Int){}
  public function catch2(a0:Int, a1:Int, a2:Int, a3:Int){}
  public function catch3(a0:Int, a1:Int, a2:Int, a3:Int){}
  public function catch4(a0:Int, a1:Int, a2:Int, a3:Int){}
  public function catch5(a0:Int, a1:Int, a2:Int, a3:Int){}
  }

class Catcher5{
  public function new(){}
  public function catch0(a0:Int, a1:Int, a2:Int, a3:Int, a4:Int){}
  public function catch1(a0:Int, a1:Int, a2:Int, a3:Int, a4:Int){}
  public function catch2(a0:Int, a1:Int, a2:Int, a3:Int, a4:Int){}
  public function catch3(a0:Int, a1:Int, a2:Int, a3:Int, a4:Int){}
  public function catch4(a0:Int, a1:Int, a2:Int, a3:Int, a4:Int){}
  public function catch5(a0:Int, a1:Int, a2:Int, a3:Int, a4:Int){}
  }



class Test{
  static var IT = 100000;
  var matrix:Array<Array<Float>>;
  var cb0:Array<Float>;
  var cb1:Array<Float>;

  public static function main(){
    var test = new Test();
    }

  public function new(){
    matrix = new Array<Array<Float>>();
    matrix[0] = new Array<Float>();
    matrix[1] = new Array<Float>();
    matrix[2] = new Array<Float>();
    matrix[3] = new Array<Float>();
    matrix[4] = new Array<Float>();
    matrix[5] = new Array<Float>();
    cb0 = new Array<Float>();
    cb1 = new Array<Float>();
    #if flash
      trace('waiting 1 second...');
      Timer.delay(run, 1000);
    #else
      run();
    #end
    }

  function run(){
    var me = this;
    #if flash
      trace('running...');
      test_callbacks_0();
      trace("null calbacks [DONE]");
      test_callbacks_1();
      trace("calbacks [DONE]");
      Timer.delay(function (){
        me.test_part0();
        trace("0 arg signals [DONE]");
        Timer.delay(function (){
          me.test_part1();
          trace("1 arg signals [DONE]");
          Timer.delay(function (){
           me.test_part2();
            trace("2 arg signals [DONE]");
            Timer.delay(function (){
              me.test_part3();
              trace("3 arg signals [DONE]");
              Timer.delay(function (){
                me.test_part4();
                trace("4 arg signals [DONE]");
                Timer.delay(function (){
                  me.test_part5();
                  trace("5 arg signals [DONE]");
                  me.finish();
                  }, 50);
                }, 50);
              }, 50);
            }, 50);
          }, 50);
        }, 50);
    #else
      trace('running...');
      test_callbacks_0();
      trace("null calbacks [DONE]");
      test_callbacks_1();
      trace("calbacks [DONE]");
      me.test_part0();
      trace("0 arg signals [DONE]");
      me.test_part1();
      trace("1 arg signals [DONE]");
      me.test_part2();
      trace("2 arg signals [DONE]");
      me.test_part3();
      trace("3 arg signals [DONE]");
      me.test_part4();
      trace("4 arg signals [DONE]");
      me.test_part5();
      trace("5 arg signals [DONE]");
      me.finish();
    #end
    }

  function finish(){
    patchdata();
    var txt;
    txt = "calbacks args - ms per "+IT+" iterations\n"+"\t0\t1\t2\t3\t4\t5\n";
    txt+= "null\t"+cb0.join("\t")+"\n";
    txt+= "cb\t"+cb1.join("\t");
    trace(txt);
    txt = "listeners\\arguments - ms per "+IT+" iterations\n"+"\t0\t1\t2\t3\t4\t5\n";
    txt+= "0|\t"+matrix[0].join("\t") + "\n";
    txt+= "1|\t"+matrix[1].join("\t") + "\n";
    txt+= "2|\t"+matrix[2].join("\t") + "\n";
    txt+= "3|\t"+matrix[3].join("\t") + "\n";
    txt+= "4|\t"+matrix[4].join("\t") + "\n";
    txt+= "5|\t"+matrix[5].join("\t") + "\n";
    trace(txt);
    }

  function patchdata(){
    for(i1 in 0...6)
      for(i2 in 0...6)
        matrix[i1][i2] = Std.int(matrix[i1][i2] * 10000) / 10;
    for(i in 0...6)
      cb0[i] = Std.int(cb0[i] * 10000) / 10;
    for(i in 0...6)
      cb1[i] = Std.int(cb1[i] * 10000) / 10;
    }


  function test_callbacks_0(){
    cb0[0] = test_callback_0_0(IT);
    cb0[1] = test_callback_1_0(IT);
    cb0[2] = test_callback_2_0(IT);
    cb0[3] = test_callback_3_0(IT);
    cb0[4] = test_callback_4_0(IT);
    cb0[5] = test_callback_5_0(IT);
    }

  function test_callbacks_1(){
    cb1[0] = test_callback_0_1(IT);
    cb1[1] = test_callback_1_1(IT);
    cb1[2] = test_callback_2_1(IT);
    cb1[3] = test_callback_3_1(IT);
    cb1[4] = test_callback_4_1(IT);
    cb1[5] = test_callback_5_1(IT);
    }

  function test_part0(){
    matrix[0][0] = test_signal_0_0(IT);
    matrix[1][0] = test_signal_0_1(IT);
    matrix[2][0] = test_signal_0_2(IT);
    matrix[3][0] = test_signal_0_3(IT);
    matrix[4][0] = test_signal_0_4(IT);
    matrix[5][0] = test_signal_0_5(IT);
    }

  function test_part1(){
    matrix[0][1] = test_signal_1_0(IT);
    matrix[1][1] = test_signal_1_1(IT);
    matrix[2][1] = test_signal_1_2(IT);
    matrix[3][1] = test_signal_1_3(IT);
    matrix[4][1] = test_signal_1_4(IT);
    matrix[5][1] = test_signal_1_5(IT);
    }

  function test_part2(){
    matrix[0][2] = test_signal_2_0(IT);
    matrix[1][2] = test_signal_2_1(IT);
    matrix[2][2] = test_signal_2_2(IT);
    matrix[3][2] = test_signal_2_3(IT);
    matrix[4][2] = test_signal_2_4(IT);
    matrix[5][2] = test_signal_2_5(IT);
    }

  function test_part3(){
    matrix[0][3] = test_signal_3_0(IT);
    matrix[1][3] = test_signal_3_1(IT);
    matrix[2][3] = test_signal_3_2(IT);
    matrix[3][3] = test_signal_3_3(IT);
    matrix[4][3] = test_signal_3_4(IT);
    matrix[5][3] = test_signal_3_5(IT);
    }

  function test_part4(){
    matrix[0][4] = test_signal_4_0(IT);
    matrix[1][4] = test_signal_4_1(IT);
    matrix[2][4] = test_signal_4_2(IT);
    matrix[3][4] = test_signal_4_3(IT);
    matrix[4][4] = test_signal_4_4(IT);
    matrix[5][4] = test_signal_4_5(IT);
    }

  function test_part5(){
    matrix[0][5] = test_signal_5_0(IT);
    matrix[1][5] = test_signal_5_1(IT);
    matrix[2][5] = test_signal_5_2(IT);
    matrix[3][5] = test_signal_5_3(IT);
    matrix[4][5] = test_signal_5_4(IT);
    matrix[5][5] = test_signal_5_5(IT);
    }


  static function test_callback_0_0(ITER:Int){
      var cb:Void->Void = null;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb();
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_callback_0_1(ITER:Int){
      var c = new Catcher0();
      var cb:Void->Void = c.catch1;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb();
        i--;
        }
      return Timer.stamp() - t;
      }


  static function test_callback_1_0(ITER:Int){
      var cb:Int->Void = null;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0);
        i--;
        }
      return Timer.stamp() - t;
      }
  static function test_callback_1_1(ITER:Int){
      var c = new Catcher1();
      var cb:Int->Void = c.catch1;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_callback_2_0(ITER:Int){
      var cb:Int->Int->Void = null;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0, 1);
        i--;
        }
      return Timer.stamp() - t;
      }
  static function test_callback_2_1(ITER:Int){
      var c = new Catcher2();
      var cb = c.catch1;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0, 1);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_callback_3_0(ITER:Int){
      var cb:Int->Int->Int->Void = null;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0, 1, 2);
        i--;
        }
      return Timer.stamp() - t;
      }
  static function test_callback_3_1(ITER:Int){
      var c = new Catcher3();
      var cb = c.catch1;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0, 1, 2);
        i--;
        }
      return Timer.stamp() - t;
      }


  static function test_callback_4_0(ITER:Int){
      var cb:Int->Int->Int->Int->Void = null;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0, 1, 2, 3);
        i--;
        }
      return Timer.stamp() - t;
      }
  static function test_callback_4_1(ITER:Int){
      var c = new Catcher4();
      var cb = c.catch1;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0, 1, 2, 3);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_callback_5_0(ITER:Int){
      var cb:Int->Int->Int->Int->Int->Void = null;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0, 1, 2, 3, 4);
        i--;
        }
      return Timer.stamp() - t;
      }
  static function test_callback_5_1(ITER:Int){
      var c = new Catcher5();
      var cb = c.catch1;

      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        if(cb != null) cb(0, 1, 2, 3, 4);
        i--;
        }
      return Timer.stamp() - t;
      }



// GENERATED FUNCTIONS



  static function test_signal_0_0(ITER:Int){
      var s = new Signal();
      var c = new Catcher0();
      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch();
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_0_1(ITER:Int){
      var s = new Signal();
      var c = new Catcher0();
      var i = ITER;
      s.add(c.catch0);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch();
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_0_2(ITER:Int){
      var s = new Signal();
      var c = new Catcher0();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch();
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_0_3(ITER:Int){
      var s = new Signal();
      var c = new Catcher0();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch();
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_0_4(ITER:Int){
      var s = new Signal();
      var c = new Catcher0();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch();
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_0_5(ITER:Int){
      var s = new Signal();
      var c = new Catcher0();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      s.add(c.catch4);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch();
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_1_0(ITER:Int){
      var s = new Signal1<Int>();
      var c = new Catcher1();
      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_1_1(ITER:Int){
      var s = new Signal1<Int>();
      var c = new Catcher1();
      var i = ITER;
      s.add(c.catch0);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_1_2(ITER:Int){
      var s = new Signal1<Int>();
      var c = new Catcher1();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_1_3(ITER:Int){
      var s = new Signal1<Int>();
      var c = new Catcher1();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_1_4(ITER:Int){
      var s = new Signal1<Int>();
      var c = new Catcher1();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_1_5(ITER:Int){
      var s = new Signal1<Int>();
      var c = new Catcher1();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      s.add(c.catch4);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_2_0(ITER:Int){
      var s = new Signal2<Int, Int>();
      var c = new Catcher2();
      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_2_1(ITER:Int){
      var s = new Signal2<Int, Int>();
      var c = new Catcher2();
      var i = ITER;
      s.add(c.catch0);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_2_2(ITER:Int){
      var s = new Signal2<Int, Int>();
      var c = new Catcher2();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_2_3(ITER:Int){
      var s = new Signal2<Int, Int>();
      var c = new Catcher2();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_2_4(ITER:Int){
      var s = new Signal2<Int, Int>();
      var c = new Catcher2();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_2_5(ITER:Int){
      var s = new Signal2<Int, Int>();
      var c = new Catcher2();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      s.add(c.catch4);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_3_0(ITER:Int){
      var s = new Signal3<Int, Int, Int>();
      var c = new Catcher3();
      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_3_1(ITER:Int){
      var s = new Signal3<Int, Int, Int>();
      var c = new Catcher3();
      var i = ITER;
      s.add(c.catch0);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_3_2(ITER:Int){
      var s = new Signal3<Int, Int, Int>();
      var c = new Catcher3();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_3_3(ITER:Int){
      var s = new Signal3<Int, Int, Int>();
      var c = new Catcher3();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_3_4(ITER:Int){
      var s = new Signal3<Int, Int, Int>();
      var c = new Catcher3();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_3_5(ITER:Int){
      var s = new Signal3<Int, Int, Int>();
      var c = new Catcher3();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      s.add(c.catch4);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_4_0(ITER:Int){
      var s = new Signal4<Int, Int, Int, Int>();
      var c = new Catcher4();
      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_4_1(ITER:Int){
      var s = new Signal4<Int, Int, Int, Int>();
      var c = new Catcher4();
      var i = ITER;
      s.add(c.catch0);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_4_2(ITER:Int){
      var s = new Signal4<Int, Int, Int, Int>();
      var c = new Catcher4();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_4_3(ITER:Int){
      var s = new Signal4<Int, Int, Int, Int>();
      var c = new Catcher4();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_4_4(ITER:Int){
      var s = new Signal4<Int, Int, Int, Int>();
      var c = new Catcher4();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_4_5(ITER:Int){
      var s = new Signal4<Int, Int, Int, Int>();
      var c = new Catcher4();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      s.add(c.catch4);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_5_0(ITER:Int){
      var s = new Signal5<Int, Int, Int, Int, Int>();
      var c = new Catcher5();
      var i = ITER;
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3, 4);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_5_1(ITER:Int){
      var s = new Signal5<Int, Int, Int, Int, Int>();
      var c = new Catcher5();
      var i = ITER;
      s.add(c.catch0);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3, 4);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_5_2(ITER:Int){
      var s = new Signal5<Int, Int, Int, Int, Int>();
      var c = new Catcher5();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3, 4);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_5_3(ITER:Int){
      var s = new Signal5<Int, Int, Int, Int, Int>();
      var c = new Catcher5();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3, 4);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_5_4(ITER:Int){
      var s = new Signal5<Int, Int, Int, Int, Int>();
      var c = new Catcher5();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3, 4);
        i--;
        }
      return Timer.stamp() - t;
      }

  static function test_signal_5_5(ITER:Int){
      var s = new Signal5<Int, Int, Int, Int, Int>();
      var c = new Catcher5();
      var i = ITER;
      s.add(c.catch0);
      s.add(c.catch1);
      s.add(c.catch2);
      s.add(c.catch3);
      s.add(c.catch4);
      var t = Timer.stamp();
      while(i > 0){
        s.dispatch(0, 1, 2, 3, 4);
        i--;
        }
      return Timer.stamp() - t;
      }

  }
