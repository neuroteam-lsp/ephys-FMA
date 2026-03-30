# wave_clus_matlab



Run wave_clus with matlab.
	Extract openEphys data, temporarily store them in a binary file for being processed by wave_clus

Input :

- Parameters section in <main_pipeline.m>
- fs is hardcoded at 30kHz in <openEphys2wave_clus.m>
- base_data_path: directory of the input data
- save_base_path : directory of saved spike sorted data.

Output : Creates a folder 'spike_sorting', in which you will find:

- outputs of wave_clus (png files of sorting output, spike times, spike clusters) in a subfolder of folder SPK
- ClusteringParameters.mat: contains clustering parameters ('dataFolder','chLst','numChannels','CommonRefChannels')
- <main_pipeline.m> takes care of destroying the temporary binary .dat file created for wave_clus
- <openEphys2wave_clus.m> takes care of destroying temporary wave_clus files

