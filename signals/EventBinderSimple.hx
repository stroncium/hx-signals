package signals;

import signals.Signal;
import flash.events.Event;
import flash.events.IEventDispatcher;

class EventBinderSimple{

  public static function bind(dispatcher:IEventDispatcher, event:String):Signal{
    var binder = new EventBinderSimple();
    binder.dispatcher = dispatcher;
    binder.event = event;
    return binder.signal = new Signal(binder.activate, binder.deactivate);
    }

  var dispatcher:IEventDispatcher;
  var event:String;
  var signal:Signal;

  function new(){
    }

  function activate(){
    dispatcher.addEventListener(event, on_event);
    }

  function deactivate(){
    dispatcher.removeEventListener(event, on_event);
    }

  function on_event(e:Event){
    signal.dispatch();
    }

  }
