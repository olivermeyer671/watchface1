import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

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
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        
        for(var i = 80; i < 130; i +=5){
            //dc.drawCircle(130, 130, i);
            //dc.drawCircle(130, 130, i+1);
        }
        
        dc.setPenWidth(2);
        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.drawRoundedRectangle(130-65, 130-20, 130, 40, 10);
        

        var clockTime = System.getClockTime();
        var seconds = 6*clockTime.sec;
        var minutes = 6*clockTime.min;
        var hours = 30*(clockTime.hour%12);
        dc.setColor(Graphics.COLOR_DK_GREEN, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(5);
        dc.drawArc(130,130,125,Graphics.ARC_CLOCKWISE,90,90 - seconds);
        dc.setColor(Graphics.COLOR_DK_RED, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(130,130,115,Graphics.ARC_CLOCKWISE,90,90 - minutes);
        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(130,130,105,Graphics.ARC_CLOCKWISE,90,90 - hours);
        
    }

}
