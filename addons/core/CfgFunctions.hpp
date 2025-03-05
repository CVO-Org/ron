class CfgFunctions
{
    class ADDON
    {
        class COMPONENT
        {
            file = PATH_TO_FUNC;

            class cbaEvents { preInit = 1; };
            class suppressionHandler { preInit = 1; };


            class isNight {};
            class canRON {};        

            class hint {};
            class gradientTimeAcc {};

            class ron_request {};
            class ron_run {};

            class timeSkip {};

            class interruption {};
            class interrupt_chance {};
            class nearbyUnits {};

            class watch_display {};
            class watch_fade {};
        };

        class action
        {
            file = PATH_TO_FUNC_SUB(action);
            class action_cond {};
            class action_state {};
        };
    };
};