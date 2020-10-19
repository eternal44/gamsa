save as reference
  https://www.digitalocean.com/community/tutorials/how-to-automate-deployments-to-digitalocean-kubernetes-with-circleci


script / cheatsheet for infra configs
  https://gist.githubusercontent.com/kenmoini/40d8e53212afa91a5b33e84cb2c2ac3b/raw/615b6242c56fb76cb1969126005f92bff2f5528b/config_dns.sh


DO terraform walk thru:
  https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean




TODO:
run the following:
step 6:
  kubectl apply -f ~/kube/
  kubectl port-forward $(kubectl get pod --selector="app=gamsa" --output jsonpath='{.items[0].metadata.name}') 8080:80
  curl localhost:8080
    NOTE: this is now being served remotely on DO but request outputs are
    being output locally
