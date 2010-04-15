package signals;

import signals.Signal1;
import flash.events.Event;
import flash.events.IEventDispatcher;

class EventBinder<T>{
  public static function bind<T>(dispatcher:IEventDispatcher, event:String):Signal1<T>{
    var binder = new EventBinder<T>();
    binder.dispatcher = dispatcher;
    binder.event = event;
    return binder.signal = new Signal1<T>(binder.activate, binder.deactivate);
    }

  var dispatcher:IEventDispatcher;
  var event:String;
  var signal:Signal1<T>;

  function new(){
    }

  function activate(){
    dispatcher.addEventListener(event, on_event);
    }

  function deactivate(){
    dispatcher.removeEventListener(event, on_event);
    }

  function on_event(e:T){
    signal.dispatch(e);
    }

  }
