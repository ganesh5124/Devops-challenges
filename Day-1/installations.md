Steps followed while doing this task
1. Create one ec2 instance must allow port 22(SSH), 25 (SMTP)
2. Login to instance install necessary packages 
    * sudo apt update
    * sudo apt install mailutils -y
    * sudo vim /etc/postfix/main.cf
        relayhost = [smtp.gmail.com]:587
        smtp_use_tls = yes
        smtp_sasl_auth_enable = yes
        smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
        smtp_sasl_security_options = noanonymous
        smtp_tls_security_level = encrypt
        smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt*
    
    * sudo vim /etc/postfix/sasl_passwd
    [smtp.gmail.com]:587 pvganeshkumar1999@gmail.com:efsg imtp ibxy tlqu
    # change necessary permissions
    sudo chmod 600 /etc/postfix/sasl_passwd
    sudo postmap /etc/postfix/sasl_passwd
    sudo systemctl restart postfix