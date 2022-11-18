FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
COPY . .

# If you want to run any other commands use "RUN" before.

RUN apt update > aptud.log && apt install -y wget python3 python3-pip p7zip-full > apti.log
RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log

RUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/Cerebellum3Merge.bin" -O Cerebellum3Merge.bin.7z \
&& 7z e Cerebellum3Merge.bin.7z && rm Cerebellum3Merge.bin.7z && mv Cerebellum3Merge.bin engines/books/Cerebellum3Merge.bin

RUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/3-4-5piecesSyzygy.7z" -O 3-4-5piecesSyzygy.7z \
&& 7z e 3-4-5piecesSyzygy.7z && rm 3-4-5piecesSyzygy.7z

RUN chmod +x engines/stockfish15
#Engine name ^^^^^^^^^^^^^^^^^^^

CMD python3 lichess-bot.py -u
