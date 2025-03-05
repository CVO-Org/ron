class CfgFunctions
{
    class ADDON
    {
        class COMPONENT
        {
            file = PATH_TO_FUNC;

            class aceAction { postInit = 1; };
            class cbaEvents { preInit = 1; };
            class define { preInit = 1; };
            class suppressionHandler { preInit = 1; };

            class condition {};        
            
            class gradientTimeAcc {};

            class isNight {};

            class ron_request {};
            class ron_run {};

            class timeSkip {};

            class interruption {};
            class interrupt_chance {};

            class watch_display {};
            class watch_fade {};

            class nearbyUnits {};

            class hint {};
        };
    };
};