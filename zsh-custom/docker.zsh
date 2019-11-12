# clean dangling images and finished containers
dkclean(){
    docker ps -f status=exited | tail -n +2 | awk '{system("docker rm -f "$1)}'
    docker images | awk '{if ($1 == "<none>" || $2 == "<none>"){system("docker rmi -f "$3)}}'
}

delete-img-confirm(){
    printf "${GREEN}delete $1?${NC} (y/n): "
    read confirmation
    if [ "$confirmation" = "y" ]; then
        docker rmi -f $2
        echo ''
    fi

}

# interactive image cleanup - iterate over all images, ask if it is to be removed
dk-img-clean(){
    IFS=$'\n' images=($(docker images | awk 'NR>1 {print $0}'))

    max_week_size=4
    for line in "${images[@]}"; do
        # echo $line
        id_img=$(echo $line | awk '{print $3}')
        img_name=$(echo $line | awk '{n=$1":"$2; print n}')

        # if older then a month
        is_month=$(echo $line | grep 'month')
        if [ ! -z "$is_month" ]; then 
            delete-img-confirm $img_name $id_img
            continue
        fi

        # remove older then 4 weeks
        num_week=$(echo $line | grep "week" | awk '{print $4}')
        if [ ! -z "$num_week" ] && [ $num_week -ge $max_week_size ]; then 
            delete-img-confirm $img_name $id_img
        fi
    done

}

