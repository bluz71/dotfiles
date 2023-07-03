function psu --description 'List my processes'
    ps -u $USER -f $argv
end
