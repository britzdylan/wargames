class CfgSounds
{

    sounds[] = {};

   class EAS_planeTakingOff
    {
        name = "EAS_planeTakingOff";
        sound[] = {"sounds\EAS_planeTakingOff.ogg", 3, 1, 25};
        titles[] = {};
    };
    class EAS_planeTakingOff_2
    {
        name = "EAS_planeTakingOff_2";
        sound[] = {"sounds\EAS_planeTakingOff_2.ogg", 3, 1, 25};
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