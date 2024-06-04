--将json数据读取到Lua表中存储起来

--先把Json表从AB包中加载出来
local txt = ABMgr:LoadRes("json", "ItemData", typeof(TextAsset))
print(txt.text)
--得到对应的表
local itemList = Json.decode(txt.text)
print(itemList[1].id .. itemList[1].name)
--得到的是一个类似数组的表结构，不利于我们访问。
--我们可以把它存到一个全局表中，键值对形式，键为id，值为当前id对应的一条数据
ItemData = {}
for _, value in pairs(itemList) do
    ItemData[value.id] = value
end