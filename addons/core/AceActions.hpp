class Man;
class CAManBase: Man {
    class ACE_SelfActions {
        class PVAR(action) {
            displayName = CSTRING(ron_request);
            condition = QUOTE(_player call FUNC(action_cond));
            exceptions[] = {};
            statement = QUOTE(_player call FUNC(action_state));
            icon = PATH_TO_ADDON(logo.paa);
        };
    };
};