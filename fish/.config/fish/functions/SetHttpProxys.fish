function SetHttpProxys
  set -gx http_proxy http://127.0.0.1:7890
  set -gx https_proxy http://127.0.0.1:7890
  echo "Setting Clash Http Proxy"
end
