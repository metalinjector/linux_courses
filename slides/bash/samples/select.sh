#!/bin/bash
PS3="Какого вы пола? "
select sex in "девочка" "мальчик" "еще не определилось"
do
  echo
  [ "$sex" == "девочка" -o "$sex" == "мальчик" ] && break || echo "Определитесь пожалуйста!"
done
echo "Вы -- $sex"
exit
