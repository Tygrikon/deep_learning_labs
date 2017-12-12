import argparse
import sys
import pathlib
import cv2
import os


def save_image(target_folder, image_name, image):
    target = pathlib.Path(target_folder, image_name)
    target.parent.mkdir(parents=True, exist_ok=True)
    cv2.imwrite(target, image)


def main(args):
    target_size = args.size
    images = os.listdir(args.source_folder)
    for image_name in images:
        image = cv2.imread(image_name)
        if image.shape[0] > 1:
            image = cv2.resize(image, (150, 150))
            save_image(args.target_folder, image_name, image)


if __name__ == '__main__':
    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument("--source_folder", type=str,
                                 help="path to the images source folder"
                                 )
    argument_parser.add_argument("--target_folder", type=str,
                                 help="path to the target images folder"
                                 )
    argument_parser.add_argument("--size", type=int, default=(150, 150), nargs=2,
                                 help="target size: --size 150 150")
    args = argument_parser.parse_args()
    sys.exit(main(args))
