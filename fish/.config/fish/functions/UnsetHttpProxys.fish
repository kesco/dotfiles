function UnsetHttpProxys
  set -e http_proxy
  set -e https_proxy
  echo "Unsetting Clash Http Proxy"
end
