FROM tensorflow/tensorflow:2.10.1-gpu as tfgpu

workdir /work

RUN pip install jupyterlab matplotlib pandas numpy 

cmd ["jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--NotebookApp.token=''", "--NotebookApp.password=''"]

FROM tensorflow/tensorflow:latest as tfcpu

workdir /work

RUN pip install jupyterlab matplotlib pandas numpy 

cmd ["jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--NotebookApp.token=''", "--NotebookApp.password=''"]