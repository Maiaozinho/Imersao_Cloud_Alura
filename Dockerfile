# Use a imagem oficial do Python com Alpine Linux como base, que é mais leve
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências do projeto
# --no-cache-dir: evita o armazenamento de cache do pip, reduzindo o tamanho da imagem
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta que a aplicação FastAPI irá rodar(padrão é 8000)
EXPOSE 8000

# Define o comando padrão para executar a aplicação
# uvicorn: servidor ASGI para aplicações Python
# app:app:  indica o módulo (app.py) e a instância do FastAPI (app)
# --host 0.0.0.0:  ouve em todas as interfaces de rede
# --port 8000: define a porta em que a aplicação vai rodar
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]