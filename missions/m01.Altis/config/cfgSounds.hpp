class CfgSounds
{

    sounds[] = {};

    class yourSound
    {
        name = "yourSound";
        sound[] = {"sounds\yourSound.ogg", 3, 1, 100};
        titles[] = {
            0, "Two years ago, President Panagopoulos of Altis and Stratis was assassinated during a public address in Athira.",
            6, "General Stavrou seized power, postponed elections indefinitely,",
            9, "and we've watched a functioning democracy collapse into civil war."
        };

        forceTitles = 1;
    };

    class EAS_convo_aaf_boat_patrol_spotted
    {
        name = "EAS_convo_aaf_boat_patrol_spotted";
        sound[] = {"sounds\EAS_convo_aaf_boat_patrol_spotted.ogg", 3, 1, 100};
        titles[] = {
            0, "Whiplash-6, this is Eagle-1, I am tracking 2 possibly 3 targets half a click west of your position, moving to intercept",
            7, "Solid copy Eagle-1",
            9, "Whiplash-3, call contact west. 3 possibly 4 vessels moving north. Break formation and engage, how copy over?",
            20, "Good copy Whiplash-6. Call contact west, Moving to engage over."
        };

        forceTitles = 1;
    };

    class EAS_convo_aaf_boat_patrol_firing
    {
        name = "EAS_convo_aaf_boat_patrol_firing";
        sound[] = {"sounds\EAS_convo_aaf_boat_patrol_firing.ogg", 3, 1, 100};
        titles[] = {
            0, "Engaging targets!",
        };

        forceTitles = 1;
    };

    class EAS_convo_aaf_boat_patrol_dead
    {
        name = "EAS_convo_aaf_boat_patrol_dead";
        sound[] = {"sounds\EAS_convo_aaf_boat_patrol_dead.ogg", 3, 1, 100};
        titles[] = {
            0, "6, 3, all target suppressed.",
            3, "Copy that 3, hold position, we will circle back after dropping precious cargo, eta 10 mikes."
        };

        forceTitles = 1;
    };
};