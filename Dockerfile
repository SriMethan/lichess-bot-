FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
COPY . .

# If you want to run any other commands use "RUN" before.

RUN apt update > aptud.log && apt install -y wget python3 python3-pip p7zip-full > apti.log
RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log

RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/main/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z
Run 7z e Cerebellum3Merge.bin.7z && rm Cerebellum3Merge.bin.7z

RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Syzygy/-/raw/main/3-4-5piecesSyzygy.7z" -O 3-4-5piecesSyzygy.7z
Run 7z e 3-4-5piecesSyzygy.7z && rm 3-4-5piecesSyzygy.7z

RUN chmod +x engines/stockfish15
#Engine name ^^^^^^^^^^^^^^^^^^^

CMD python3 lichess-bot.py -u
