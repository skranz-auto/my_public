# Check Python
cat("\nCheck reticulate python...\n")
library(reticulate)
reticulate::source_python("~/scripts/hello.py")
hello_py()

cat("\nDownload OI package\n")

reticulate::source_python("~/scripts/download_oicpsr.py")

login_email = Sys.getenv("OI_EMAIL")
login_password = Sys.getenv("OI_PASSWORD")
outfile = "oi.zip"
outdir = '/root/output'
pid = "112829"

download_oicpsr(pid,login_email,login_password,outfile,outdir)


cat("\nCheck Secrets\n")

cat('\n\nSys.getenv("MYSECRET") = ', Sys.getenv("MYSECRET"))

cat('\n\nSys.getenv("MYSECRET2") = ', Sys.getenv("MYSECRET2"))

txt = Sys.getenv("MYSECRET")
if (!is.null(txt)) {
  cat("\nWrite MYSECRET")
  writeLines(txt, "/root/output/mysecret.txt")
}

txt = Sys.getenv("MYSECRET2")
if (!is.null(txt)) {
  cat("\nWrite MYSECRET2")
  writeLines(txt, "/root/output/mysecret2.txt")
}

