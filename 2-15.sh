if [[ "$1" == "--help" ]]; then

    echo "Этот скрипт генерирует случайные строки для создания директорий."

    echo "Сценарий при запуске считывает из переменной окружения число от 1 до 300."

    echo "Если число удовлетворяет диапазону, то результатом работы сценария будет текст,"

    echo "каждая строка которого будет иметь формат dir_<случайная строка>_<номер>,"

    echo "Если число не удовлетворяет диапазону, то результатом работы сценария будет текст ошибки."

    exit 0

fi

if [[ "$NUMBER" =~ ^[1-9][0-9]{0,2}$ ]]; then

  if [[ "$NUMBER" -le 300 ]]; then

    # Генерация случайной строки при помощи утилиты pwgen

    random_string=$(pwgen 8 1)



    # Цикл для формирования текста в соответствии с числом из переменной окружения

    for ((i=1; i<=$NUMBER; i++)); do

      echo "dir${random_string}${i}"

    done



    exit 0

  else

    echo "Ошибка: число в переменной окружения NUMBER должно быть от 1 до 300." >&2

    exit 1

  fi

else

  echo "Ошибка: значение переменной окружения NUMBER не соответствует допустимому диапазону." >&2

  exit 1

fi