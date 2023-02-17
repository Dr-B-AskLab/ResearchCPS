# ResearchCPS
Specifying and Reasoning about Concerns satisfaction in CPS --- NIST CPS Ontology

Installation Part 1

https://github.com/thanhnh-infinity/Research_CPS.git 

Installation video:

https://drive.google.com/file/d/1WQSi0P1LSlGCR--b0Hve0xBPrSWWc5Fw/view?usp=share_link

https://drive.google.com/file/d/1Gjj-rakZpUX5V_jnVK-PAoM5LT9eewEi/view?usp=sharing

If you get an error message about “javac not found”, use this link to install:

https://www.oracle.com/java/technologies/downloads/

Furthermore, your computer may not recognize the “cp” command used in the video (I believe this is a feature that may be exclusive to MacBooks). However, the workaround is just copying whatever files need to be copied manually into their respective places.

Step 6: Running the Program

The command is different on Windows. Use “java -Dfile.encoding=UTF-8 -classpath .\CPS_Test\bin asklab.querypicker.QueryPicker”


Installation Part 2
1.	git clone https://github.com/thanhnh-infinity/Research_CPS.git

2.	git checkout matthew (switching to the branch I’ve been using)

	* “cd Research_CPS” first, or command will not work
	
3.	Set up the environment with:

3a.	Install Anaconda here (and make sure it is installed on PATH!): https://www.anaconda.com/products/distribution/start-coding-immediately
3b.	cd Research_CPS\interface\testing\

3c.	conda env create -f ontology_GUI_env_windows.yml or conda env create -f ontology_GUI_env_mac.yml

4.	Run with:

a.	conda activate ontology_GUI_env_windows or conda activate ontology_GUI_env_mac

b.	dot -c (not sure what this does exactly, but it’s necessary)

c.	python OntologyGUI.py (to launch the editor) NOTE: the ontology files are loaded from subdirectory workshop_ontologies/

If you get a pygraphviz error, here is how to install it properly (pip will not work!):

Download and run:

https://gitlab.com/graphviz/graphviz/-/package_files/6164164/download

Paste this command into powershell (not command prompt!):

PS C:\> python -m pip install --global-option=build_ext `
              --global-option="-IC:\Program Files\Graphviz\include" `
              --global-option="-LC:\Program Files\Graphviz\lib" `
              pygraphviz

If you are on something else besides Windows, use this link to look at other supported operating systems: https://pygraphviz.github.io/documentation/stable/install.html


