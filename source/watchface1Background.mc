import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    function initialize() {
        var dictionary = {
            :identifier => "Background"
        };

        Drawable.initialize(dictionary);
    }

    function draw(dc as Dc) as Void {
    
        // Set the background
        //dc.setColor(getApp().getProperty("BackgroundColor") as Number, Graphics.COLOR_RED);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        
        for(var i = 80; i < 130; i +=5){
            dc.drawCircle(130, 130, i);
            dc.drawCircle(130, 130, i+1);
        }
        for(var i = 0; i < 5; i++){
            dc.drawRoundedRectangle(130-65 - i/2, 130-20 - i/2, 130+i, 40+i, 10);
        }
        
    }

}
