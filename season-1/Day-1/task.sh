#!/bin/bash
################################################################################
EMAIL="pvganeshkumar1999@example.com"
REPORT_FILE="/tmp/system_health_report.txt"

# Function to check disk usage
check_disk_usage() {
    echo "Disk Usage:"
    df -h
}

# Function to monitor running services
monitor_services() {
    echo "Running Services:"
    systemctl list-units --type=service --state=running | head -20
}

# Function to assess memory usage
assess_memory() {
    echo "Memory Usage:"
    free -m
}

# Function to evaluate CPU usage
evaluate_cpu() {
    echo "CPU Usage:"
    top -b -n1 | head -5
}

# Function to generate a system health report
generate_report() {
    {
        echo "System Health Report - $(date)"
        echo "-----------------------------------"
        echo "Disk Usage:"
        df -h
        echo ""
        echo "Memory Usage:"
        free -m
        echo ""
        echo "CPU Usage:"
        top -b -n1 | head -5
        echo ""
        echo "Running Services:"
        systemctl list-units --type=service --state=running | head -20
    } > "$REPORT_FILE"
}

# Function to send the report via email
send_report() {
    generate_report
    mail -s "System Health Report - $(date)" "$EMAIL" < "$REPORT_FILE"
    echo "System Health Report sent to $EMAIL"
}

# Main menu
while true; do
    clear
    echo "===== System Health Check Menu ====="
    echo "1. Check Disk Usage"
    echo "2. Monitor Running Services"
    echo "3. Assess Memory Usage"
    echo "4. Evaluate CPU Usage"
    echo "5. Send System Health Report via Email"
    echo "6. Exit"
    read -rp "Enter your choice: " choice

    case $choice in
        1) check_disk_usage ;;
        2) monitor_services ;;
        3) assess_memory ;;
        4) evaluate_cpu ;;
        5) send_report ;;
        6) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
    read -rp "Press Enter to continue..."  
done


