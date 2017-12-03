using Toybox.WatchUi as Ui;
using Toybox.Activity as Act;
using Toybox.ActivityMonitor as ActMon;
using Toybox.UserProfile;

class doughnutsView extends Ui.View {

	var bmp;
	var history;
	var doughnut_calories = 450.0;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
	    bmp = Ui.loadResource(Rez.Drawables.bmp_doughnut);
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
   
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        // Draw doughnut image
        dc.drawBitmap(
        		((dc.getWidth() / 2) - (205 / 2)),
        		((dc.getHeight() / 2) - (164 / 2) - 3),
			bmp
        );
        
        history = ActMon.getHistory();
        for(var i = 0; i < history.size(); i++) {
        		System.println("Day [" + history[i].startOfDay + "] - Calories [" + history[i].calories + "]");		
        }
        
        // Current Day
        var info = ActMon.getInfo();
    		System.println("Calories [" + info.calories + "]");		

		//var profile = UserProfile.getProfile();
		//System.out.println("The user was born in " + profile.birthYear);
        
        //System.out.println(history.size());
        //var calories = history.size();
        
        // Draw label
        dc.setColor(Graphics.COLOR_PINK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
			dc.getWidth() / 2,                      // gets the width of the device and divides by 2
	        10,                     // gets the height of the device and divides by 2
    		    dc.FONT_SMALL,                          // sets the font size
        		"Donuts Burnt",                          // the String to display
	        Graphics.TEXT_JUSTIFY_CENTER            // sets the justification for the text
		);
        
        // Draw doughnut count
        dc.setColor(Graphics.COLOR_PINK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
			dc.getWidth() / 2,                      // gets the width of the device and divides by 2
	        dc.getHeight() - 50,                     // gets the height of the device and divides by 2
    		    dc.FONT_LARGE,                          // sets the font size
        		info.calories/doughnut_calories,                          // the String to display
	        Graphics.TEXT_JUSTIFY_CENTER            // sets the justification for the text
		);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
