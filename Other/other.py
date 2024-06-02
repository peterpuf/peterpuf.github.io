"""
处理并自动生成一个other index的markdown. 每次自动更新
"""


import os

def generate_markdown_for_files(directory):
    files = os.listdir(directory)
    # 获取文件创建时间并排序
    files_with_ctime = [(file, os.path.getctime(os.path.join(directory, file))) for file in files if os.path.isfile(os.path.join(directory, file))]
    files_with_ctime.sort(key=lambda x: x[1])

    markdown_lines = ["# 待整理文件清单\n"]
    black_list = ['.DS_Store', 'other.py', 'index.md']
    for file, ctime in files_with_ctime:
        if file in black_list:
            continue
        markdown_lines.append(f"- [{file}](./{file})")
        markdown_lines.append("<br />\n")
    
    return "\n".join(markdown_lines)

# 当前目录
current_directory = os.getcwd()
# 生成 Markdown 内容
markdown_content = generate_markdown_for_files(current_directory)

# 写入到 Markdown 文件
with open("index.md", "w") as f:
    f.write(markdown_content)

print("更新并生成完毕")
