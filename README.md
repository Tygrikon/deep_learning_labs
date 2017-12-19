## Реализация нейронных сетей для задачи распознавания пола  
### Состав команды    

* Гладилов Глеб 
* Волокитин Валентин 
* Левин Вадим 
* Новак Александр 

### Постановка задачи

В качестве практической части нами была выбрана задача: **Pаспознаваниe пола человека по фотографии его лица.**
В терминах машинного обучения эту задачу можно описать, как задачу классификации на два класса: Мужчины и Женщины.   
В рамках данной лабораторной работы необходимо:
* Подготовить тестовые и тренировочные данные.
* Разаработать различные конфигурации нейронных сетей для задачи классификации.
* Провести обучение и тестирование разработанных моделей

### Описание набора данных

Для обучения и тестирования сетей нам был использован набор данных ["IMDB-WIKI"][dataset].
Набор представляет из себя фотографии знаменитостей полученных с сайта Wikipedia. Всего доступно 62,328 картинок, каждая из которых имеет следующее описание, доступное в файле .mat:
* dob – дата рождения
* fhoto_taken – год, когда было сделано фото
* full_path – путь до изображения
* gender - пол, 0 если женщина 1 если мужчина, NaN если не определен
* name – имя
* face_location – координаты лица (для полных картинок)

Максимальное разрешение картинки: 120x120
Мнимальное разрешения картинки: 370x370

### Подготовка тестового и тренировочного наборов данных

Исходное описание набора данных было конвертировано в файлы *.lst, содержащие внутри себя:
* Путь до картинки
* Метка картинки (пол)

Размер тестовой выборки: 20% (12000)
Размер тренировочной выборки: 80% (47000)

Для удобной работы, все изображения были отнормированы и приведены к единому разрешению 150x150, с использованием библиотеки OpenCV.

### Метрика качества решения задачи  

Для оценки качества полученной модели используются результаты запуска Caffe в тестовом режиме. Точность определяется по формуле:
accuracy = *TRUE / N*, где N - общее число примеров в тестовой выборке, TRUE - количество верно классифицированных примеров.


### Описание файлов репозитория  

* Readme.md – общее описание задачи
* FCNN – реализации полносвязанных нейронных сетей
* CNN – реализации сверточных нейронных сетей
* AutoEncoder – реализация автокодировщиков
* TransferLearning – реализация дообучения сети с исползованием натренированных весов 
* Scripts - необходимые скрипты для работы.

Структура директорий : 

* /src
	* exp_1_*
		* лог Caffe
		* prototxt
		* фаил с конфигурацией запуска 
		* скрипт для запуска
	* exp_2_*
	* ...
	* exp_n_*
* /report
	* Отчет_по_работе.pdf


### Используемая библиотека глубокого обучения

Для решения поставленной задачи была выбрана библиотека ["Caffe"][caffe]


### Используемые конфигурации оборудования

* Процессор Intel® Core™ i5-6600 CPU @ 3.30GHz. Видеокарта GeForce GTX 1080/PCIe/SSE2. Оперативная память: DDR4 16gb
* Процессор: Intel Sandy Bridge E5-2660 2.2 GHz. Видеокарта: Tesla K20X. Оперативная память: 64Gb .


<!-- LINKS -->

[dataset]: https://data.vision.ee.ethz.ch/cvl/rrothe/imdb-wiki/
[caffe]: http://caffe.berkeleyvision.org/