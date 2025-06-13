class CfgFunctions
{
    class ADDON
    {
        class action {
            file = PATH_TO_FUNC_SUB(action);
            class action_cond {};
            class action_state {};
        };

        class conditions {
            file = PATH_TO_FUNC_SUB(conditions);
            class canRON {};
            class checkTimeFrame {};
        };

        class init {
            file = PATH_TO_FUNC_SUB(init);
            class preInit { preInit = 1; };
            class suppressionHandler { preInit = 1; };

            class legacyAPI { postInit = 1; };
        };

        class ron {
            file = PATH_TO_FUNC_SUB(ron);

            class getTimeToSkip {};
            class gradientTimeAcc {};
            class hint {};
            class nearbyUnits {};

            class ron_request {};
            class ron_run {};

            class timeSkip {};
        };

        class transition {
            file = PATH_TO_FUNC_SUB(transition);

            class watch_client {};

            class basic_fade {};

            class updateDigitalTime {};

            class sog_watch {};
        };

        class interruption {
            file = PATH_TO_FUNC_SUB(interruption);
            class interruption {};
            class interrupt_chance {};
        };
    };
};
