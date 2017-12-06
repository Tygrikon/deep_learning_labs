import cv2
import pathlib

for image_path in pathlib.Path('/home/glebg/Downloads/wiki_crop').glob('**/*.jpg'):
    image = cv2.imread(image_path.as_posix())
    image = cv2.resize(image, (150, 150))
    dest = pathlib.Path('/home/glebg/Downloads/wiki_crop_resized') / image_path.parent.name / image_path.name
    print(dest.as_posix())
    cv2.imwrite(dest.as_posix(), image)
