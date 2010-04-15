import flash.display.Sprite;

import signals.Signal;
import signals.Signal1;
import signals.EventBinder;
import signals.EventBinderSimple;
import flash.text.TextField;
import flash.events.Event;
import flash.events.MouseEvent;

class Test2 extends Sprite{
  var clicked1:Signal;
  var clicked2:Signal1<Event>;

  public static function main(){
    flash.Lib.current.addChild(new Test2());
    }

  public function new(){
    super();
    graphics.beginFill(0, 1);
    graphics.drawRect(300, 300, 100, 100);

    var tf = new TextField();
    tf.x = tf.y = 200;
    tf.text = "click the box";
    addChild(tf);

    clicked1 = EventBinderSimple.bind(this, MouseEvent.CLICK);
    clicked1.add(function(){
      trace("clicked");
      });

    //~ clicked2 = EventBinder.bind(this, MouseEvent.CLICK);
    //~ clicked2.add(function(e){
      //~ trace("clicked "+e);
      //~ });



    }
  }
