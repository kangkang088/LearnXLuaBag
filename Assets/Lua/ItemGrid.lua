Object:subClass("ItemGrid")

ItemGrid.obj = nil
ItemGrid.ImgIcon = nil
ItemGrid.Text = nil

function ItemGrid:Init(father, posX, posY)
    self.obj = ABMgr:LoadRes("ui", "ItemGrid")
    --设置位置
    self.obj.transform:SetParent(father, false)
    self.obj.transform.localPosition = Vector3(posX, posY, 0)
    --找控件
    self.ImgIcon = self.obj.transform:Find("ImgIcon"):GetComponent(typeof(Image))
    self.Text = self.obj.transform:Find("Text"):GetComponent(typeof(Text))
end

function ItemGrid:InitData(data)
    local itemData = ItemData[data.id]
    local strs = string.split(itemData.icon, "_")
    local spriteAtlas = ABMgr:LoadRes("ui", strs[1], typeof(SpriteAtlas))
    self.ImgIcon.sprite = spriteAtlas:GetSprite(strs[2])

    --设置数量
    self.Text.text = data.num
end

function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end
