from jupyter/tensorflow-notebook


RUN conda install --quiet --yes \
    'graphviz' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER && \
    pip install graphviz
