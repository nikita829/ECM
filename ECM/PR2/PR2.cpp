#include <iostream>
#include <cstring>

const int MAX_BUFFER_SIZE = 200;  // Максимальный размер буфера

int main() {
    char buffer[MAX_BUFFER_SIZE];  // Буфер для хранения строки
    char msgInput[] = "Vvedite stroku (maksimum 200 simvolov): ";
    char msgOutput[] = "\nIzmenennaya stroka: ";
    char msgEnd[] = "\nKonec vvoda.\n";
    char msgOverflow[] = "\nOshibka: perepleneniye bufera.\n";

    std::cout << msgInput;
    std::cin.getline(buffer, MAX_BUFFER_SIZE);

    // Проверка переполнения буфера
    int length = std::strlen(buffer);
    if (length >= MAX_BUFFER_SIZE - 1) {
        std::cout << msgOverflow;
        return 1;
    }

    // Новый буфер для измененной строки
    char newBuffer[MAX_BUFFER_SIZE];
    int newLength = 0;

    // Удаляем все цифры из строки
    for (int i = 0; i < length; i++) {
        if (buffer[i] < '0' || buffer[i] > '9') {
            newBuffer[newLength++] = buffer[i];
        }
    }

    // Завершаем строку
    newBuffer[newLength] = '\0';

    // Выводим измененную строку
    std::cout << msgOutput << newBuffer << std::endl;
    std::cout << msgEnd;

    return 0;
}
