# Verwenden eines spezifischen Node.js-Images als Basis
FROM node:18

# Setzen des Arbeitsverzeichnisses im Container
WORKDIR /app

# Kopieren der `package.json` und `yarn.lock` (wenn Yarn verwendet wird) in das Arbeitsverzeichnis
COPY package.json .
COPY yarn.lock .

# Installieren von Abhängigkeiten
RUN yarn install --frozen-lockfile

# Kopieren aller Dateien in das Arbeitsverzeichnis
COPY . .

# Kompilieren des TypeScript-Codes in JavaScript
RUN yarn build

# Festlegen des Befehls, der beim Start des Containers ausgeführt werden soll
CMD ["node", "build/index.js"]

