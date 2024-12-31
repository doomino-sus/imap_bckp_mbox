#!/bin/bash
function wprowadz () {
	clear
	echo
	echo Podaj pierwszy człon skrzynki mailowej "\""xxx@domena.pl"\"",
	echo gdzie "\""xxx"\"" to człon który należy podać.
	echo Np. "\""test"\"" dotyczyć będzie skrzynki "\""test@domena.pl"\""
	echo -n "> "
	read poplogin
	echo
	echo Podaj hasło do tej skrzynki - upewnij się czy na pewno jest właściwe
	echo -n "> "
	read poppassword
	echo
	echo Czy podany pełny login skrzynki jest prawidłowy:
	echo "\""${poplogin}@domena.pl"\""
	echo i czy hasło "\""${poppassword}"\"" jest poprawne? T/N
	echo -n "> "
	read popodp
	echo
		if [[ ${popodp} = T ]]
		then
			dalej;
		else
			wprowadz;
		fi
}

function dalej () {
	clear
	echo No i elegancko - jesteś Królem.
	mkdir /folder/poczta/SKRZYNKI/${poplogin}
	mkdir /folder/poczta/CONFIGs/${poplogin}
	chmod 770 /folder/poczta/ -R
	chown nobody:users /folder/poczta/ -R
	touch /folder/poczta/SKRZYNKI/${poplogin}/${poplogin}.mbox
        touch /folder/poczta/SKRZYNKI/${poplogin}/${poplogin}.log

	(
	echo "[retriever]"
	echo "type = SimpleIMAPRetriever"
	echo "server = nazwaserwerapocztowego.pl"
	echo "username = ${poplogin}@domena.pl"
	echo "password = ${poppassword}"
	echo "mailboxes = ALL"
	echo
	echo "[destination]"
	echo "type = Mboxrd"
	echo "path = /folder/poczta/SKRZYNKI/${poplogin}/${poplogin}.mbox"
	echo
	echo "[options]"
	echo "# only download *new* emails"
	echo "read_all = false"
	echo "# do not delete emails on server"
	echo "delete = false"
	echo "# do not alter emails"
	echo "delivered_to = false"
	echo "received = false"
	echo "# maximum downloads each run; 0 for no limit"
	echo "max_messages_per_session = 0"
	echo "# verbosity ... (2) print all actions; (1) print messages about retrieving and"
	echo "# deleting messages; (0) only print warnings and errors."
	echo "verbose = 1"
	echo "#zapisuje logi"
	echo "message_log = /folder/poczta/SKRZYNKI/${poplogin}/${poplogin}.log"
	) >/folder/poczta/CONFIGs/${poplogin}/getmailrc

	chmod 770 /folder/poczta/ -R
        chown nobody:users /folder/poczta/ -R
	echo "getmail --getmaildir=/folder/poczta/CONFIGs/${poplogin}/" >> /folder/_skrypty/CRON-getmail-bckp.sh
	echo "Finito all done"
}
wprowadz;


