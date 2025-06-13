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
            class cbaEvents { preInit = 1; };
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

        class watch {
            file = PATH_TO_FUNC_SUB(watch);
            class watch_display {};
            class watch_fade {};
        };

        class interruption {
            file = PATH_TO_FUNC_SUB(interruption);
            class interruption {};
            class interrupt_chance {};
        };
    };
};
