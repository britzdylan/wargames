class CfgSounds
{

    sounds[] = {};

   class EAS_ep001_intro
    {
        name = "EAS_ep001_intro";
        sound[] = {"sounds\EAS_ep001_intro.ogg", 3, 1, 25};
        titles[] = {};

        forceTitles = 1;
    };

    class EAS_ep001_convo_briefing
    {
        name = "EAS_ep001_convo_briefing";
        sound[] = {"sounds\EAS_ep001_convo_briefing.ogg", 5, 1, 30};
        titles[] = {};

        forceTitles = 1;
    };


};

class CfgMusic
{
    tracks[] = {};
	class EAS_ep001_intro
	{
		// display name
		name	= "Intro";

		// filename, volume, pitch
		sound[]	= { "\sounds\EAS_ep001_intro.ogg", db + 0, 1.0 };
	};
}