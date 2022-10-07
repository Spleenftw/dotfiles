ls -l *.c

if [ $1 == "math" ]
then 
    printf "Fichier à compiler : "
    read entree

    printf "Nom du fichier en sortie : "
    read sortie

    gcc -Wall $entree  -o $sortie -lm

    printf "Exécuter le fichier compilé ? "
    read compile

    case $compile in
    [YyOoOuiOUIYesYES]*)  ./$sortie;;
    *) exit 1;
    esac

else

    printf "Fichier à compiler : "
    read entree

    printf "Nom du fichier en sortie : "
    read sortie

    gcc -Wall $entree  -o $sortie

    printf "Exécuter le fichier compilé ? "
    read compile

    case $compile in
    [YyOoOuiOUIYesYES]*)  ./$sortie;;
    *) exit 1;;
    esac
fi
