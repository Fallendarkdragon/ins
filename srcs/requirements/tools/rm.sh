	echo "y" | docker system prune
	docker rmi $(docker images -aq)
	docker volume rm srcs_db_vol srcs_wp_vol
	echo "trachell" |sudo rm -rf /home/trachell/data/wp/*
	echo "trachell" |sudo rm -rf /home/trachell/data/db/*