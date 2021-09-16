```bash
git submodule add git@github.com:modiamir/phpimage.git
cp ./phpimage/Makefile .
echo "IP_PREFIX=10.100.101" >> .env # Replace 10.100.101 with any local ip prefix you prefer
make up
```
