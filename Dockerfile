FROM python:3.12-slim

# Instale o Poetry
RUN pip install poetry==1.5.0

# Defina o diretório de trabalho
WORKDIR /src

# Copie os arquivos de dependência para o cache
COPY pyproject.toml poetry.lock* /src/

# Instale as dependências
RUN poetry install --no-root

# Copie o restante do projeto
COPY . /src

# Exponha a porta do Streamlit
EXPOSE 8501

# Defina o comando de entrada para rodar o Streamlit
ENTRYPOINT ["poetry", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
