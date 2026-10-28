case "$1" in
  start)   echo "starting" ;;
  stop)    echo "stopping" ;;
  status)  echo "checking" ;;
  *)       echo "Usage: $0 start|stop|status"
           exit 1 ;;
esac
