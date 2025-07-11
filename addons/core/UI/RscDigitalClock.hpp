class PVAR(RscDigitalClock) {

	idd = -1;
    duration = 9999;
    //fadeIn = 3;
    //fadeOut = 3;
    onLoad = Q(uiNamespace setVariable [ARR_2(QQPVAR(RscDigitalClock),_this select 0)]; [_this select 0] call FUNC(updateDigitalTime));

	class Controls {
        class DigitalClockStructuredText: RscStructuredText {
            idc = 1;
            type = 13;	            // defined constant
            style = 2;				// defined constant
            colorBackground[] = { 0, 0, 0, 0.0 };
            x = "safezoneX + 0.85 * safezoneW - 0.30";
            y = "safezoneY + 0.75 * safezoneH - 0.15";
            w = 0.30;
            h = 0.15;
            size = 0.1;
            text = "69:69:69";

            class Attributes
            {
                font = "LCD14";
                color = "#ff0000";
                align = "right";
                valign = "middle";
                shadow = "0";
                shadowColor = "#000000";
                size = "1";
            };
        };
	};

	class ControlsBackground {};
};
