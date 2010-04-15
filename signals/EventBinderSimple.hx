/*           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *                    Version 2, December 2004
 *
 * Copyright (C) 2004 Sam Hocevar 14 rue de Plaisance, 75014 Paris, France
 * Everyone is permitted to copy and distribute verbatim or modified
 * copies of this license document, and changing it is allowed as long
 * as the name is changed.
 *
 *            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 *
 *  0. You just DO WHAT THE FUCK YOU WANT TO.
 * */

package signals;

import signals.Signal;
import flash.events.Event;
import flash.events.IEventDispatcher;

class EventBinderSimple{

  public static function bind(dispatcher:IEventDispatcher, event:String):Signal{
    var binder = new EventBinderSimple();
    binder.dispatcher = dispatcher;
    binder.event = event;
    return new Signal(binder.activate, binder.deactivate);
    }

  var dispatcher:IEventDispatcher;
  var event:String;
  var signal:Signal;

  function new(){
    }

  function activate(signal){
    this.signal = signal;
    dispatcher.addEventListener(event, on_event);
    }

  function deactivate(signal){
    this.signal = null;
    dispatcher.removeEventListener(event, on_event);
    }

  function on_event(e:Event){
    signal.dispatch();
    }

  }
