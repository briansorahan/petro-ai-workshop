FROM       python:3.8.1-buster
RUN        pip install --upgrade pip
RUN        pip install notebook pandas bokeh xlrd matplotlib scikit-learn tpot ipywidgets
RUN        jupyter
WORKDIR    /root
EXPOSE     8888
ENTRYPOINT ["jupyter"]
