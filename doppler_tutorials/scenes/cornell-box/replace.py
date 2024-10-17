# 创建一个变量并存储我们要搜索的文本

# 创建一个变量并存储我们要添加的文本
for n in range(0,16):
	# 使用 open() 函数以只读模式打开我们的文本文件
	with open(r"./scenes/cornell-box/doppler_point_correlated_sampler_forward.xml", 'r',encoding='UTF-8') as file:

		# 使用 read() 函数读取文件内容并将它们存储在一个新变量中
		data = file.read()
		#search_text1 = 'z="-0.500"'
		#search_text2 = 'z="-0.450"'
		#replace_text1='z="{:.2f}"'.format(-0.5-0.05*n) 
		#replace_text2='z="{:.2f}"'.format(-0.5-0.05*(n+1)) 
		#data = data.replace(search_text1, replace_text1)
		#data = data.replace(search_text2, replace_text2)

		search_text1 = 'z="0.000"'
		search_text2 = 'z="0.001"'
		replace_text1='z="{:.2f}"'.format(-1.5+0.2*n) 
		replace_text2='z="{:.2f}"'.format(-1.5+0.2*(n+1)) 
		# 使用 replace() 函数搜索和替换文本
		data = data.replace(search_text1, replace_text1)
		data = data.replace(search_text2, replace_text2)
	save_path= './scenes/cornell-box/doppler_point_correlated_sampler_forward'+str(n)+'.xml'
	# 以只写模式打开我们的文本文件以写入替换的内容
	with open(save_path, 'w',encoding='UTF-8') as file:

		# 在我们的文本文件中写入替换的数据
		file.write(data)

	# 打印文本已替换
	print("文本已替换")


for n in range(0,16):
	# 使用 open() 函数以只读模式打开我们的文本文件
	with open(r"./scenes/cornell-box/doppler_point_correlated_sampler_backward.xml", 'r',encoding='UTF-8') as file:

		# 使用 read() 函数读取文件内容并将它们存储在一个新变量中
		data = file.read()
		search_text1 = 'z="-0.500"'
		search_text2 = 'z="-0.450"'
		replace_text1='z="{:.2f}"'.format(-0.5-0.1*n) 
		replace_text2='z="{:.2f}"'.format(-0.5-0.1*(n+1)) 
		data = data.replace(search_text1, replace_text1)
		data = data.replace(search_text2, replace_text2)

		#search_text1 = 'z="-1.200"'
		#search_text2 = 'z="-1.150"'
		#replace_text1='z="{:.2f}"'.format(-1.2+0.05*n) 
		#replace_text2='z="{:.2f}"'.format(-1.2+0.05*(n+1)) 
		## 使用 replace() 函数搜索和替换文本
		#data = data.replace(search_text1, replace_text1)
		#data = data.replace(search_text2, replace_text2)
	save_path= './scenes/cornell-box/doppler_point_correlated_sampler_backward'+str(n)+'.xml'
	# 以只写模式打开我们的文本文件以写入替换的内容
	with open(save_path, 'w',encoding='UTF-8') as file:

		# 在我们的文本文件中写入替换的数据
		file.write(data)

	# 打印文本已替换
	print("文本已替换")


for n in range(0,16):
	# 使用 open() 函数以只读模式打开我们的文本文件
	with open(r"./scenes/cornell-box/doppler_point_correlated_sampler_both.xml", 'r',encoding='UTF-8') as file:

		# 使用 read() 函数读取文件内容并将它们存储在一个新变量中
		data = file.read()
		search_text1 = 'z="-0.000"'
		search_text2 = 'z="-0.100"'
		replace_text1='z="{:.2f}"'.format(-0.5-0.1*n) 
		replace_text2='z="{:.2f}"'.format(-0.5-0.1*(n+1)) 
		data = data.replace(search_text1, replace_text1)
		data = data.replace(search_text2, replace_text2)

		search_text1 = 'z="0.000"'
		search_text2 = 'z="0.100"'
		replace_text1='z="{:.2f}"'.format(-1.2+0.1*n) 
		replace_text2='z="{:.2f}"'.format(-1.2+0.1*(n+1)) 
		# 使用 replace() 函数搜索和替换文本
		data = data.replace(search_text1, replace_text1)
		data = data.replace(search_text2, replace_text2)
	save_path= './scenes/cornell-box/doppler_point_correlated_sampler_both'+str(n)+'.xml'
	# 以只写模式打开我们的文本文件以写入替换的内容
	with open(save_path, 'w',encoding='UTF-8') as file:

		# 在我们的文本文件中写入替换的数据
		file.write(data)

	# 打印文本已替换
	print("文本已替换")



for n in range(0,7):
	# 使用 open() 函数以只读模式打开我们的文本文件
	with open(r"./scenes/cornell-box/doppler_point_correlated_sampler_ball.xml", 'r',encoding='UTF-8') as file:

		# 使用 read() 函数读取文件内容并将它们存储在一个新变量中
		data = file.read()
		search_text1 = 'y="0.000"'
		search_text2 = 'y="0.001"'
		replace_text1='y="{:.5f}"'.format(1.2-0.05*n) 
		replace_text2='y="{:.5f}"'.format(1.2-0.05*(n+0.1)) 
		data = data.replace(search_text1, replace_text1)
		data = data.replace(search_text2, replace_text2)

	save_path= './scenes/cornell-box/doppler_point_correlated_sampler_ball'+str(n)+'.xml'
	# 以只写模式打开我们的文本文件以写入替换的内容
	with open(save_path, 'w',encoding='UTF-8') as file:

		# 在我们的文本文件中写入替换的数据
		file.write(data)

	# 打印文本已替换
	print("文本已替换")
