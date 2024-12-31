# imap_bckp_mbox
Skrypt Bash do konfiguracji pobierania poczty za pomocą Getmail. (Wykonywanie kopii skrzynek pocztowych)

Ten skrypt automatyzuje konfigurację pobierania poczty z serwera IMAP przy użyciu narzędzia Getmail. Użytkownik podaje dane logowania do skrzynki e-mail, a skrypt tworzy odpowiednie katalogi, pliki konfiguracyjne oraz logi dla Getmail.

Funkcje:
Proste wprowadzanie danych (adres e-mail, serwer IMAP, hasło).
Tworzenie katalogów do przechowywania wiadomości i logów.
Generowanie pliku konfiguracyjnego dla Getmail.
Zapis konfiguracji do pliku CRON dla automatycznego uruchamiania synchronizacji.
Ustawianie odpowiednich uprawnień do katalogów i plików.

Wymagania:
Zainstalowany pakiet Getmail.
Uprawnienia administratora do tworzenia katalogów i zmiany właścicieli plików.
Przykład użycia:

bash
./_dodaj_skrzynke_do_bckp.sh

Uwagi:
Skrypt wymaga ręcznego podania danych logowania – upewnij się, że są one poprawne.
Hasła nie są szyfrowane, dlatego należy zachować ostrożność podczas ich przechowywania.
Domyślne ustawienia Getmail nie usuwają wiadomości z serwera.
