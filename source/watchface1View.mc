import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;
using Toybox.Time.Gregorian;


class watchface1View extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$.$3$";
        var clockTime = System.getClockTime();
        var myStats = System.getSystemStats();
        var batt = myStats.battery;
        var HR = Activity.getActivityInfo().currentHeartRate;
        
        var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var date = Lang.format(
            "$1$-$2$ $3$ $4$",
            [
                today.day_of_week,
                today.day,
                today.month,
                today.year
            ]
        );
        
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$.$3$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours.format("%02d"), clockTime.min.format("%02d"), clockTime.sec.format("%02d")]);

        // Update the views
        var view1 = View.findDrawableById("TimeLabel") as Text;
        view1.setColor(Graphics.COLOR_WHITE);
        view1.setText(timeString);

        var view2 = View.findDrawableById("BatteryLabel") as Text;
        view2.setColor(Graphics.COLOR_WHITE);
        view2.setText(batt.format("%02d")+"%");
        if (HR != null){
            var view3 = View.findDrawableById("HRLabel") as Text;
            view3.setColor(Graphics.COLOR_WHITE);
            view3.setText(HR.format("%02d")+" BPM");
        }

        var view4 = View.findDrawableById("DateLabel") as Text;
        view4.setColor(Graphics.COLOR_WHITE);
        view4.setText(date);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
