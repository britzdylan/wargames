class CfgSounds
{

    sounds[] = {};

    class EAS_altitude
    {
        name = "EAS_altitude";
        sound[] = {"sounds\EAS_altitude.ogg", 5, 1, 25};
        titles[] = {};
    };
   class EAS_planeTakingOff
    {
        name = "EAS_planeTakingOff";
        sound[] = {"sounds\EAS_planeTakingOff.ogg", 1, 1, 25};
        titles[] = {};
    };
    class EAS_planeTakingOff_2
    {
        name = "EAS_planeTakingOff_2";
        sound[] = {"sounds\EAS_planeTakingOff_2.ogg", 1, 1, 25};
        titles[] = {};
    };
    class EAS_tigrisOneSpotted
    {
        name = "EAS_tigrisOneSpotted";
        sound[] = {"sounds\EAS_tigrisOneSpotted.ogg", 1, 1, 25};
        titles[] = {};
    };
    class EAS_tigrisTwoSpotted
    {
        name = "EAS_tigrisTwoSpotted";
        sound[] = {"sounds\EAS_tigrisTwoSpotted.ogg", 1, 1, 25};
        titles[] = {};
    };
    class EAS_radarSpotted
    {
        name = "EAS_radarSpotted";
        sound[] = {"sounds\EAS_radarSpotted.ogg", 1, 1, 25};
        titles[] = {};
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