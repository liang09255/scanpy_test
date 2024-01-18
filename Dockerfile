# 基础镜像
FROM python:3.7

# 设置工作目录
WORKDIR /app

# 复制当前目录下的文件到工作目录
COPY . .

# 安装系统依赖
RUN apt-get update && \
    apt-get install -y build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装依赖包及其他第三方包
RUN pip install numpy scipy matplotlib pandas seaborn scikit-learn anndata leidenalg

# 安装Scanpy
RUN pip install scanpy

# 安装Jupyter
RUN pip install jupyter

# 设置环境变量
ENV MPLCONFIGDIR /app/mpl_config

# 设置启动命令
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
