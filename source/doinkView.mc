using Toybox.WatchUi;

class MySimpleHRField extends WatchUi.SimpleDataField {

    // Set the label of the field here
    function initialize() {
        SimpleDataField.initialize();
        label = "My Current HR";
    }

    // Specifiy the Activity info to display in the field here
    function compute(info) {
        return info.currentHeartRate;
    }
}