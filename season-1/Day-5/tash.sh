
# Extract Unique IP Addresses Write an awk command to extract all unique IP addresses, 
#    regardless of their position in the log

log_file=./user_activity.log

extract_ip_addresses() {
    # iterate line by line
    for line in $(cat $log_file); do
        # extract ip address from each line by using awk
        ip=$(echo $line | awk  '{print $1}' |  grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}')
        # check if ip address is not empty
        if [ ! -z $ip ]; then
            # print ip address
            echo $ip
        fi
    done
}

# Extract Usernames Use AWK to extract usernames from the log. Ensure the script captures usernames appearing in different positions.

extract_usernames() {
    # iterate line by line
    for line in $(cat $log_file); do
        # extract username from each line that starts with user and ends with any number by using awk
        username=$(echo $line | awk '{print $1}' | grep -oE 'user[0-9]+')
        # extract username from each line that starts with user and ends with any number by using grep
        # check if username is not empty
        if [ ! -z $username ]; then
            # print username
            echo $username
        fi
    done
}

# Count HTTP Status Codes Count the occurrences of each HTTP status code (e.g., 200, 404, 500) in the log file and display them in sorted order.

count_http_status_codes() {
    # iterate line by line 
    while IFS= read -r line; do
        # echo "$line"
        http_status_code=$(awk '{print $NF}' <<< $line)
        # echo "HTTP Status Code: $http_status_code"
        # check if http status code is not empty
        if [ ! -z $http_status_code ]; then
            # increment the count of http status code
            http_status_codes["$http_status_code"]=$((${http_status_codes["$http_status_code"]}+1))
        fi
    done < "$log_file"

    # iterate over http status codes
    for code in "${!http_status_codes[@]}"; do
        # print http status code and its count
        echo "HTTP Status Code $code: ${http_status_codes[$code]}"
    done
}

# Identify Failed Login Attempts Extract all entries with a status code of 403 (indicating failed login attempts), along with their timestamps

failed_login_attempts() {
    # iterate line by line
    while IFS= read -r line; do
        # extract http status code from each line by using awk
        http_status_code=$(awk '{print $NF}' <<< $line)
        # extract timestamp from each line by using awk
        timestamp=$(grep -o '\[[^]]*\]' <<< $line | tr -d '[]')
        # echo "Timestamp: $timestamp"    
        # check if http status code is 403
        if [ $http_status_code -eq 403 ]; then
            # print timestamp and http status code
            echo "$timestamp $http_status_code"
        fi
    done < "$log_file"
}

# Generate a Summary Report Create a summary report including:
# Total number of unique users
# Total number of requests per user.
# Total number of successful requests (status code 200).
# Total number of failed requests (status codes 404 and 403).

summarfinalreport() {
    # Total number of unique users
    unique_users=$(awk '{for(i=1;i<=NF;i++) if ($i ~ /^user[0-9]+$/) print $i}' $log_file | sort | uniq | wc -l)
    echo "Total number of unique users: $unique_users"

    # Total number of requests per user.
    number_requests=$(awk '{for(i=1;i<=NF;i++) if ($i ~ /^user[0-9]+$/) print $i}' $log_file | sort | uniq -c | sort -nr)
    echo "Total number of requests per user: $number_reuqests"

    # Total number of successful requests (status code 200)
    successful_requests=$(awk '$NF == 200 {count++} END {print count}' "$log_file")
    echo "Total number of successful requests: $successful_requests"

    # Total number of failed requests (status codes 404 and 403)
    failed_requests=$(awk '$NF == 404 || $NF == 403 {count++} END {print count}' "$log_file")
    echo "Total number of failed requests: $failed_requests"
}



summarfinalreport