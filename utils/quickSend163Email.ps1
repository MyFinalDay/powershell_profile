#     $From = "vipyouxiang7777@163.com";
#     $To = "lhb@gznuode.cn";
#     $Subject = "oneSTestSubject" ;
#     $Body = "a88TestBody";
#     $smtpServer = "smtp.163.com";
#     $smtpPort = 25;
#     $username = "vipyouxiang7777@163.com";
#     $password = "linhongbin999";

#     $SMTPMessage = New-Object System.Net.Mail.MailMessage($From, $To, $Subject, $Body);
#     $SMTPClient = New-Object Net.Mail.SmtpClient($smtpServer, $SmtpPort) ;
#     $SMTPClient.EnableSsl = $false ;
#     $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($username, $password); 
#     $SMTPClient.Send($SMTPMessage);

function quickSend163Email {
    param(
        [string]$subject = (Get-Date),
        [Parameter(Mandatory = $true)]            
        [string]$body,
        [string] $to = "lhb@gznuode.cn"
    )

    $From = "vipyouxiang7777@163.com";
    $To = $to;
    $Subject = $subject;
    $Body = $body;
    $smtpServer = "smtp.163.com";
    $smtpPort = 25;
    $username = "vipyouxiang7777@163.com";
    $password = "linhongbin999";

    $SMTPMessage = New-Object System.Net.Mail.MailMessage($From, $To, $Subject, $Body);
    $SMTPClient = New-Object Net.Mail.SmtpClient($smtpServer, $SmtpPort) ;
    $SMTPClient.EnableSsl = $false ;
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($username, $password); 
    $SMTPClient.Send($SMTPMessage);
}