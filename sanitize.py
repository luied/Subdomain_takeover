f = open('ips.txt')

for linha in f:
	limpo = open('limpo.txt')
	if linha in limpo.read():
		limpo.close()
		continue
	if "104.16.5" in limpo.read():
		continue
	else:
		limpo = open('limpo.txt','a')
		limpo.write(linha)
		limpo.close()
	        print(linha)
