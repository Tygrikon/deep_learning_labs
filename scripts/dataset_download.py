import sys
import os
from urllib.request import urlretrieve
import time


DATASET_URL = "https://data.vision.ee.ethz.ch/cvl/rrothe/imdb-wiki/static/"
DATASET_FILE_NAME = "wiki.tar.gz"
DATASET_FOLDER = "./dataset/"
DATASET_ARCHIEVE = DATASET_FOLDER + DATASET_FILE_NAME

BYTES_IN_KBYTE = 1024
KBYTES_IN_MEGABYTE = 1024
BYTES_IN_MEGABYTE = BYTES_IN_KBYTE * KBYTES_IN_MEGABYTE


download_start_time = 0


def download_report(count, block_size, total_size):
    global download_start_time
    if count == 0:
        download_start_time = time.time()
        return
    duration = int(time.time() - download_start_time)
    if duration > 0:
        progress_size = int(count * block_size)
        speed = int(progress_size / (BYTES_IN_KBYTE * duration))
        percent = min(int(count * block_size * 100 / total_size), 100)
        downloaded_size = progress_size / BYTES_IN_MEGABYTE
        sys.stdout.write("\r===>{0}%, {1} MB, {2} KB/s, {3} seconds passed".format(percent,
                                                                                   downloaded_size,
                                                                                   speed, duration))
        sys.stdout.flush()


def download_archive(file_name, source, target_file):
    urlretrieve(source + file_name, target_file, download_report)


def retrieve_dataset():
    if not os.path.exists(DATASET_FOLDER):
        os.makedirs(DATASET_FOLDER)
    if not os.path.exists(DATASET_ARCHIEVE):
        download_archive(DATASET_FILE_NAME, DATASET_URL, DATASET_ARCHIEVE)
    print("Dataset archive is located in the {0}".format(DATASET_FOLDER))


def main():
    retrieve_dataset()


if __name__ == "__main__":
    sys.exit(main())
