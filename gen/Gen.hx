import neko.io.File;
import haxe.Template;

class Gen{
  static var tplpath = 'Signal.prehx';
  static var dir = '../signals/';
  public static function main(){
    File.write(dir+'Signal.hx', true).writeString(makeclass('Signal', 0));
    File.write(dir+'Signal1.hx', true).writeString(makeclass('Signal1', 1));
    File.write(dir+'Signal2.hx', true).writeString(makeclass('Signal2', 2));
    File.write(dir+'Signal3.hx', true).writeString(makeclass('Signal3', 3));
    File.write(dir+'Signal4.hx', true).writeString(makeclass('Signal4', 4));
    File.write(dir+'Signal5.hx', true).writeString(makeclass('Signal5', 5));

    }

  static function makeclass(name:String, argsnum:Int){
    var types, func, dispatch_args, call_args;
    if(argsnum > 0){
      var typesa = [];
      var dispa = [];
      var calla = [];
      for(i in 1 ... argsnum+1){
        typesa.push('T'+i);
        dispa.push('a'+i+':T'+i);
        calla.push('a'+i);
        }
      types = '<'+typesa.join(', ')+'>';
      func = typesa.join('->') + '->Void';
      dispatch_args = dispa.join(', ');
      call_args = calla.join(', ');
      }
    else{
      func = 'Void->Void';
      types = '';
      dispatch_args = '';
      call_args = '';
      }
    return tpl(tplpath, {
      name: name,
      types: types,
      func: func,
      dispatch_args: dispatch_args,
      call_args: call_args,
      });
    }


  static function tpl(path:String, context:Dynamic){
    return new Template(File.getContent(path)).execute(context);
    }
  }
